<%-- 
    Document   : sql_conexion
    Created on : 28-jun-2019, 13:16:27
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
      
        <%
Connection conexi=null;
Statement st=null;
try
{
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    conexi=(Connection)DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Proyectof","sa","Uti2019");
    conexi.createStatement();
    out.print("CONEXION REALIZADA");
}catch(Exception e){
   out.print("ERROR CONEXION" +e);
}
%>
    </body>
</html>
