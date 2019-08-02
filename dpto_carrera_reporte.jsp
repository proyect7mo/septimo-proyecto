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
           PreparedStatement sp=conexi.prepareStatement("Select * from  DPTO_CARRERA ");
           ResultSet rs=sp.executeQuery();
            %>
           <h1>LISTA DE DEPARTAMENTO DE CARRERA</h1>
           <h1><a  href="pdf.jsp"</a>IMPRIMIR</h1>
         <tr><th colspan="21">LISTA DE DEPARTAMENTO DE CARRERA </th></tr>
     <tr><th colspan="21"><a href="dpto_carreras_insertar.jsp"><img src="insertar.jpg" width="40" height="40"></th></tr>
           <tr><th>codigo</th>
            <th>tipo</th>
            <th>nombre</th>
            <th>ubicacion</th>
           
             <th colspan="3">ACCION</th></tr>
           <% while (rs.next())
            {
                %>
             <tr>
               <td><% out.print(rs.getString("cod_dpto"));%></td>
               <td><%out.print(rs.getString("tipo"));%></td>
               <td><%out.print(rs.getString("nombre"));%></td>
               <td><% out.print(rs.getString("ubicacion"));%></td>
              <td><a href="medico_eliminar.jsp?id=<% out.print(rs.getString("cod_dpto"));%>"><img src="eliminar.jpg" width="40" height="40"></a></td>
               <td><a href=dpto_carrera_actualizar.jsp?id=<% out.print(rs.getString("cod_dpto"));%>"><img src="actualizar.jpg" width="40" height="40"></a></td>
               <% }%>
               <a href="inicio_administracion.jsp"><img src="atras.png" width="100" height="100"></a>
          </center>
    </body>
</html>
