<%-- 
    Document   : depar_carrera_reporte
    Created on : 30-jun-2019, 19:42:22
    Author     : JEFER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sql_conexion.jsp"%>
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
           PreparedStatement sp1=conexi.prepareStatement("SELECT * FROM MEDICO");
           ResultSet rs1=sp1.executeQuery();
            %>
           <h1>LISTA DE MEDICOS</h1>
           <tr><th colspan="11">REPORTE MEDICO</th></tr>
           <tr><th colspan="9"><a href="nuevomedico.jsp"><img src="insertar.jpg" width="40" height="40"></th></tr>
           <tr><th>CI_Medico</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Direccion</th>
            <th>Estado</th>
            <th>Telefono</th>
            <th>Especialidad</th>
             <th colspan="2">ACCION</th></tr>
           <% while (rs1.next())
           {
           %>
             <tr>
               <td><% out.print(rs1.getString("ci_medico"));%></td>
               <td><%out.print(rs1.getString("nombres_m"));%></td>
               <td><%out.print(rs1.getString("apellidos_m"));%></td>
               <td><% out.print(rs1.getString("direccion_m"));%></td>
               <td><%out.print(rs1.getString("estadoc_m"));%></td>
               <td><%out.print(rs1.getString("telefono_m"));%></td>
               <td><%out.print(rs1.getString("especialidad"));%></td>
              <td><a href="eliminarmedico.jsp?id=<% out.print(rs1.getString("ci_medico"));%>"><img src="eliminar.jpg" width="40" height="40"></a></td>
               <td><a href="actualizarmedico.jsp?id=<% out.print(rs1.getString("ci_medico"));%>"><img src="actualizar.jpg" width="40" height="40"></a></td>
               <% }%>
                <a href="menu.jsp"><img src="atras.png" width="100" height="100"></a>
          </center>
   
    </body>
</html>
