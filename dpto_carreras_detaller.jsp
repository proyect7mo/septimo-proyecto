<%-- 
    Document   : dpto_carreras_insertar
    Created on : 02-jul-2019, 9:11:55
    Author     : JEFER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
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
        <%
           String id=request.getParameter("id");
           CallableStatement cStmt=conexi.prepareCall("{call consul(?)}"); 
           cStmt.setString(1,id);
           cStmt.execute();
           ResultSet rs1=cStmt.getResultSet();
            %>
            <table border="2">  
                    <tr>
                        <th colspan="2">DATOS DE MÉDICO</th>
                    </tr>
            <%
            while(rs1.next())
            {
            %>
                    <tr>
                        <th>CODIGO CONSULTA</th>
                        <td><%out.print(rs1.getString("cod_consulta"));%></td>
                    </tr>
                   <tr>
                        <th>CODIGO MEDICO</th>
                        <td><%out.print(rs1.getString("ci_medico"));%></td>
                    </tr>
                    <tr>
                        <th>N° HISTORIA CLINICA</th>
                        <td><%out.print(rs1.getString("n_historia"));%></td>
                    </tr>
                    <tr>
                        <th>FECHA</th>
                        <td><%out.print(rs1.getString("fecha_consulta"));%></td>
                    </tr>
                    <tr>
                        <th>HORA</th>
                        <td><%out.print(rs1.getString("hora_consulta"));%></td>
                    </tr>
                    <tr>
                        <th>DIAGNOSTICO</th>
                        <td><%out.print(rs1.getString("diagnostico"));%></td>
                    </tr>
                    <tr>
                        <th>OBSERVACION</th>
                        <td><%out.print(rs1.getString("observacion"));%></td>
                    </tr>
                    <tr>
                        <th>TRATAMIENTO</th>
                        <td><%out.print(rs1.getString("tratamiento"));%></td>
                    </tr>
                     <%
             }
            %> 
        </table>
    </body>
</html>
