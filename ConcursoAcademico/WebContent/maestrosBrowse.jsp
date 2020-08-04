<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/principal.css" rel="stylesheet" type="text/css" />
    <link href="css/principal.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-grid.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/CACSS.css">
    <title>Concurso académico | Administrador</title>
</head>
<body>

<%@page import="java.sql.*"%>
<%
	//String db = request.getParameter("db");
	String db = "concurso";
	String user 	= "USER2";
	String passwd	= "CAUser";
	
	Connection conn = null;
	Statement stmt	= null;
	ResultSet rs	= null;
	
	String sql = null;
	Integer sem = null;
	String qs = null;
	String re = null;
	String reAl = null;
	Integer reid = null;
	String userna = null;
	
	HttpSession sesion = request.getSession();
	Integer id = (Integer)sesion.getAttribute("idr");
	
	if(id == 25)
	{
		sem = 1;
	}
	else if (id == 26)
	{
		sem = 2;
	}
	else if (id == 27)
	{
		sem = 3;
	}
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		stmt = conn.createStatement();
		
		sql = "SELECT pr.resp_al, p.pregunta, p.respuesta, pr.respuesta_id, u.username FROM preg_respon pr, preguntas p, usuarios u WHERE pr.resp_al IS NOT NULL AND pr.pregunta_id = p.pregunta_id AND pr.calificacion IS NULL AND p.semestre_id =" + sem + " AND pr.hora_resp IS NOT NULL AND pr.user_id = u.user_id";
		
		rs = stmt.executeQuery(sql);
		
		if(rs.next());
		{
			qs = rs.getString("pregunta");
			re = rs.getString ("respuesta");
			reAl = rs.getString("resp_al");
			reid = rs.getInt("respuesta_id");
			userna = rs.getString("username");
			re = re.toUpperCase();
			
			sesion.setAttribute("reid", reid);
			
		out.println("<!-- Cuadro de pregunta --><div type=\"text\" id=\"pregunta\" class=\"maestrosBrowsePreg\" style= \"left: 36.5%;top: 37%;\">" + qs + "</div><h1 class=\"maestrosBrowsePreg\" style= \"left: 44%;top: 26%;\">Pregunta</h1><!-- Cuadro respuesta alumno --><div type= \"text \" id= \"ra \" class=\"maestrosBrowseResAl\" style= \"left: 65.8%;top: 65%;\">" + reAl + "</div><h1 class=\"maestrosBrowseResAl\" style= \"left: 69%;top: 72.5%;\">Respuesta alumno</h1><!-- Cuadro respuesta correcta --><div type= \"text \" id= \"rc \" class=\"maestrosBrowseResCo\" style= \" left: 7%;top: 65%;\">" + re + "</div><h1 class=\"maestrosBrowseResCo\" style= \"left: 9%;top: 72.5%;\">Respuesta correcta</h1><!-- Cuadro username --><div type= \"text \" id= \"us \" class=\"maestrosBrowseGrupo\" style= \"left: 25%;top: 50%;\">" + userna + "</div><h1 class=\"maestrosBrowseGrupo\" style= \"left: 25%;top: 39%;\">Grupo</h1>");
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

</body>
</html>