package org.alt60m.fsk2.controller;

import junit.framework.TestCase;


import java.beans.PropertyEditor;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.alt60m.fsk2.model.Persistent;
import org.apache.commons.httpclient.util.DateUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockServletContext;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.context.support.XmlWebApplicationContext;

public abstract class BaseControllerTestCase extends TestCase {
	public BaseControllerTestCase()
	{super("Controller Test");}
	
	public BaseControllerTestCase(String name)
	{
		super(name);
	}
	
    protected transient final Log log = LogFactory.getLog(getClass());
    protected static XmlWebApplicationContext ctx;
    //protected User user;

    // This static block ensures that Spring's BeanFactory is only loaded
    // once for all tests
    static {
    	System.setProperty("hibernate.bytecode.use_reflection_optimizer", "false");
        String[] paths = {
                "classpath*:/org/alt60m/fsk2/manager/fsk2-dao.xml",
                "classpath*:/org/alt60m/fsk2/controller/fsk2-servlet.xml",
            };

        ctx = new XmlWebApplicationContext();
        ctx.setConfigLocations(paths);
        ctx.setServletContext(new MockServletContext(""));
        ctx.refresh();
    }

    protected void setUp() throws Exception {
    	super.setUp();
    	
    	//set up a current user;
    	//set up security, maybe
    }

    /**
     * Convenience methods to make tests simpler
     */
    public MockHttpServletRequest newPost(String url) {
        return new MockHttpServletRequest("POST", url);
    }

    public MockHttpServletRequest newGet(String url) {
        return new MockHttpServletRequest("GET", url);
    }

    
    /**
     * Useful for not having to worry about getting the parameters right
     * @param o
     * @param request
     */
    public static void objectToRequestParameters(Object o, MockHttpServletRequest request)
    {
    	ServletRequestDataBinder binder = new ServletRequestDataBinder(o);
    	objectToRequestParameters(o, request, binder, 1);
    }
    
    public static void objectToRequestParameters(Object o, MockHttpServletRequest request, ServletRequestDataBinder binder) {
    	objectToRequestParameters(o, request, binder, 1);
    }
    
    
    public static void objectToRequestParameters(Object o, MockHttpServletRequest request, ServletRequestDataBinder binder, int depth) {
        if (depth < 0)
        	return;
    	if (o == null)
        	return;
    	objectToRequestParameters(o, request, binder, depth, null, new HashSet<Object>());
    }

    /**
     * Don't send in Maps; it won't work right (o can contain maps, though)
     * @param o
     * @param request
     * @param depth
     * @param prefix
     * @param processed
     */
    private static void objectToRequestParameters(Object o, MockHttpServletRequest request, ServletRequestDataBinder binder, int depth, String prefix, Collection<Object> processed) {
        if (depth < 0)
        	return;
        if (prefix != null && binder.findCustomEditor(o.getClass(), prefix) != null)
		{
			PropertyEditor editor = binder.findCustomEditor(o.getClass(), prefix);
			editor.setValue(o);
			String paramValue = editor.getAsText();
			request.addParameter(prefix, paramValue);
		}
		else {
			processed.add(o);

			Class clazz = o.getClass();
			Field[] fields = getDeclaredFields(clazz);
			AccessibleObject.setAccessible(fields, true);
			try {
				for (int i = 0; i < fields.length; i++) {
					Field field = fields[i];
					Object fieldValue = (field.get(o));
					if (!processed.contains(fieldValue) && fieldValue != null) {
						String prePath = (prefix == null ? "" : prefix + ".");
						String path = prePath + field.getName();

						if (fieldValue instanceof Persistent) {
							objectToRequestParameters(fieldValue, request,
									binder, depth - 1, prePath
											+ field.getName(), processed);
						} else if (fieldValue instanceof Map) {
							Map fieldm = (Map) fieldValue;
							for (Object key : fieldm.keySet()) {
								Object value = fieldm.get(key);
								objectToRequestParameters(value, request,
										binder, depth - 1, prePath
												+ field.getName() + "["
												+ key.toString() + "]",
										processed);

							}
						} else if (!(fieldValue instanceof List)
								&& !(fieldValue instanceof Set)) {
							String paramName = field.getName();

							if (prefix != null) {
								paramName = prefix + "." + paramName;
							}
							// assert paramName.equals(path);

							String paramValue = String.valueOf(fieldValue);

							// handle Dates
							if (fieldValue instanceof java.util.Date) {
								paramValue = DateUtil.formatDate((Date) fieldValue);
										
								if ("null".equals(paramValue))
									paramValue = "";
							}

							request.addParameter(paramName, paramValue);
						}
					}
				}
			} catch (IllegalAccessException e) {
				// runtime exceptions are easier to handle; test
				// code gets kinda clunky (especially if must be wrapped in
				// doInHiberante methods)
				throw new RuntimeException(e);
			}
		}
    }
    
    private static Field[] getDeclaredFields(Class clazz) {
        Field[] f = new Field[0];
        Class superClazz = clazz.getSuperclass();
        Collection rval = new ArrayList();
        
        if (superClazz != null) {
            rval.addAll(Arrays.asList(getDeclaredFields(superClazz)));
        }
        
        rval.addAll(Arrays.asList(clazz.getDeclaredFields()));
        return (Field[]) rval.toArray(f);
    }
}
