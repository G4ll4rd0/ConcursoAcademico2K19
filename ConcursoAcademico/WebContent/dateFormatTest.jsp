<%@page import="java.util.Date"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

Date date = Calendar.getInstance().getTime();  
DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
String strDate = dateFormat.format(date);
System.out.println("24hrs: "+strDate);
out.println("24hrs: "+strDate);

Format f 		= new SimpleDateFormat("hh:mm:ss");
String sthr 	= f.format(new Date());
System.out.println("12hrs: "+sthr);
out.println("12hrs: "+sthr);

Format fi 		= new SimpleDateFormat("HH:mm:ss");
String sthri 	= fi.format(new Date());
System.out.println("24hrs pt2: "+sthri);
out.println("24hrs pt2: "+sthri);

%>

</body>
</html>