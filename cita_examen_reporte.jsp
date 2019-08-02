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
           PreparedStatement sp=conexi.prepareStatement("Select * from  CITA_EXAMEN ");
           ResultSet rs=sp.executeQuery();
            %>
           <h1>LISTA DE CITA EXAMENES</h1>
         <tr><th colspan="21">REPORTE CITA EXAMENES </th></tr>
     <tr><th colspan="21"><a href="medico_inserter.jsp"><img src="insertar.jpg" width="40" height="40"></th></tr>
           <tr><th>Codigo_E</th>
            <th>Cod_consulta</th>
            <th>Cod_examen</th>
            <th>Motivo</th>
             <th>Fecha</th>
            <th>plaquetas</th>
            <th>hemoglobina</th>
             <th>leucocitos</th>
            <th>linfocitos</th>
            <th>VDLR</th>
             <th>Hepatitis viral</th>
            <th>VIH</th>
            <th>Vias respiratorias</th>
            
             <th colspan="3">ACCION</th></tr>
           <% while (rs.next())
            {
                %>
             <tr>
               <td><% out.print(rs.getString("codigo_e"));%></td>
               <td><%out.print(rs.getString("cod_consulta"));%></td>
               <td><%out.print(rs.getString("cod_examen"));%></td>
               <td><% out.print(rs.getString("motivo_examen"));%></td>
                <td><% out.print(rs.getString("fecha_examen"));%></td>
               <td><%out.print(rs.getString("plaquetas"));%></td>
               <td><%out.print(rs.getString("hemoglobina"));%></td>
               <td><% out.print(rs.getString("leucocitos"));%></td>
                <td><% out.print(rs.getString("linfocitos"));%></td>
               <td><%out.print(rs.getString("vdlr"));%></td>
               <td><%out.print(rs.getString("hepatitis_viral"));%></td>
               <td><% out.print(rs.getString("vih"));%></td>
                <td><% out.print(rs.getString("vias_respiratorias"));%></td>
              <td><a href="medico_eliminar.jsp?id=<% out.print(rs.getString("codigo_e"));%>"><img src="eliminar.jpg" width="40" height="40"></a></td>
               <td><a href=medico_actualizar.jsp?id=<% out.print(rs.getString("codigo_e"));%>"><img src="actualizar.jpg" width="40" height="40"></a></td>
               <% }%>
               <a href="inicio_administracion.jsp"><img src="atras.png" width="100" height="100"></a>
          </center>
    </body>
</html>
