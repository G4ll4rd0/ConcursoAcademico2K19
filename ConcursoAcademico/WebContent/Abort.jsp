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
	String pagina = "Admin.html";
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		stmt = conn.createStatement();
		
		sql = "DELETE FROM preg_respon WHERE resp_al IS NULL";
		
		stmt.executeUpdate(sql);

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