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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sql_conexion.jsp"%> 

<!DOCTYPE html> 
<html>    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <center><img src="administracion.jpg"></CENTER>
    <CENTER> <h1>INGRESO DE DATOS NUEVO PACIENTE</h1></center>     
    <center>
        <table border="2">
             <%
                PreparedStatement sp3=conexi.prepareStatement("SELECT MAX (n_historia)+1 as n_historia from PACIENTE_HISTORIA");
                ResultSet rs3=sp3.executeQuery();
               while (rs3.next())
                {
                %>
            <form action="nuevopacienteregistro.jsp" method="post">
            <tr><th colspan="2">DATOS PERSONALES DEL PACIENTE</th></tr>
            <tr><th>CEDULA DE IDENTIDAD</th><td><input type="text" name="ced"</td></tr>
            <%
              PreparedStatement sp4=conexi.prepareStatement("SELECT * FROM DPTO_CARRERA");
              ResultSet rs4=sp4.executeQuery();
                %>
            <tr><th>DEPARTAMENTO-CARRERA</th>
                <td><select name="dep">
              <%
              while (rs4.next())
            {
              %>
              <option value="<% out.print(rs4.getString("cod_dpto"));%>"><% out.print(rs4.getString("nombre_dpto"));%></option>
            <%
            }
           %>
                    </select>
                </td>
            <tr><th>NOMBRES</th><td><input type="text" name="nom"</td></tr>
            <tr><th>APELLIDOS</th><td><input type="text" name="ape"</td></tr>
            <tr><th>FECHA DE NACIMIENTO</th><td><input type="date" name="fec"</td></tr>
            <tr><th>LUGAR DE NACIMIENTO</th><td><input type="text" name="lug"</td></tr>
            <tr><th>DIRECCION</th><td><input type="text" name="dir"</td></tr>
            <tr><th>TELEFONO</th><td><input type="text" name="tel"</td></tr>
            <tr><th>NACIONALIDAD</th><td><input type="text" name="nac"</td></tr>
            <tr><th>GENERO</th><td><input type="radio" name="gen" value="F" checked="true">Femenino<input type="radio" name="gen" value="M">Masculinio</td></tr>
            <tr><th>ESTADO CIVIL</th>
                <td><select name="est">
                        <option value="SOLTERO">SOLTERO/A</option>
                        <option value="CASADO">CASADO/A</option>
                        <option value="DIVORCIADO">DIVORCIADO/A</option>
                        <option value="VIUDO">VIUDO/A</option>
                    </select>
                </td>
            <tr><th>N° DE HISTORIA</th><td><input type="text" name="num"  value="<%out.print(rs3.getString("n_historia"));%>"></td></tr>
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
      session.setAttribute ("miv",request.getParameter("ced"));
      String ci=request.getParameter("ced");
      String d=request.getParameter("dep");
      String n=request.getParameter("nom");
      String a=request.getParameter("ape");
      String f=request.getParameter("fec");
      String l=request.getParameter("lug");
      String di=request.getParameter("dir");
      String t=request.getParameter("tel");
      String na=request.getParameter("nac");
      String g=request.getParameter("gen");
      String e=request.getParameter("est");
      int nu=Integer.parseInt(request.getParameter("num"));
      //String nu=request.getParameter("num");
      try
      {
       PreparedStatement ps1=conexi.prepareStatement("INSERT INTO PACIENTE_HISTORIA(ci_paciente,cod_dpto,nombres_p,apellidos_p,fecha_na,lugar_na,direccion_p,telefono_p,nacionalidad_p,genero_p,estadoc_p,n_historia) values('"+ci+"','"+d+"','"+n+"','"+a+"','"+f+"','"+l+"','"+di+"','"+t+"','"+na+"','"+g+"','"+e+"',"+nu+")"); 
       ps1.execute();
       response.sendRedirect("nuevacitaregistro.jsp");
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
