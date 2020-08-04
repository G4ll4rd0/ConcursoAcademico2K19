<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%
final	boolean DEBUG = false;

	//String db = request.getParameter("db");
	String db = "concurso";
	String user 	= "USER2";
	String passwd	= "CAUser";
	
	Connection conn = null;
	Statement stmt	= null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	Statement stmt4 = null;
	ResultSet rs	= null;
	ResultSet rs2   = null;
	
	String sql      = null;
	String sqll 	= null;
	String sqql 	= null;
	String sqqll 	= null;
	Format f 		= new SimpleDateFormat("HH:mm:ss");
	String sthr 	= f.format(new Date());
	int rid 		= 0;
	int pid 		= 0;
	String ss 		= null;
	
	String servidor = "http://" + request.getServerName()+ ":" + request.getServerPort()+ "/concurso/";
	String pagina = "Admin.html";
	
	ss = request.getParameter("ss") == null ? "": request.getParameter("ss");
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		stmt  = conn.createStatement();
		stmt2 = conn.createStatement();
		stmt3 = conn.createStatement();
		stmt4 = conn.createStatement();
		
		sql = "SELECT u.user_id FROM usuarios u, user_round ur, ronda r WHERE u.tipo_id = 1 AND u.user_id = ur.user_id AND ur.ronda_id = r.ronda_id AND r.activa = 1";
		
		if (DEBUG) System.out.println("sql [" + sql + "]");
		
		rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			rid = rs.getInt("user_id");
			sqll = "SELECT p.pregunta_id FROM preguntas p, usuarios u, grupos g, ronda r WHERE p.semestre_id = g.semestre_id AND g.grupo_id = u.grupo_id AND u.user_id = " + rid + " AND p.uso = 0 AND p.ronda = r.round AND r.activa = 1 ORDER BY rand() LIMIT 1"; //Consulta para obtener una pregunta
			
			if (DEBUG) System.out.println("sqll [" + sqll + "]");
			
			rs2 = stmt2.executeQuery (sqll);
			if (rs2.next())
			{
				pid = rs2.getInt("pregunta_id");	
				sqql = "INSERT INTO preg_respon (pregunta_id, user_id, hora_entrada) VALUES (" + pid + "," + rid + ",'" + sthr + "');"; // insertar valores a preg_repon
				
				if (DEBUG) System.out.println("sqql [" + sqql + "]");
				
				sqqll = "UPDATE preguntas SET uso = 1 WHERE pregunta_id = " + pid; //update uso
				
				if (DEBUG) System.out.println("sqqll [" + sqqll + "]");

				stmt3.executeUpdate(sqql);
				stmt4.executeUpdate(sqqll);
			}
			
			rs2.close();
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
		try{rs2.close();} catch(Exception e){}
		try{stmt.close();} catch(Exception e){}
		try{stmt2.close();} catch(Exception e){}
		try{stmt3.close();} catch(Exception e){}
		try{stmt4.close();} catch(Exception e){}
		try{conn.close();} catch(Exception e){}
	}
	
	if (!DEBUG)
	{
		try{conn.close();} catch(Exception e){}
		response.sendRedirect(servidor + pagina);
	}
	else
	{
		out.println("<br/><br/><br/><br/><br/>Acabo");
	}
%>