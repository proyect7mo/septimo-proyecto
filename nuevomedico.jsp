<%-- 
    Document   : inicio_administracion
    Created on : 30-jun-2019, 21:17:08
    Author     : JEFER
--%>
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
            <form action="nuevomedico.jsp" method="post">
            <tr><th colspan="2">DATOS PERSONALES DEL MÉDICO</th></tr>
            <tr><th>CEDULA DE IDENTIDAD</th><td><input type="text" name="ced"</td></tr>
            <tr><th>NOMBRES</th><td><input type="text" name="nom"</td></tr>
            <tr><th>APELLIDOS</th><td><input type="text" name="ape"</td></tr>
            <tr><th>DIRECCION</th><td><input type="text" name="di"</td></tr>
            <tr><th>ESTADO CIVIL</th>
                <td><select name="est">
                        <option value="SOLTERO">SOLTERO/A</option>
                        <option value="CASADO">CASADO/A</option>
                        <option value="DIVORCIADO">DIVORCIADO/A</option>
                        <option value="VIUDO">VIUDO/A</option>
                    </select>
                </td>
                <tr><th>TELEFONO</th><td><input type="text" name="t"</td></tr>
                <tr><th>ESPECIALIDAD</th><td><input type="text" name="es"</td></tr>
            <tr><td><input type="submit" name="grabar" value="GRABAR"</td>
            <td><input type="reset" name="restablecer" value="RESTABLECER"</td></tr>
        </form>
        </table>
    </center>
    <%
    if(request.getParameter("grabar")!=null)
    {
       
      String ci=request.getParameter("ced");
      String no=request.getParameter("nom");
      String a=request.getParameter("ape");
      String d=request.getParameter("di");
      String e=request.getParameter("est");
      String te=request.getParameter("t");
      String esp=request.getParameter("es");
      try
      {
       PreparedStatement ps1=conexi.prepareStatement("INSERT INTO MEDICO(ci_medico,nombres_m,apellidos_m,direccion_m,estadoc_m,telefono_m,especialidad) values('"+ci+"','"+no+"','"+a+"','"+d+"','"+e+"','"+te+"','"+esp+"')"); 
       ps1.execute();
       response.sendRedirect("medico_reporte.jsp");
       //out.print("REGISTRO GRABADO!!");
       
      }catch(Exception er)
      {
        out.print("ERROR AL GRABAR" +er);
      }
    }
    %>
     <center><img src="piso.jpg"></CENTER>
    </body>
</html>
