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
<select name="canton">
              <%
             int id=Integer.parseInt(request.getParameter("id"));
             PreparedStatement ps=conexi.prepareStatement("SELECT * FROM CANTON WHERE ID_PRO="+id+"");
             ResultSet rsm=ps.executeQuery();
             while(rsm.next())
             {
              %>
              <option value="<% out.print(rsm.getString("COD_C"));%>"><%out.print(rsm.getString("NOMBRE"));%></option>
          <%
      }
        %>
</select>