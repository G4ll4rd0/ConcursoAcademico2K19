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
	
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		out.println (db + " database successfully opened. <br/>");
		
		stmt = conn.createStatement();
		
		sql = "SELECT * FROM preguntas";
		
		rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			out.println("<br/>" + rs.getString("pregunta") + ": " + rs.getString("respuesta"));
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