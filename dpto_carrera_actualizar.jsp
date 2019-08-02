<%-- 
    Document   : dpto_carrera_actualizar
    Created on : 30-jun-2019, 21:03:53
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
      <form  action="dpto_carrera_actualizar.jsp" method="post">
        <table border="2">
        
            <%
            String i =request.getParameter("id");
            PreparedStatement ps =conexi.prepareStatement("SELECT * FROM DPTO_CARRERA where cod_dpto='"+i+"'" ); 
            ResultSet rs=ps.executeQuery();

            %>
            <tr><th colspan="2">ACTUALIZAR</th></tr>
            <%
            while (rs.next())     
            {
            %>
            <tr><th>CODIGO</th><td><input type ="text" name="codigoo" value="<%out.print(rs.getString("cod_dpto"));%>"></td></tr>
            <tr><th>TIPO</th><td><input type ="text" name="tipoo" value="<%out.print(rs.getString("tipo"));%>"></td></tr>
            <tr><th>NOMBRE</th><td><input type ="text" name="nombree" value="<%out.print(rs.getString("nombre"));%>"></td></tr>
            <tr><th>UBICACION</th><td><input type ="text" name="ubicacionn" value="<%out.print(rs.getString("ubicasion"));%>"></td></tr>
            <tr><td><input type="submit" name="actualiza" value="actualiza"></td>
                <td><input type="reset" name="limpiar" value="Restablecer"></td></tr>
            
            <%
                }          
            %>
        </table>
         <%
                    if(request.getParameter("actualiza")!=null)
                    {
                    String cod=request.getParameter("codigoo");
                    String tip=request.getParameter("tipoo");
                    String no=request.getParameter("nombree");
                    String ub=request.getParameter("ubicacionn");
                     try {
            PreparedStatement ps2=conexi.prepareStatement("UPDATE DPTO_CARRERA SET cod_dpto="+cod+",tipo='"+tip+"',nombre='"+no+"',ubicacion='"+ub+"' WHERE id_marca="+cod+"");
            ps2.execute();
            response.sendRedirect("dpto_carrera_reporte.jsp");
                 }
                 catch(Exception e){
                  out.print("ERROR AL GRABAR" +e);   
                 }
                 } 
                    %>
             </form>
    </body>
</html>
