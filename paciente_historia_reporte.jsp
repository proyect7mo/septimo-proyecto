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
           PreparedStatement sp=conexi.prepareStatement("Select * from  PACIENTE_HISTORIA");
           ResultSet rs=sp.executeQuery();
            %>
           <h1>LISTA GENERAL DE PACIENTES</h1>
         <tr><th colspan="21">REPORTE PACIENTE HISTORIAL</th></tr>
     <tr><th colspan="21"><a href="nuevopaciente.jsp"><img src="insertar.jpg" width="40" height="40"></th></tr>
           <tr><th>CEDULA DE IDENTIDAD</th>
            <th>DEPARTAMENTO O CARRERA</th>
            <th>NOMBRES</th>
            <th>APELLIDOS</th>
             <th>FECHA DE NACIMIENTO</th>
            <th>LUGAR DE NACIMIENTO</th>
             <th colspan="3">ACCIONES</th></tr>
           <% while (rs.next())
            {
                %>
             <tr>
               <td><% out.print(rs.getString("ci_paciente"));%></td>
               <td><% out.print(rs.getString("cod_dpto"));%></td>
               <td><%out.print(rs.getString("nombres_p"));%></td>
               <td><%out.print(rs.getString("apellidos_p"));%></td>
               <td><% out.print(rs.getString("fecha_na"));%></td>
                <td><% out.print(rs.getString("lugar_na"));%></td>
              <td><a href="medico_eliminar.jsp?id=<% out.print(rs.getString("ci_paciente"));%>"><img src="eliminar.jpg" width="40" height="40"></a></td>
               <td><a href="actualizarpacienteh.jsp?id=<% out.print(rs.getString("ci_paciente"));%>"><img src="actualizar.jpg" width="40" height="40"></a></td>
               <% }%>
               <a href="menu.jsp"><img src="atras.png" width="100" height="100"></a>
          </center>
    </body>
</html>
