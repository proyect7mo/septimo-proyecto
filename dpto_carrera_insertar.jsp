<%-- 
    Document   : newjspdpto_carrera_insertar
    Created on : 30-jun-2019, 21:03:39
    Author     : JEFER
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="conexion_v.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="2">
            <form action="insertar_marca.jsp" method="post">
            <tr><th colspan="2">INGRESO DE NUEVA MARCA</th></tr>
             <tr> <th>codigo</th><td><input type="text" name="cod"></td></tr>
            <tr> <th>tippo</th><td><input type="text" name="tipo"></td></tr>
            <tr> <th>nombre</th><td><input type="text" name="nombre"></td></tr>
             <tr> <th>ubicasion</th><td><input type="text" name=ubicasion"></td></tr>
            <tr><td><input type="submit" name="grabar" value="GRABAR"></td>
            <td><input type="reset" name="restablecer" value="RESTABLECER"></td></tr>
            </form>
        </table>
        
        
         <%
    if(request.getParameter("grabar")!=null)
    {
       String c=request.getParameter("cod");
      String t=request.getParameter("tipo");
      String no=request.getParameter("nombre");
      String ub=request.getParameter("ubicasion");
      try
      {
       PreparedStatement ps=conexi.prepareStatement("INSERT INTO consulta(cod_dpto,tipo,nombre,ubicasion) values("+c+",'"+t+"','"+no+",'"+ub+"')");
       ps.execute();
       out.print("REGISTRO GRABADO!!");
       response .sendRedirect("dpto_carrera_reporte.jsp");
      }catch(Exception e)
      {
           out.print("ERROR GRABADO!!");
      }
    }
    %>
    </body>
</html>
