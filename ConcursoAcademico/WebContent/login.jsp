<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
final boolean DEBUG = true;

String us = "";
String pw = "";

if (DEBUG)
{
	us = "1AEquipo";
	pw = "calorificacion";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="LogInFile.jsp" method="post">
Usuario: <input type="text" placeholder="Enter Username" name="us" id="us" value=<%=us %>>
<br/>
Contraseña: <input type="text" placeholder="Contraseña" name="pw" id="pw" value=<%=pw %>>
<br/>
<button type="submit">Login</button>
</form>
</body>
</html>