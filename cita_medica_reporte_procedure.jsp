<%-- 
    Document   : paciente_historia_reporte
    Created on : 01-jul-2019, 8:37:12
    Author     : JEFER
--%>

<%@page import="java.sql.CallableStatement"%>
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
            PreparedStatement sp=conexi.prepareStatement("Select * from  CITA_MEDICA ");
          
       ResultSet rs=sp.executeQuery();
       
            %>
           <h1>LISTA DE DEPARTAMENTO DE CARRERA</h1>
         <tr><th colspan="21">LISTA DE DEPARTAMENTO DE CARRERA </th></tr>
     <tr><th colspan="21"><a href="medico_inserter.jsp"><img src="insertar.jpg" width="40" height="40"></th></tr>
         
            <th>Cod_consulta</th>
            <th>Ci_medico</th>
            <th>N historia</th>
             <th>Fecha consulta</th>
            <th>hora consulta</th>
            <th>Diagnostico</th>
             <th>Observacion</th>
            <th>Tratamineto</th>
             <th colspan="3">ACCION</th></tr>
           <% while (rs.next())
            {
                %>
             <tr>
              
                
               <td><%out.print(rs.getString("cod_consulta"));%></td>
               <td><%out.print(rs.getString("ci_medico"));%></td>
               <td><% out.print(rs.getString("n_historia"));%></td>
                <td><% out.print(rs.getString("fecha_consulta"));%></td>
               <td><%out.print(rs.getString("hora_consulta"));%></td>
               <td><%out.print(rs.getString("diagnostico"));%></td>
               <td><% out.print(rs.getString("observacion"));%></td>
                <td><% out.print(rs.getString("tratamiento"));%></td>
              <td><a href="dpto_carreras_detaller.jsp?id=<% out.print(rs.getString("cod_consulta"));%>"><img src="eliminar.jpg" width="40" height="40"></a></td>
               <td><a href=medico_actualizar.jsp?id=<% out.print(rs.getString("cod_consulta"));%>"><img src="actualizar.jpg" width="40" height="40"></a></td>
               <% }%>
               <a href="inicio_administracion.jsp"><img src="atras.png" width="100" height="100"></a>
          </center>
    </body>
</html>
