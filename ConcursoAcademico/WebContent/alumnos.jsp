<%@page import="com.anahuac.garibaldi.utils.LocalFunctions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%boolean child = false;%>
<%@include file="/fragments/validate.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="es-mx" xmlns="http://www.w3.org/1999/xhtml">
	<meta http-equiv="refresh" content="15">
   	<head>
       	<title>Concurso academico | Alumnos</title>
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

		<!--scripts-->
		<script src="js/aks.main.js"></script>
		<script src="js/aks.ajax.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
		/*
			$(document).ready(function(){
				setinterval(function(){
					$('#pregunta').load('alumnos.jsp');
				},5000);
			})
		*/
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
				
				//console.log("aqui onLoad!");
				browseLocal();
			}
			function browseLocal(frmAction, keyId)
			{
				if (frmAction == null) frmAction = '';
				if (keyId == null) keyId = '';
				
				//console.log('browseLocal');
				
				var url = page + 'Browse.jsp';
				
				var callback = fillContainer;
				var sndcallback	= test2CallBack;
				
				var ai = new AJAXInteraction(url, callback, 'workarea', sndcallback);
				var parameters = '';
				parameters	+= 'frmAction=' + encodeL(frmAction);
				parameters	+= '&keyId=' + encodeL(keyId);
				//parameters += readFormParams(theFilters);
				//parameters += readFormParams(theForm);
				
				//Logger.debug("parametros para ajax [" + parameters + "]");
				ai.doPost(parameters);
			}
			function test2CallBack()
			{
				var isCuadroRespVisible = document.getElementById('isCuadroRespVisible');
				
				if (isCuadroRespVisible == null)
				{
					console.log('ocultar cuadro');
					toggleBox('cuadro_resp', false);
				}
				else
				{
					console.log('mostrar cuadro');
					toggleBox('cuadro_resp', true);
				}
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
    
    <!-- Input y Button -->
    <div id="cuadro_resp">
	    <form action = "UpRespAl.jsp" method = "post">
	    	<!-- Cuadro respuesta --> 
	    	<input type="Texto" id="inp" name = "inp" style="position: absolute;width: 100px;height: 100px;left: 545px;top: 380px;background: #E0E0E0;border: 3px solid #009945;box-sizing: border-box;" placeholder="Respuesta"></input> 
	    	<!-- Boton de enviar -->  
	    	<button type="submit"  class="btn btn-outline-success alumnos"> Enviar respuesta</button>
		</form>
	</div>

    <!-- Buenos cristianos -->
    <img src="cruz.png" alt="cruz" class="cruz">
    <!-- Honrados ciudadanos -->
    <img src="bchc.png" alt="bchc" class="bchc">

   </body>
</html>