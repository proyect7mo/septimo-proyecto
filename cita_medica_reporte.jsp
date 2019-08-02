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
        PreparedStatement sp=conexi.prepareStatement("Select * from  CITA_MEDICA ");
        ResultSet rs=sp.executeQuery();
        %>
            <form action="cita_medica_reporte.jsp" method="post">
           <h1>LISTA DE CITA MEDICA</h1>
           <tr><th>INGRESE EL NUMERO DE CEDULA A CONSULTAR</th><td><input type="text" name="nc"></td><td><input type="submit" name="grabar" value="BUSCAR"</td></tr>
           <tr><th>ESCOJE UNA FECHA</th><td><input type="date" name="fecha"></td><td><input type="submit" name="buscar" value="BUSCAR"</td></tr>
         <tr><th colspan="21">REPORTE CITA MEDICA </th></tr>
     <tr><th colspan="21"><a href="nuevacita.jsp"><img src="insertar.jpg" width="40" height="40"></th></tr>
            <th>CODIGO</th>
            <th>MÉDICO</th>
            <th>PACIENTE</th>
            <th>FECHA CONSULTA</th>
            <th>HORA CONSULTA</th>
            <th>REVISION</th>
            <th>DIAGNOSTICO</th>
            <th>TRATAMIENTO</th>
             <th>OBSERVACION</th>
             <th colspan="3">ACCION</th>
           <% while (rs.next())
            {
                %>
             <tr>
               <td><%out.print(rs.getString("cod_consulta"));%></td>
               <td><%out.print(rs.getString("ci_medico"));%></td>
               <td><% out.print(rs.getString("ci_paciente"));%></td>
                <td><% out.print(rs.getString("fecha_consulta"));%></td>
               <td><%out.print(rs.getString("hora_consulta"));%></td>
                 <td><%out.print(rs.getString("revision"));%></td>
               <td><%out.print(rs.getString("diagnostico"));%></td>
               <td><% out.print(rs.getString("tratamiento"));%></td>
                <td><% out.print(rs.getString("observacion"));%></td>
              <td><a href="medico_eliminar.jsp?id=<% out.print(rs.getString("cod_consulta"));%>"><img src="eliminar.jpg" width="40" height="40"></a></td>
               <td><a href="actualizarcita.jsp?id=<% out.print(rs.getString("cod_consulta"));%>"><img src="actualizar.jpg" width="40" height="40"></a></td>
               <% }%>
               <a href="menu.jsp"><img src="atras.png" width="100" height="100"></a>
             </form>
          </center>
               <%
    if(request.getParameter("grabar")!=null)
    {
    session.setAttribute ("miv",request.getParameter("nc"));
      try
      {
       response.sendRedirect("citasxpaciente.jsp");
      }catch(Exception er)
      {
        out.print("ERROR AL GRABAR" +er);
      }
    }
    %>
        <%
    if(request.getParameter("buscar")!=null)
    {
    session.setAttribute ("miv",request.getParameter("fecha"));
      try
      {
       response.sendRedirect("citasxfecha.jsp");
      }catch(Exception er)
      {
        out.print("ERROR AL GRABAR" +er);
      }
    }
    %>    
    </body>
</html>
