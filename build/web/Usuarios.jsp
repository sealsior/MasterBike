<%-- 
    Document   : Usuarios
    Created on : 06-10-2021, 17:17:00
    Author     : baggr
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    <body>
        <a href="./RegistroUsuario.jsp">Crear Usuario</a>
        <h2>${mensajeCreacion}</h2>
        
        <h1>Listado de usuarios creados</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Primer Nombre</th>
                <th>Segundo Nombre</th>
                <th>Apellido Paterno</th>
                <th>Apellido Materno</th
                <th>Email</th
                <th>Rut</th
                <th>Edad</th
                <th>Fecha nacimiento</th
                <th>Direccion</th
                <th>Numero telefono</th
                <th>Estado civil</th
                <th>Rol</th
                
            </tr>
            <c:forEach items="${Usuarios}" var="d">
                <tr>
                    <td>${d.getIdUsuario()}</td>
                    <td>${d.getUsername()}</td>
                    <td>${d.getPassword()}</td>
                    <td>${d.getPnombre()}</td>
                    <td>${d.getSnombre()}</td>
                    <td>${d.getAppaterno()}</td>
                    <td>${d.getApmaterno()}</td>
                    <td>${d.getEmailusuario()}</td>
                    <td>${d.getRutusuario()}</td>
                    <td>${d.getEdad()}</td>
                    <td>${d.getFechanac()}</td>
                    <td>${d.getDireccionusuario()}</td>
                    <td>${d.getNumtelefono()}</td>
                    <td>${d.getEstadocivil()}</td>
                    <td>${d.getIdrol()}</td>
                    
                    
                </tr>
            </c:forEach> 
        </table>
    </body>
</html>
