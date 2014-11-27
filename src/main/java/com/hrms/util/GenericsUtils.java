package com.hrms.util;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class GenericsUtils { 
	  private static final Log log = LogFactory.getLog(GenericsUtils.class); 

	  private GenericsUtils() { 
	  } 
	  
	  @SuppressWarnings("unchecked")
	public static Class getSuperClassGenricType(Class clazz) { 
		    return getSuperClassGenricType(clazz, 0); 
		  } 
	  
	  @SuppressWarnings("unchecked")
	public static Class getSuperClassGenricType(Class clazz, int index) 
      throws IndexOutOfBoundsException { 

    Type genType = clazz.getGenericSuperclass(); 
//    Type genType = clazz; 

    if (!(genType instanceof ParameterizedType)) { 
      log.warn(clazz.getSimpleName() 
          + "'s superclass not ParameterizedType"); 
      return clazz; 
    } 

    Type[] params = ((ParameterizedType) genType).getActualTypeArguments(); 

    if (index >= params.length || index < 0) { 
      log.warn("Index: " + index + ", Size of " + clazz.getSimpleName() 
          + "'s Parameterized Type: " + params.length); 
      return Object.class; 
    } 
    if (!(params[index] instanceof Class)) { 
      log 
          .warn(clazz.getSimpleName() 
              + " not set the actual class on superclass generic parameter"); 
      return Object.class; 
    } 
    return (Class) params[index]; 
  } 
	
	  @SuppressWarnings("unchecked")
	public static <T> Class<T> getClassGenricType(final Class clazz) {
		  return(Class<T>)((ParameterizedType)clazz.getGenericSuperclass()).getActualTypeArguments()[0];
	  }
	  

}
