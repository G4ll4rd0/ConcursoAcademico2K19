<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
boolean DEBUG = false;
if (DEBUG) out.println("<br>DEBUG ON: [" + request.getRequestURI() + "]");

out.println("<table>");
out.println("  <tr>");
out.println("    <td>Contador</td>");
out.println("    <td>Descripción</td>");
out.println("  </tr>");

for (int i = 1; i < 11; i++)
{
	out.println("  <tr>");
	out.println("    <td>" + i + "</td>");
	out.println("    <td>Valor de i = " + i + "</td>");
	out.println("  </tr>");
}
out.println("</table>");

//duerme el proceso 5 seg
Thread.sleep(5000);

%>