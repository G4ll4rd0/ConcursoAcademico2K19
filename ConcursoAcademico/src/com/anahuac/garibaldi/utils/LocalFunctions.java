package com.anahuac.garibaldi.utils;

public class LocalFunctions
{

	public LocalFunctions() { }
	
   /** Metodo de extraccion nombre de la pagina
    * @param URI de la pagina ejecutada.
    */
    public static String getPage(String uri)
    {
    	String results = "";
    	
		results = uri.substring(uri.lastIndexOf("/") + 1); //page.jsp
		
    	return results;
    }

    /** Metodo de extraccion nombre de la pagina sin extencion
    * @param URI de la pagina ejecutada.
    */
    public static String getPageNoExt(String uri)
    {
    	String results = "";
    	
    	results = getPage(uri);
    	results = results.substring(0, results.indexOf("."));	//page[.jsp]
    	
    	return results;
    }

}
