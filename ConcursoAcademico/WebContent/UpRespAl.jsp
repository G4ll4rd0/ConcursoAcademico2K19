<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%
	//String db = request.getParameter("db");
	String db = "concurso";
	String user 	= "USER2";
	String passwd	= "CAUser";
	
	Connection conn = null;
	Statement stmt	= null;
	
	String sql = null;
	Format f 		= new SimpleDateFormat("HH:mm:ss");
	String sthr 	= f.format(new Date());
	
	HttpSession sesion = request.getSession();
	Integer id = (Integer)sesion.getAttribute("idr");
	Integer idre = (Integer)sesion.getAttribute ("idre");
	
	String inp = null;
	inp = request.getParameter("inp") == null ? "": request.getParameter("inp");
	inp = inp.trim();
	inp = inp.toUpperCase();
	
	String servidor = "http://" + request.getServerName()+ ":" + request.getServerPort()+ "/concurso/";
	String pagina = "alumnos.jsp";
	
	if (inp == null || inp == "" || inp == " " || inp == "  ")
	{
		try{conn.close();}catch (Exception e){}
		response.sendRedirect(servidor+pagina);
	}
	else
	{
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		stmt = conn.createStatement();
		
		sql = "UPDATE preg_respon pr SET pr.resp_al = '" + inp + "', pr.hora_resp = '" + sthr + "' WHERE pr.resp_al IS NULL AND pr.user_id = '" + id + "' AND pr.calificacion IS NULL AND pr.respuesta_id = "+idre;
		
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
	}
%>