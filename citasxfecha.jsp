<%-- 
    Document   : paciente_historia_reporte
    Created on : 01-jul-2019, 8:37:12
    Author     : JEFER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="sql_conexion.jsp" %>
<!DOCTYPE html>
<html>   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
        <img src="encavezado.jpg">
        <table border="1">
        <%
        String fec=(String)session.getAttribute("miv");
        PreparedStatement sp=conexi.prepareStatement("Select PACIENTE_HISTORIA.nombres_p,PACIENTE_HISTORIA.apellidos_p, CITA_MEDICA.* from CITA_MEDICA,PACIENTE_HISTORIA WHERE PACIENTE_HISTORIA.ci_paciente=CITA_MEDICA.ci_paciente and CITA_MEDICA.fecha_consulta='"+fec+"'");
        ResultSet rs=sp.executeQuery();
        %>
            <form action="cita_medica_reporte.jsp" method="post">
           <h1>LISTA DE CITA MEDICA</h1>
           <tr><th colspan="21">REPORTE CITA MEDICA </th></tr>
     <tr><th colspan="21"><a href="nuevacita.jsp"><img src="insertar.jpg" width="40" height="40"></th></tr>
            <th>CODIGO</th>
            <th>MÉDICO</th>
            <th>NOMBRES</th>
            <th>APELLIDOS</th>
            <th>PACIENTE</th>
            <th>FECHA CONSULTA</th>
            <th>HORA CONSULTA</th>
             <th>ACCION</th>
           <% while (rs.next())
            {
                %>
             <tr>
               <td><%out.print(rs.getString("cod_consulta"));%></td>
               <td><%out.print(rs.getString("ci_medico"));%></td>
               <td><% out.print(rs.getString("nombres_p"));%></td>
                <td><% out.print(rs.getString("apellidos_p"));%></td>
               <td><%out.print(rs.getString("hora_consulta"));%></td>
                 <td><%out.print(rs.getString("fecha_consulta"));%></td>
               <td><%out.print(rs.getString("hora_consulta"));%></td>
                <td><a href="actualizarcita.jsp?id=<% out.print(rs.getString("cod_consulta"));%>"><img src="actualizar.jpg" width="40" height="40"></a></td>
               <% }%>
               <a href="menu.jsp"><img src="atras.png" width="100" height="100"></a>
             </form>
          </center>
               </body>
</html>
