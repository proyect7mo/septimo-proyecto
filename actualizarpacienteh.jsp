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
    <CENTER> <h1>HISTORIA CLINICA</h1></center>     
    <center>
        <table border="2">
             <%
            String id=request.getParameter("id");
            PreparedStatement ps1=conexi.prepareStatement("SELECT * FROM PACIENTE_HISTORIA WHERE ci_paciente='"+id+"'"); 
            ResultSet rs1=ps1.executeQuery();
            %>
            <form action="actualizarpacienteh.jsp" method="post">
            <tr><th colspan="2">FICHA CLINICA DEL PACIENTE</th></tr>
            <%
            while(rs1.next())
            {
            %>
            <table border="1">
                    <tr>
                        <th>CEDULA DE IDENTIDAD</th>
                        <td colspan="2"><input type="text" name="ci" value="<%out.print(rs1.getString("ci_paciente"));%>"></td>
                        <th>N° HISTORIA</th>
                        <td colspan="2"><input type="text" name="nh" value="<%out.print(rs1.getString("n_historia"));%>"></td>
                    </tr>
                        <th>DEPARTAMENTO</th>
                        <td colspan="2"><input type="text" name="dep" value="<%out.print(rs1.getString("cod_dpto"));%>"></td>
                        <th>FECHA DE REGISTRO</th>
                        <td colspan="2"><input type="date" name="fr"></td>
                    <tr>
                        <th>NOMBRES</th>
                        <td colspan="2"><input type="text" name="nom" value="<%out.print(rs1.getString("nombres_p"));%>"></td>
                        <th>APELLIDOS</th>
                        <td colspan="2"><input type="text" name="ape" value="<%out.print(rs1.getString("apellidos_p"));%>"></td>
                    </tr>
                    <tr>
                        <th>FECHA DE NACIMIENTO</th>
                        <td colspan="2"><input type="text" name="fec" value="<%out.print(rs1.getString("fecha_na"));%>"></td>
                        <th>LUGAR DE NACIMIENTO</th>
                        <td colspan="2"><input type="text" name="lug" value="<%out.print(rs1.getString("lugar_na"));%>"></td>
                    </tr>
                    <tr>
                        <th>DIRECCION</th>
                        <td colspan="2"><input type="text" name="dir" value="<%out.print(rs1.getString("direccion_p"));%>"></td>
                        <th>TELEFONO</th>
                        <td colspan="2"><input type="text" name="tel" value="<%out.print(rs1.getString("telefono_p"));%>"></td>
                    </tr>
                     <tr>
                        <th>NACIONALIDAD</th>
                        <td><input type="text" name="nac" value="<%out.print(rs1.getString("nacionalidad_p"));%>"></td>
                        <th>GENERO</th>
                        <td><input type="text" name="gen" value="<%out.print(rs1.getString("genero_p"));%>"></td>
                        <th>ESTADO CIVIL</th>
                        <td><input type="text" name="est" value="<%out.print(rs1.getString("estadoc_p"));%>"></td>
                    </tr>
                    <tr>
                        <th>ANTECEDENTES PERSONALES</th>
                        <td colspan="2"><input type="text" name="antp" value="<%out.print(rs1.getString("antecedentes_p"));%>"></td>
                        <th>ANTECEDENTES FAMILIARES</th>
                        <td colspan="2"><input type="text" name="antf" value="<%out.print(rs1.getString("antecedentes_f"));%>"></td>
                    </tr>
                    <%
            }
            %>
                    <tr><td><input type="submit" name="grabar" value="GRABAR"</td>
            <td><input type="reset" name="restablecer" value="RESTABLECER"</td></tr>
            </table>
            </form>
            </table>
<%
    if(request.getParameter("grabar")!=null)
    { 
      String c=request.getParameter("ci");
      String de=request.getParameter("dep");
      String n=request.getParameter("nom");
      String a=request.getParameter("ape");
      String f=request.getParameter("fec");
      String l=request.getParameter("lug");
      String d=request.getParameter("dir");
      String t=request.getParameter("tel");
      String na=request.getParameter("nac");
      String g=request.getParameter("gen");
      String ec=request.getParameter("est");
      int num=Integer.parseInt(request.getParameter("nh"));
      String fre=request.getParameter("fr");
      String ap=request.getParameter("antp");
      String af=request.getParameter("antf");
      try
      {
       PreparedStatement ps=conexi.prepareStatement("UPDATE PACIENTE_HISTORIA SET ci_paciente='"+c+"',cod_dpto='"+de+"',nombres_p='"+n+"',apellidos_p='"+a+"',fecha_na='"+f+"',lugar_na='"+l+"',direccion_p='"+d+"',telefono_p='"+t+"',nacionalidad_p='"+na+"',genero_p='"+g+"',estadoc_p='"+ec+"',fecha_registro='"+fre+"',antecedentes_p='"+ap+"',antecedentes_f='"+af+"' WHERE ci_paciente='"+c+"'");
       ps.execute();
       response.sendRedirect("paciente_historia_reporte.jsp");
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
