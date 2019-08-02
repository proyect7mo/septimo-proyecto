<%-- 
    Document   : inicio_administracion
    Created on : 30-jun-2019, 21:17:08
    Author     : JEFER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <center><img src="administracion.jpg"></CENTER>
    <a href="conexionalsistema.jsp">cerrar sesión</a>
    <CENTER> <h1>ADMINISTRACION DE LA BASE DE DATOS</h1></center> 
     <CENTER> <h1>REPORTES</h1></center> 
    <center>  <table >
            <th><a href="medico_reporte.jsp"><img src="medico.jpg" width="200" height="200"></a></th>
            <th><a href="paciente_historia_reporte.jsp"><img src="paciente.png" width="200" height="200"></a></th>
            <th><a href="cita_medica_reporte.jsp"><img src="cita_me.jpg" width="200" height="200"></a></th>
            <tr><td><CENTER>MEDICO</CENTER></td>
            <td><CENTER>HISTORIAS CLINICAS</CENTER></td>
             <td><CENTER>CITA MÉDICA</CENTER></td></tr>
            <th><a href="cita_examen_reporte.jsp"><img src="cita.jpg" width="200" height="200"></a></th>
            <th><a href="dpto_carrera_reporte.jsp"><img src="departamento.jpg" width="200" height="200"></a></th>
             <th><a href=" examenes_reporte.jsp"><img src="examenes.png" width="200" height="200"></a></th>
            <tr><td><CENTER>CITA EXAMENES</CENTER></td>
             <td><CENTER>DEPARTAMENTOS</CENTER></td>
             <td><CENTER>EXAMENES</CENTER></td></tr>
        </table></center>
     <center><img src="piso.jpg"></CENTER>
    </body>
</html>
