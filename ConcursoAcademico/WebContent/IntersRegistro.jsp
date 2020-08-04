<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
	<title>Registro de Jugadores</title>
</head>
<body>
	<!--Titulo-->
	<div class="ReJu" style="position:absolute;width: 130.72%;height: 13.80%;left: 30px;top: 0%;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 80px;line-height: 106px;">Registro de Jugadores</div>
	<form action="Registro.jsp" method="post">
	<%@page import="java.sql.*" %>
	<%
	String db="interapp";
	String usuario="interapp";
	String passwd="oH3C7!Jo5PZw5Zfc";
	
	Connection conn=null;
	Statement stmt=null;
	
	ResultSet rs=null;
	
	String sql=null;
	
	String delegacion=null;
	int equipoId;
	String equipoIdLocal;
	String equipoIdPost;
	
	equipoIdPost = request.getParameter("equipoId") == null ? "0" : request.getParameter("equipoId");
	
	try{
		
		Class.forName("org.gjt.mm.mysql.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://arkesol.ddnsfree.com/"+db,usuario,passwd);
		
		stmt=conn.createStatement();
		
		sql="SELECT * FROM vw_equipos";
		
	//<!--delegacion-->
	rs=stmt.executeQuery(sql);
		out.println("<select  type=\"text\" id=\"equipo\" name=\"equipo\" placeholder=\"EQUIPO\" style=\"position: absolute; width: 25%;height: 9%;left: 2%;top: 22%;\">");
		while(rs.next()){
			delegacion=rs.getString("nombre_equipo");
			equipoId = rs.getInt("equipo_id");
			if(equipoIdPost == "0"){
				out.println("<option selected>EQUIPO</option>");
			}
			else if(equipoIdPost == ""){
				out.println("<option selected value=\""+ equipoId +"\">"+delegacion+"</option>");
			}else{
				out.println("<option value=\""+ equipoId +"\">"+delegacion+"</option>");
			}
		}
		out.println("</select>");
	
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
	

	
	<!--numero-->
	<input type="text" id="numero" name="numero" placeholder="NUMERO" style="position: absolute; width: 14%;height: 8%;left: 30%;top: 82%;">

	<!--Nombres-->
	<input type="text" id="nombres" name="nombres" placeholder="NOMBRES" style="position: absolute; width: 25%;height: 8%;left: 30%;top: 22%;">

	<!--PRIMER APELLIDO-->
	<input type="text" id="PrimerApellido" name= "PrimerApellido" placeholder="PRIMER APELLIDO" style="position: absolute; width: 25%;height: 8%;left: 30%;top: 42%;">
	<!--Segundo APELLIDO-->
	<input type="text" id="SegundoApellido" name="SegundoApellido" placeholder="SEGUNDO APELLIDO" style="position: absolute; width: 25%;height: 8%;left: 30%;top: 62%;">
	<!--Boton-->
	<button type="submit" style="position: absolute;width: 10%; height: 9%;left: 45.2%; top: 82%;">Registrar</button>

</form>
	
</body>
</html>