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
            PreparedStatement ps1=conexi.prepareStatement("SELECT * FROM MEDICO WHERE ci_medico='"+id+"'"); 
            ResultSet rs1=ps1.executeQuery();
            %>
            <form action="eliminarmedico.jsp" method="post">
            <tr><th colspan="2">DATOS PERSONALES DEL MÉDICO</th></tr>
            <%
            while(rs1.next())
            {
            %>
            <tr><th>CEDULA DE IDENTIDAD</th><td><input type="text" name="ced" value="<%out.print(rs1.getString("ci_medico"));%>" disabled="disabled"></td></tr>
            <tr><th>NOMBRES</th><td><input type="text" name="nom" value="<%out.print(rs1.getString("nombres_m"));%>"></td></tr>
            <tr><th>APELLIDOS</th><td><input type="text" name="ape" value="<%out.print(rs1.getString("apellidos_m"));%>"></td></tr>
            <tr><th>DIRECCION</th><td><input type="text" name="dir" value="<%out.print(rs1.getString("direccion_m"));%>"></td></tr>
            <tr><th>ESTADO CIVIL</th>
                <td><select name="est">
                        <option value="SOLTERO">SOLTERO/A</option>
                        <option value="CASADO">CASADO/A</option>
                        <option value="DIVORCIADO">DIVORCIADO/A</option>
                        <option value="VIUDO">VIUDO/A</option>
                    </select>
                </td>
            <tr><th>TELEFONO</th><td><input type="text" name="tel" value="<%out.print(rs1.getString("telefono_m"));%>"></td></tr>
            <tr><th>ESPECIALIDAD</th><td><input type="text" name="esp" value="<%out.print(rs1.getString("especialidad"));%>"></td></tr>
            <%
            }
            %>
            <tr><td><input type="submit" name="grabar" value="GRABAR"</td>
            <td><input type="reset" name="restablecer" value="RESTABLECER"</td></tr>
        </form>
        </table>
    </center>
   <%
    if(request.getParameter("grabar")!=null)
    {
      String ci=request.getParameter("ced");
      String n=request.getParameter("nom");
      String a=request.getParameter("ape");
      String d=request.getParameter("dir");
      String e=request.getParameter("est");
      String t=request.getParameter("tel");
      String es=request.getParameter("esp");
      try  
      {
       //PreparedStatement ps=conexi.prepareStatement("DELETE * FROM MEDICO SET nombres_m='"+n+"',apellidos_m='"+a+"',direccion_m='"+d+"',estadoc_m='"+e+"',telefono_m='"+t+"',especialidad='"+es+"' WHERE ci_medico='"+ci+"'");
          PreparedStatement ps=conexi.prepareStatement("DELETE FROM MEDICO WHERE ci_medico='"+ci+"'");
       ps.execute();
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
