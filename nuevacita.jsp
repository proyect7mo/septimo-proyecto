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
    <CENTER> <h1>AGENDA TU CITA MEDICA</h1></center>     
    <center>
        <table border="2">
            <form action="nuevacita.jsp" method="post">
            <tr><th colspan="2">INGRESE LOS DATOS PARA SU CITA</th></tr>
            <tr><th>NUMERO DE CITA</th><td><input type="text" name="num"></td></tr>
            <%
              PreparedStatement sp4=conexi.prepareStatement("SELECT * FROM MEDICO");
              ResultSet rs4=sp4.executeQuery();
                %>
            <tr><th>MÉDICO</th>
                <td><select name="med">
              <%
              while (rs4.next())
            {
              %>
              <option value="<% out.print(rs4.getString("ci_medico"));%>"><% out.print(rs4.getString("nombres_m"));%></option>
            <%
            }
           %>
            <tr><th>PACIENTE</th><td><input type="text" name="pac"</td></tr>
            <tr><th>FECHA DE LA CONSULTA</th><td><input type="date" name="fec"></td></tr>
            <tr><th>HORA DE LA CONSULTA</th><td><input type="time" name="hor"></td></tr>
            <tr><td><input type="submit" name="grabar" value="GRABAR"</td>
            <td><input type="reset" name="restablecer" value="RESTABLECER"</td></tr>
        </form>
        </table>
    </center>
    <%
    if(request.getParameter("grabar")!=null)
    {
     String c=request.getParameter("num");
      String m=request.getParameter("med");
      String p=request.getParameter("pac");
      String f=request.getParameter("fec");
      String h=request.getParameter("hor");
      try
      {
       PreparedStatement ps1=conexi.prepareStatement("INSERT INTO CITA_MEDICA(cod_consulta,ci_medico,ci_paciente,fecha_consulta,hora_consulta) values('"+c+"','"+m+"','"+p+"','"+f+"','"+h+"')"); 
       ps1.execute();
       response.sendRedirect("cita_medica_reporte.jsp");
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
