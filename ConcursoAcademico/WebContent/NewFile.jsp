<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
       <title>Concurso academico</title>
   </head> 
   <body>
    <!-- Barra superior -->
		<div style="position: absolute;width: 100%;height: 15%;background: #009945;mix-blend-mode: normal;">
			<h1 style="position:absolute;width: 1004px;height: 106px;left: 30px;top: -55px;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 80px;line-height: 106px;color: #FFFFFF;">Concurso Académico 2K19</h1>
		</div>

    <!-- Div -->
    <div>
		<%@page import="java.sql.*"%>
<% //@ include file="Database.jsp" %>
<%
final boolean DEBUG = false;

	//String db = request.getParameter("db");
	String db = "concurso";
	String user 	= "USER";
	String passwd	= "CAUser";
	
	Connection conn = null;
	Statement stmt	= null;
	ResultSet rs	= null;
	
	String sql = null;
	String prnt = "<br/>Usuario o contraseña incorrectos";
	int t = 0;
	int id = 0;
	String us = null;
	String pw = null;
	
	us = request.getParameter("us") == null ? "": request.getParameter("us");
	pw = request.getParameter("pw") == null ? "": request.getParameter("pw");
	
	HttpSession sesion = request.getSession();
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		stmt = conn.createStatement();
		
		sql = "SELECT tipo_id, user_id FROM usuarios WHERE username ='" + us + "' AND passwd ='" + pw + "'";
		
		rs = stmt.executeQuery(sql);
		
		if (rs.next())
		{
			t = rs.getInt("tipo_id");
			id = rs.getInt("user_id");
			sesion.setAttribute("idr", id);
		}
		String servidor = "http://" + request.getServerName()+ ":" + request.getServerPort()+ "/ejemplos/";
		String pagina = null;
		
		switch (t)
		{
			case 1:
			case 2:
				pagina = "Alumnos.jsp";
			    response.sendRedirect(servidor + pagina);
				break;
			case 3:
				pagina = "Maestros.html";
			    response.sendRedirect(servidor + pagina);
				break;
			case 4:
				pagina = "Admin.html";
			    response.sendRedirect(servidor + pagina);
				break;
			default:
				out.println(prnt);
				out.println("<br/><button type= \"button\" style = \" position: absolute;width: 350px;height: 75px; top: 230px; left: 500px;background: #C4C4C4; border: 3px solid #009945;mix-blend-mode: normal;font-family:Roboto Slab;font-style: normal;font-size: 40px;\" href=\"#\" onclick=\"javascript:window.history.back();\">continua aqui</a>");
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
		<div style="position: absolute;width: 100%;height: 15%;top: 88.89%;background: #009945;mix-blend-mode: normal;">
           <h1 style="position:absolute;width: 1004px;height: 106px;align = left;top: -50px;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 60px;line-height: 106px;color: #FFFFFF;">Ingenierías XXVIII</h1>
		</div>
	</body>
</html>