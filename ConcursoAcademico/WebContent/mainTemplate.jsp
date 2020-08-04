<%@page import="com.anahuac.garibaldi.utils.LocalFunctions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%boolean child = false;%>
<%@include file="/fragments/validate.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="es-mx" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>..:: Sistema de Concurso Académico v1.019::..</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/principal.css" rel="stylesheet" type="text/css" />
<script src="js/aks.main.js"></script>
<script src="js/aks.ajax.js"></script>
<script>
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
<div class="logo">
  <table class="logo-home">
    <tr>
      <td><a href="main.jsp">Inicio</a></td>
      <td width="100%">&nbsp;</td>
      <td><a href="logout.jsp">Salir</a></td>
    </tr>
  </table>
</div>
  <div class="container">
    <div class="main-content">
      <form action="" method="post" name="frmFilters" id="frmFilters" onkeydown="checkEnter();">
      </form>
      <form action="" method="post" name="frmMain" id="frmMain" onkeydown="checkEnter();">
        <div id="workarea"></div>
      </form>
    </div>
  </div>
<div id="processDiv" class="process" align="center"></div>
</body>
</html>
