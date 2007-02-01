package org.alt60m.util;

import java.sql.Time;
import java.util.*;
import java.lang.reflect.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ObjectHashUtil {
	private static Log log = LogFactory.getLog(ObjectHashUtil.class);
    static public Collection<Hashtable<String, Object>> list(Collection colObjects) { //throws Exception {

		Collection<Hashtable<String, Object>> results = new Vector<Hashtable<String, Object>>();
        for(Iterator iObjects = colObjects.iterator();iObjects.hasNext();) {
			results.add(obj2hash(iObjects.next()));
        }
        return results;
    }
    static public Collection list(Collection colObjects, String[] fields) throws Exception {

		Collection<Hashtable<String, Object>> results = new Vector<Hashtable<String, Object>>();
        for(Iterator iObjects = colObjects.iterator();iObjects.hasNext();) {
			results.add(obj2hash(iObjects.next(), fields));
        }
        return results;
    }
	static public Hashtable<String, Object> obj2hash(Object object) {
		Hashtable<String, Object> h = new Hashtable<String, Object>();
		Object[] arguments = new Object[] {};
		Class c = object.getClass();
		Method[] publicMethods = c.getMethods();
		for (int i = 0; i < publicMethods.length; i++) {
			Method method = publicMethods[i];
			String methodName = method.getName();
            //Verify that the method starts with get, and is not in our list of methods to skip.
			if (methodName.startsWith("get") &&
					(method.getParameterTypes().length == 0) &&
					(-1 == ";getEJBHome;getHandle;getPrimaryKey;getClass;getAttribute;getFieldValue;getHeaderName;getColumnName;getXML;getAutoCommit;getDBIOTableName;getDBIOTableDef;getCustomFields;getUltrasoft;getAutodetectProperties".indexOf(methodName)) ) {
				String key = methodName.substring(3);
				try {
				  Method m = c.getMethod(methodName, (Class []) null);
				  if (checkReturnType(m.getReturnType())) {
                    Object result = m.invoke(object, arguments);
                    if(result==null && java.lang.String.class.isAssignableFrom(m.getReturnType())) {
						h.put(key, "");
                    } else {
                        h.put(key, result);
                    }
                  }
				} catch (IllegalAccessException e) {
				  log.debug(e);
				} catch (InvocationTargetException e) {
				  log.debug("method: " + methodName + " " + e);
				} catch (NoSuchMethodException e) {
				  log.debug("Method does not exist: "+methodName);
				} catch (IllegalArgumentException e) {
				  log.debug(methodName + " " + e);
				} catch (NullPointerException e) {
				}
			}
	  }
	  return h;
	}
	static public Hashtable<String, Object> obj2hash(Object o, String[] fields) {
		Hashtable<String, Object> h = new Hashtable<String, Object>();
		Class c = o.getClass();
		for (int i = 0; i < fields.length; i++) {
			String methodName = "get" + fields[i];
			try {
			  Method m = c.getMethod(methodName, (Class []) null);
			  h.put(fields[i], m.invoke(o, new Object[] {} ));
			} catch (IllegalAccessException e) {
			  log.debug(e);
			} catch (InvocationTargetException e) {
			  log.debug("method: " + methodName + " " + e);
			} catch (NoSuchMethodException e) {
			  log.debug(e);
			} catch (IllegalArgumentException e) {
			  log.debug(methodName + " " + e);
			} catch (NullPointerException e) {
			}
	  }
	  return h;
	}
	static public void hash2obj(Map<String, String> request, Object object) {
		Class objectClass = object.getClass();
		Object[] arguments = null;
		Method[] methods = objectClass.getMethods();
		Map<String, Class<?>> getterReturnTypes = new HashMap<String, Class<?>>();
		Map<String, Method> setterMethods = new HashMap<String, Method>();
		for (Method method : methods) {
			String methodName = method.getName();
			if (methodName.length() > 3) {
				String property = methodName.substring(3);
				if (methodName.startsWith("set")) {
					setterMethods.put(property, method);
				}
				if (methodName.startsWith("get")) {
					getterReturnTypes.put(property, method.getReturnType());
				}
			}
		}
		for (String property : request.keySet()) {
			String value = request.get(property);
			boolean ignore = false;
			try {
				Method setterMethod = setterMethods.get(property);
				if (setterMethod == null) {
					log.debug("Property " + property
							+ " does not exist for class" + objectClass);
					// but otherwise silently ignore it
				} else {
					Class<?> getterReturnType = getterReturnTypes.get(property);
					Object argument = null;
					if (getterReturnType.equals(boolean.class)) {
						argument = new Boolean(value);
					} else if (getterReturnType == String.class) {
						Class setterArgType = setterMethod.getParameterTypes()[0];
						if (setterArgType.equals(int.class)) {
							// I'm not sure why you'd have a String getter and
							// an int setter, but for (potential) legacy code...
							argument = new Integer(value);
						} else {
							argument = value;
						}
					} else if (getterReturnType == Date.class) {
						if (value.trim().equals("")) {
							ignore = true;
						} else {
							argument = DateUtils.parseDate(value);
						}
					} else if (getterReturnType == Time.class) {
						argument = Time.valueOf(value);
					} else if (getterReturnType == int.class) {
						if (value.trim().equals("")) {
							ignore = true;
						} else {
							argument = new Integer(value.replace(",", ""));
						}
					} else if (getterReturnType == long.class) {
						argument = new Long(value.replace(",", ""));
					} else if (getterReturnType == float.class) {
						argument = new Float(value.replace(",", ""));
					}
					if (! ignore) {
						arguments = new Object[] { argument };
						setterMethod.invoke(object, arguments);
					}
				}
			} catch (NumberFormatException e) {
				//needs to cause error page for user, or be caught to let app display formatting message
				throw e;
			} catch (Exception e) {
				log.error("Couldn't set: '" + property + "', Value: " + value + ", because: " + e);
				throw new RuntimeException(e);
			}
		}
	}
	static boolean checkReturnType(Class returnType) {
		if (returnType.isPrimitive() || java.lang.String.class.isAssignableFrom(returnType) || Date.class.isAssignableFrom(returnType)) {
			return true;
		} else {
			return false;
		}
	}
	//TODO: should be included in dbio
	public static int countIt(com.kenburcham.framework.dbio.DBIOEntity o, String qry){
		try{
			com.kenburcham.framework.dbio.DBIOTransaction tx = o.getTransaction();
			tx.setSQL(qry);
			tx.getRecords();
			java.sql.ResultSet mine = tx.getResultSet();
			if (mine.next()) {
				return mine.getInt(1);
			} else {
				return 0;
			}

		} catch (Exception e){
			log.error(e, e);
			return 0;
		}
	}

}
