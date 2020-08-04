<%@page import="java.sql.*"%>
<%
	//String db = request.getParameter("db");
	String db = "concurso";
	String user 	= "USER2";
	String passwd	= "CAUser";
	
	Connection conn = null;
	Statement stmt	= null;
	
	String sql = null;
	
	String servidor = "http://" + request.getServerName()+ ":" + request.getServerPort()+ "/concurso/";
	String pagina = "maestros.jsp";
	
	HttpSession preguntas = request.getSession();
	Integer reid = (Integer)preguntas.getAttribute("reid");

	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		stmt = conn.createStatement();
		
		sql = "UPDATE preg_respon pr SET pr.calificacion = 2 WHERE pr.calificacion IS NULL AND pr.respuesta_id = " + reid ;
		
		stmt.executeUpdate(sql);
		
		reid = null;
		try{conn.close();} catch(Exception e){}
		
		response.sendRedirect(servidor+pagina);
		
	}
	catch(SQLException e)
	{
		out.println("SQLException caught: " + e.getMessage());
	}
	finally
	{
		try{stmt.close();} catch(Exception e){}
		try{conn.close();} catch(Exception e){}
	}
%>