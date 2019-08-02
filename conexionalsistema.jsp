<%-- 
    Document   : inicio_administracion
    Created on : 30-jun-2019, 21:17:08
    Author     : JEFER
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <center><img src="administracion.jpg"></CENTER>
    <a href="inicio.html"><img src="img/inicio1.jpg" width="50" height="50"></a>
    <CENTER> <h1>CONEXION AL SISTEMA</h1></center> 
    <center> <img src="img/usu.png" width="110" height="110"></center>
     <center>
            <table border="0">
                <form action="conexionalsistema.jsp" method="post">
                    <tr>
                        <th colspan="2">CONEXION</th>
                    </tr>
                    <tr>
                        <th>USUARIO</th>
                        <td><input type="text" name="us"</td>
                    </tr>
                    <tr>
                        <th>CONTRASEÑA</th>
                        <td><input type="password" name="co"</td>
                    </tr>
                    <tr><td><input type="submit" name="conectar" value="CONECTAR"</td>
            <td><input type="reset" name="restablecer" value="RESTABLECER"</td></tr>
        </form>
            </table> 
            </center>
      <%
    if(request.getParameter("conectar")!=null)
    {
      String us=request.getParameter("us");
      String co=request.getParameter("co");    
        try{ 
            Connection conexi=null;
            Statement st=null;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conexi=(Connection) DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Proyectof",""+us+"",""+co+"");
            conexi.createStatement();
            session.setAttribute("us",us); 
            response.sendRedirect("menu.jsp");
            out.print("CONEXION !!");
      
       }
        catch (Exception e)
        {
            %>  
           <script>
           alert("ERROR AL INGRESAR DATOS DE CONEXION");
           </script>
        <%}
       }
        %>
     <center><img src="piso.jpg"></CENTER>
    </body>
</html>
