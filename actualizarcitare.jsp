<%-- 
    Document   : inicio_administracion
    Created on : 30-jun-2019, 21:17:08
    Author     : JEFER
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@include file="sql_conexion.jsp"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>     
<html>   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <center><img src="administracion.jpg"></CENTER>
    <CENTER> <h1>INGRESO DE DATOS NUEVO MÉDICO</h1></center>     
    <center>
        <table border="2">
            <%
            String id=request.getParameter("id");
            PreparedStatement ps1=conexi.prepareStatement("SELECT * FROM CITA_MEDICA WHERE cod_consulta='"+id+"'"); 
            ResultSet rs1=ps1.executeQuery();
            %>
            <form action="actualizarcitare.jsp" method="post">
            <tr><th colspan="2">DATOS DE LA CONSULTA MÉDICA</th></tr>
            <%
            while(rs1.next())
            {
            %>
            <tr><th>NUMERO DE CONSULTA</th><td><input type="text" name="cod" value="<%out.print(rs1.getString("cod_consulta"));%>"></td></tr>
            <tr><th>MÉDICO: </th><td><input type="text" name="med" value="<%out.print(rs1.getString("ci_medico"));%>"></td></tr>
            <tr><th>PACIENTE: </th><td><input type="text" name="pac" value="<%out.print(rs1.getString("ci_paciente"));%>"></td></tr>
            <tr><th>FECHA CONSULTA: </th><td><input type="text" name="fec" value="<%out.print(rs1.getString("fecha_consulta"));%>"></td></tr>
            <tr><th>HORA CONSULTA: </th><td><input type="text" name="hor" value="<%out.print(rs1.getString("hora_consulta"));%>"></td></tr>
            <tr><th>REVISION: </th><td><input type="text" name="rev" value="<%out.print(rs1.getString("revision"));%>"></td></tr>
            <tr><th>DIAGNOSTICO: </th><td><input type="text" name="dia" value="<%out.print(rs1.getString("diagnostico"));%>"></td></tr>
            <tr><th>TRATAMIENTO: </th><td><input type="text" name="tra" value="<%out.print(rs1.getString("tratamiento"));%>"></td></tr>
            <tr><th>OBSERVACIÓN: </th><td><input type="text" name="obs" value="<%out.print(rs1.getString("observacion"));%>"></td></tr>
                </td>
            <%
            }
            %>
            <tr><td><input type="submit" name="grabar" value="GRABAR"</td>
            <td><input type="reset" name="restablecer" value="RESTABLECER"</td></tr>
        </form>
        </table>
    </center>
     <center><img src="piso.jpg"></CENTER>
    </body>
</html>
