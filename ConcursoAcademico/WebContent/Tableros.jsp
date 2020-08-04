<%@page import="com.anahuac.garibaldi.utils.LocalFunctions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%boolean child = false;%>
<%@include file="/fragments/validate.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="es-mx" xmlns="http://www.w3.org/1999/xhtml">
	<meta http-equiv="refresh" content="5">
   <head>
       <title>Concurso academico | Tableros</title>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/principal.css" rel="stylesheet" type="text/css" />
<link href="css/principal.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-grid.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-grid.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-reboot.css" rel="stylesheet" type="text/css" />
<script src="js/aks.main.js"></script>
<script src="js/aks.ajax.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		setinterval(function(){
			$('#pregunta').load('alumnos.jsp');
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
	
	
}

//function to responde to the checkEnter global function
function validate()
{
	return false;
	//browse();
}
function onLoad()
{
	theForm		= document.frmMain;
	theFilters	= document.frmFilters;
	page	= '<%=LocalFunctions.getPageNoExt(request.getRequestURI())%>';
	
	browse();
		
}
</script>
   </head>
   <body onload="onLoad();">
   <script>
   </script>
    <!-- Barra superior -->
  	 <div style="position: absolute;width: 100%;height: 13.06%;background: #009945;mix-blend-mode: normal;">
   		<h1 style="position:absolute;height: 13.8%;left: 2.2%;bottom:90% ;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 80px;line-height: 106px;color: #FFFFFF;">Concurso Académico 2K19</h1>
   	</div>

    <!-- Barra inferior -->
   	<div style="position: absolute;width: 100%;height: 13.06%;bottom: 0%;background: #009945;mix-blend-mode: normal;">
      <h1 style="position:absolute;height: 13.8%;left: 50%;bottom: 70%;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 375%;color: #FFFFFF;">Ingenierías XXVIII</h1></div>


			<% out.println("<br><br><br><br><br><br><br><br>"); %>

    <!-- Workarea -->
    <div class="container">
	    <div class="main-content">
	      <form action="" method="post" name="frmFilters" id="frmFilters" onkeydown="checkEnter();">
	      </form>
	      <form action="" method="post" name="frmMain" id="frmMain" onkeydown="checkEnter();">
	        <div id="workarea" position="relative"></div>
	      </form>
	    </div>
	</div>
 

   </body>
</html>