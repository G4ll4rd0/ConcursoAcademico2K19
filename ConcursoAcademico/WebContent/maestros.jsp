<%@page import="com.anahuac.garibaldi.utils.LocalFunctions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%boolean child = false;%>
<%@include file="/fragments/validate.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="es-mx" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Concurso Académico | Maestros</title>
	<meta http-equiv="refresh" content="5">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       	<!--estilos-->
		<link href="css/principal.css" rel="stylesheet" type="text/css" />
		<link href="css/principal.css" rel="stylesheet" type="text/css" />
		<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css" />
		<link href="css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css" />
		<link href="css/bootstrap-grid.min.css" rel="stylesheet" type="text/css" />
		<link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/CACSS.css">
<script src="js/aks.main.js"></script>
<script src="js/aks.ajax.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		setinterval(function(){
			$('#pregunta').load('maestros.jsp');
		},5000);
	})
</script>
<script id="pregunta">
//local functions
var theForm		= null;
var theFilters	= null;
var page		= null;
//first function onLoad, modify as needed but do not delete the function
function onLoad()
{
	theForm		= document.frmMain;
	theFilters	= document.frmFilters;
	page	= '<%=LocalFunctions.getPageNoExt(request.getRequestURI())%>';
	
	browse();
	
	//TODO: cargar timer
}
//function to responde to the checkEnter global function
function validate()
{
	return false;
	//browse();
}
</script>
</head>

<body onload="onLoad();">
    
	<!--Barras-->
    <header>Concurso Académico 2019</header>
    <footer>Ingenierías XXVIII</footer>

    <!-- Texto maestros -->
    <h1 class="maestrosText"style="top: 12%;">Maestros</h1>

	<!-- Workarea -->
    <div class="container">
	    <div class="main-content">
	      <form action="" method="post" name="frmFilters" id="frmFilters" onkeydown="checkEnter();">
	      </form>
	      <form action="" method="post" name="frmMain" id="frmMain" onkeydown="checkEnter();">
	        <div id="workarea"></div>
	      </form>
	    </div>
	</div>

    <!-- Buenos cristianos -->
    <img src="cruz.png" alt="cruz" style="position: absolute;width:16%;height:45%;left:10%;top:18%;opacity: 0.6;">
    
    <!-- Honrados ciudadanos -->
    <img src="bchc.png" alt="bchc" style="position: absolute;width:22%;height:40%;left:68%;top:21%;opacity: 0.6;">

    <!-- Boton correcto -->
    <form action="Correcta.jsp" method="post">
      <div id="ss" name="ss"></div>
       <button  type="submit" class="maestrosBotonCo"style="top: 79%;"></button>
    </form>
    
    <!-- Boton incorrecto -->
    <form action="Incorrecta.jsp" method="post">
      <div id="ss" name="ss"></div>
    <button id="mal" type="submit" class="maestrosBotonIn"style="top: 79%;"></button>
    </form>

   </body>
</html>