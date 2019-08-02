<%-- 
    Document   : dpto_carreras_insertar
    Created on : 02-jul-2019, 9:11:55
    Author     : JEFER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sql_conexion.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script type="text/javascript" src="ajax.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head> 
    <body>
        <form name="form1">
    <tr> <th>PROVINCIA</th>
        <td><select name="pro" onchange="cargarcanton(document.form1.pro.value, 'midiv','canton.jsp')">
              <%
             PreparedStatement ps=conexi.prepareStatement("SELECT * FROM provin");
             ResultSet rsm=ps.executeQuery();
             while(rsm.next())
             {
              %>
              <option value="<% out.print(rsm.getString("ID_PRO"));%>"><%out.print(rsm.getString("NOMBEP"));%></option>
          <%
      }
  
    %></select></td>
    <div id="midiv">
        <select name="canton">
            
        </select>
    </div>
      </tr>
    </form></body>
</html>
