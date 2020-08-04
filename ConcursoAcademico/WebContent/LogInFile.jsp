<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <title>Concurso academico</title>
      <link href="css/principal.css" rel="stylesheet" type="text/css" />
      <link href="css/principal.css" rel="stylesheet" type="text/css" />
      <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
      <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
      <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css" />
      <link href="css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css" />
      <link href="css/bootstrap-grid.min.css" rel="stylesheet" type="text/css" />
      <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css" />
      <link rel="stylesheet" type="text/css" href="css/CACSS.css">
   </head> 
   <body>
    	<!-- Barra superior -->
		<header>Concurso Académico 2019</header>

    <!-- Div -->
    <div>
<%@page import="java.sql.*"%>
<% //@ include file="Database.jsp" %>
<%
final boolean DEBUG = false;
	//String db = request.getParameter("db");
	String db 		= "concurso";
	String user 	= "USER2";
	String passwd	= "CAUser";
	
	Connection conn = null;
	Statement stmt	= null;
	ResultSet rs	= null;
	
	String sql 		= null;
	String prnt 	= "<br/>Usuario o contraseña incorrectos";
	int t 			= 0;
	int id 			= 0;
	String us 		= null;
	String pw = null;
	
	us = request.getParameter("us") == null ? "": request.getParameter("us");
	pw = request.getParameter("pw") == null ? "": request.getParameter("pw");
	
	HttpSession sesion = request.getSession();
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		stmt = conn.createStatement();
		
		sql  = "SELECT tipo_id, user_id FROM usuarios WHERE username ='" + us + "' AND passwd ='" + pw + "'";
		
		rs   = stmt.executeQuery(sql);
		
		if (rs.next())
		{
			t  = rs.getInt("tipo_id");
			id = rs.getInt("user_id");
			sesion.setAttribute("idr", id);
			sesion.setAttribute("tr",t);
		}
		String servidor = "http://" + request.getServerName()+ ":" + request.getServerPort()+ "/concurso/";
		String pagina 	= null;
		
		try{conn.close();}catch(Exception e){}
		
		switch (t)
		{
			case 1:
			case 2:
				pagina = "alumnos.jsp";
			    response.sendRedirect(servidor + pagina);
				break;
			case 3:
				pagina = "maestros.jsp";
			    response.sendRedirect(servidor + pagina);
				break;
			case 4:
				pagina = "Admin.html";
			    response.sendRedirect(servidor + pagina);
				break;
			default:
				out.println("<br/><button type= \"button\" class = \"btn btn-outline-success\" style = \"position: absolute;width: 22%;height: 8%; top: 46%; left: 39%;font-family:Roboto Slab;font-style: normal;font-size: 1.25em;\" href=\"#\" onclick=\"javascript:window.history.back();\"> " + prnt + " volver</a>");
				break;
		}
					
		rs.close();
		
	}
	catch(SQLException e)
	{
		out.println("SQLException caught: " + e.getMessage());
	}
	finally
	{
		try{rs.close();} catch(Exception e){}
		try{stmt.close();} catch(Exception e){}
		try{conn.close();} catch(Exception e){}
	}
%>

    </div>

    	<!-- Barra inferior -->
		<footer>Ingenierías XXVIII</footer>
	</body>
</html>