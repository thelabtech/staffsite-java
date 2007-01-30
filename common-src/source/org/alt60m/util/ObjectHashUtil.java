package org.alt60m.util;

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
	static public Hashtable<String, Object> obj2hash(Object o) {
		Hashtable<String, Object> h = new Hashtable<String, Object>();
		Object[] arguments = new Object[] {};
		Class c = o.getClass();
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
                    Object result = m.invoke(o, arguments);
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
	static public void hash2obj(Hashtable request, Object o) {
		Class c = o.getClass();
		Object[] arguments = null;
		Method[] methods = c.getMethods();
		Hashtable<String, Object[]> parameterTypes = new Hashtable<String, Object[]>();
		Hashtable<String, Class<?>> theReturns = new Hashtable<String, Class<?>>();
		for (int i = 0; i < methods.length; i++) {
			if (methods[i].getName().startsWith("set")) {
				parameterTypes.put(methods[i].getName(), methods[i].getParameterTypes());
			}
			if (methods[i].getName().startsWith("get")) {
				theReturns.put(methods[i].getName().substring(3), methods[i].getReturnType());
			}
		}
		for (Enumeration enumer = request.keys(); enumer.hasMoreElements();) {
			String attr = (String) enumer.nextElement();
			try {
				Method m = c.getMethod("set" + attr, (Class[]) parameterTypes.get("set" + attr));
				if (((Class)theReturns.get(attr)).toString().equals("boolean")) {
					arguments = new Object[] {Boolean.class};
					arguments[0] = new Boolean(request.get(attr).toString());
				} else if ((Class)theReturns.get(attr) == String.class) {
					Class[] args = m.getParameterTypes();
					if (args[0].equals(int.class)) {
						arguments = new Object[] {Integer.class};
						arguments[0] = new Integer(request.get(attr).toString());
					} else {
						arguments = new Object[] {request.get(attr).getClass()};
						arguments[0] = request.get(attr);
					}
				} else if ((Class)theReturns.get(attr) == java.util.Date.class) {
                    try {
                        arguments = new Object[] {java.util.Date.class};
//                        java.util.Date date = (Date)request.get(attr);
//                        if (!request.get(attr).getClass().equals(java.util.Date.class)) {
	                        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
	                        java.util.Date date = format.parse((String)request.get(attr));
//                        }
                        arguments[0] = date;
                    } catch(java.text.ParseException e) {
                    	try {
	                        arguments = new Object[] {java.util.Date.class};
	//                        java.util.Date date = (Date)request.get(attr);
	//                        if (!request.get(attr).getClass().equals(java.util.Date.class)) {
	                        	java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("MM/dd/yyyy HH:mm:ss a");
	                        	java.util.Date date = format.parse((String)request.get(attr));
	//                        }
	                        arguments[0] = date;
                    	} catch(java.text.ParseException e1) {
	                        arguments = new Object[] {java.util.Date.class};
	//                        java.util.Date date = (Date)request.get(attr);
	//                        if (!request.get(attr).getClass().equals(java.util.Date.class)) {
	                       	java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("MM/dd/yyyy");
	                       	java.util.Date date = format.parse((String)request.get(attr));
	//                        }
	                        arguments[0] = date;
                       	}
                    }
				} else if ((Class)theReturns.get(attr) == java.sql.Time.class) {
					arguments = new Object[] {request.get(attr).getClass()};
					arguments[0] = java.sql.Time.valueOf((String)request.get(attr));
				} else if (((Class)theReturns.get(attr)).toString().equals("int")) {
					arguments = new Object[] {Integer.class};
					arguments[0] = new Integer(request.get(attr).toString());
				} else if (((Class)theReturns.get(attr)).toString().equals("long")) {
					arguments = new Object[] {Long.class};
					arguments[0] = new Long((String)request.get(attr));
				} else if (((Class)theReturns.get(attr)).toString().equals("float")) {
                    arguments = new Object[] {Float.class};
                    arguments[0] = new Float((String)request.get(attr));
                }

				m.invoke(o, arguments);
			} catch (NoSuchElementException e) {
				//really, this ought to be a log.error, but our code breaks the contract so frequently and
				//I don't want it to spit stack traces everwhere
				log.debug("Couldn't set: '" + attr + "', Value: " + request.get(attr) + ", because: " + e);
			} catch (Exception e) {
				log.error("Couldn't set: '" + attr + "', Value: " + request.get(attr) + ", because: " + e);
			}
		}
	}
	static boolean checkReturnType(Class returnType) {
		if (returnType.isPrimitive() || java.lang.String.class.isAssignableFrom(returnType) || java.util.Date.class.isAssignableFrom(returnType)) {
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
