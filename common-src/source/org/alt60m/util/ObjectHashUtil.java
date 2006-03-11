package org.alt60m.util;

import java.util.*;
import java.lang.reflect.*;

public class ObjectHashUtil {
    static public Collection list(Collection colObjects) { //throws Exception {
 
		Collection results = new Vector();
        for(Iterator iObjects = colObjects.iterator();iObjects.hasNext();) {
			results.add(obj2hash(iObjects.next()));
        }
        return results;
    }
    static public Collection list(Collection colObjects, String[] fields) throws Exception {

		Collection results = new Vector();
        for(Iterator iObjects = colObjects.iterator();iObjects.hasNext();) {
			results.add(obj2hash(iObjects.next(), fields));
        }
        return results;
    }
	static public Hashtable obj2hash(Object o) {
//System.out.println("!!!!!!!!------ START OF OBJECT -------!!!!!!!!!! ");
		Hashtable h = new Hashtable();
		Object[] arguments = new Object[] {};
		Class c = o.getClass();
		Method[] publicMethods = c.getMethods();
		for (int i = 0; i < publicMethods.length; i++) {
			String methodName = publicMethods[i].getName();
            //Verify that the method starts with get, and is not in our list of methods to skip.
			// HOW do we include a new method in the list of methods to skip?
			if (methodName.startsWith("get") && (-1 == ";getEJBHome;getHandle;getPrimaryKey;getClass;getAttribute;getFieldValue;getHeaderName;getColumnName;getXML;getAutoCommit;getDBIOTableName;getDBIOTableDef;getCustomFields;getUltrasoft;getAutodetectProperties".indexOf(methodName)) ) {
				String key = methodName.substring(3);
				try {
				  Method m = c.getMethod(methodName, null);
				  if (checkReturnType(m.getReturnType())) {
                    Object result = m.invoke(o, arguments);
// System.out.println("!!!!!!!!-------------!!!!!!!!!! " + key + " - " + result);
                    if(result==null && java.lang.String.class.isAssignableFrom(m.getReturnType())) {
						h.put(key, "");
                    } else {
                        h.put(key, result);
                    }
                  }
				} catch (IllegalAccessException e) {
				  System.out.println(e);
				} catch (InvocationTargetException e) {
				  System.out.println("method: " + methodName + " " + e);
				} catch (NoSuchMethodException e) {
				  System.out.println(e);
				  System.out.println("Method name in question:"+methodName);
				} catch (IllegalArgumentException e) {
				  System.out.println(methodName + " " + e);
				} catch (NullPointerException e) {                    
				}
			}
	  }
	  return h;
	}
	static public Hashtable obj2hash(Object o, String[] fields) {
		Hashtable h = new Hashtable();
		Class c = o.getClass();
		for (int i = 0; i < fields.length; i++) {
			String methodName = "get" + fields[i];
			try {
			  Method m = c.getMethod(methodName, null);
			  h.put(fields[i], m.invoke(o, new Object[] {} ));
			} catch (IllegalAccessException e) {
			  System.out.println(e);
			} catch (InvocationTargetException e) {
			  System.out.println("method: " + methodName + " " + e);
			} catch (NoSuchMethodException e) {
			  System.out.println(e);
			} catch (IllegalArgumentException e) {
			  System.out.println(methodName + " " + e);
			} catch (NullPointerException e) {                    
			}
	  }
	  return h;
	}
	static public void hash2obj(Hashtable request, Object o) {
		Class c = o.getClass();                
		Object[] arguments = null;
		Method[] methods = c.getMethods();        
		Hashtable parameterTypes = new Hashtable();
		Hashtable theReturns = new Hashtable();
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
			} catch (IllegalAccessException e) {
				System.out.println("Couldn't set: '" + attr + "', Value: " + request.get(attr));
                System.out.println(e.toString());
			} catch (InvocationTargetException e) {
				System.out.println("Couldn't set: '" + attr + "', Value: " + request.get(attr));
                System.out.println(e.toString());
			} catch (IllegalArgumentException e) {
				System.out.println("Couldn't set: '" + attr + "', Value: " + request.get(attr));
                System.out.println(e.toString());
/*				System.err.println("Couldn't set: '" + attr + "', Value: " + request.get(attr));
                System.err.println(e.toString());
                System.err.println("Object Classname: " + attr.getClass().toString());
                try {
                	System.err.println("\tMethod name: " + c.getMethod("set" + attr, (Class[]) parameterTypes.get("set" + attr)).toString());
                } catch (Exception e2) {
                	System.err.println("Couldn't get method name.");
                }
                e.printStackTrace();
*/			} catch (NoSuchMethodException e) {
				System.out.println("Couldn't set: '" + attr + "', Value: " + request.get(attr));
                System.out.println(e.toString());
			} catch (NullPointerException e) {
				System.out.println("Couldn't set: '" + attr + "', Value: " + request.get(attr));
                System.out.println(e.toString());
			} catch (Exception e) {
				System.out.println("Couldn't set: '" + attr + "', Value: " + request.get(attr));
                System.out.println(e.toString());
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
			if(tx.getRecords()){
				java.sql.ResultSet mine = tx.getResultSet();
				if(mine.next()){
					return  mine.getInt(1);
				} else {
					return 0;
				}
			} else {
				return 0;
			}
		} catch (Exception e){
			e.printStackTrace();
			return 0;
		}
	}

}
