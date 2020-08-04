<%@page import="java.sql.*"%>
<%
	//String db = request.getParameter("db");
	String db = "concurso";
	String user 	= "USER";
	String passwd	= "CAUser";
	
	Connection conn = null;
	Statement stmt	= null;
	ResultSet rs	= null;
	
	String sql = null;
	Integer sem = null;
	String qs = null;
	Integer reid = null;
	
	HttpSession preguntas = request.getSession();
	
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
		
		sql = "SELECT p.pregunta, pr.respuesta_id FROM preg_respon pr, preguntas p WHERE pr.resp_al IS NOT NULL AND pr.pregunta_id = p.pregunta_id AND pr.calificacion IS NULL AND p.semestre_id =" + sem + " AND pr.hora_resp IS NOT NULL";
		
		rs = stmt.executeQuery(sql);
		
		if(rs.next())
		{
			qs = rs.getString("pregunta");
			reid = rs.getInt("respuesta_id");
			preguntas.setAttribute("reid", reid);
			out.println(qs);
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