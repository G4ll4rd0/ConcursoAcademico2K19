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
	String re = null;
	
	HttpSession preguntas = request.getSession();
	Integer reid = (Integer)preguntas.getAttribute("reid");
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		stmt = conn.createStatement();
		
		sql = "SELECT p.respuesta FROM preg_respon pr, preguntas p WHERE pr.resp_al IS NOT NULL AND pr.pregunta_id = p.pregunta_id AND pr.respuesta_id = " + reid + "AND pr.calificacion IS NULL AND pr.hora_resp IS NOT NULL";
		
		rs = stmt.executeQuery(sql);
		
		if(rs.next())
		{
			re = rs.getString("respuesta");
			out.println(re);
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