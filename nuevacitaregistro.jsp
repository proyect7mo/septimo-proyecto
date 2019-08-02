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
    <center><a href="inicio.html"><img src="img/inicio1.jpg" width="95" height="95"></a></center>
    <CENTER> <h1>AHORA AGENDA TU CITA MÉDICA</h1></center>     
    <center>
        <table border="2">
            <form action="nuevacitaregistro.jsp" method="post">
            <tr><th colspan="2">INGRESE LOS DATOS PARA SU CITA</th></tr>
            <tr><th>NUMERO DE CITA</th><td><input type="text" name="num"></td></tr>
            <%
              String pac=(String)session.getAttribute("miv");
              PreparedStatement sp3=conexi.prepareStatement("SELECT * FROM PACIENTE_HISTORIA WHERE ci_paciente='"+pac+"'");
              ResultSet rs3=sp3.executeQuery();
              while (rs3.next())
                {
                %>
            <tr><th>PACIENTE</th><td><%out.print(rs3.getString("nombres_p"));%><input type="text" name="pac"  value="<%out.print(rs3.getString("ci_paciente"));%>"></td></tr>
                <%
                }
                %>
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
            <tr><th>FECHA DE LA CONSULTA</th><td><input type="date" name="fec"></td></tr>
            <tr><th>HORA CONSULTA</th>
                <td><select name="est">
                        <option value="8:30">8:30</option>
                        <option value="9:30">9:30</option>
                        <option value="10:30">10:30</option>
                        <option value="11:30">11:30</option>
                        <option value="14:00">14:00</option>
                        <option value="15:00">15:00</option>
                        <option value="16:00">16:00</option>
                        <option value="17:00">17:00</option>
                        <option value="18:00">18:00</option>
                    </select>
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
       //VERIFICAR   
       PreparedStatement ps1=conexi.prepareStatement("INSERT INTO CITA_MEDICA(cod_consulta,ci_medico,ci_paciente,fecha_consulta,hora_consulta) values('"+c+"','"+m+"','"+p+"','"+f+"','"+h+"')"); 
       ps1.execute();
       //response.sendRedirect("cita_medica_reporte.jsp");
       %>
    <center>
        <br>
        <%
         out.print("REGISTRO GRABADO!! SU CITA ESTA AGENDADA PARA EL DIA: " +f+ " A LAS: " +h+ " ");
          out.print("POR FAVOR ASISTIR 10 MINUTOS ANTES PARA SU VALORACION");
        %>
        <br>
    </center>
    
      <%   
      }
      catch(Exception er)
      {
        out.print("ERROR AL GRABAR" +er);
      }
    }
    %>
     <center><img src="piso.jpg"></CENTER>
    </body>
</html>
