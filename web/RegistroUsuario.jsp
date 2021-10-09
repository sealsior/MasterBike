<%-- 
    Document   : RegistroUsuario
    Created on : 06-10-2021, 16:52:51
    Author     : baggr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuarios</title>
    </head>
    <body>
        <form action="./crear-usuario" method="post">
          
            <label>Email usuario:</label>
            <input type="text" name="txtEmailusuario" id="txtEmailusuario" />
            <br>
            <label>Password </label>
            <input type="password" name="txtPassword" id="txtPassword" />
            <br>
            <label>Primer nombre:</label>
            <input type="text" name="txtPnombre" id="txtPnombre"/>
            <br>
            <label>Apellido paterno:</label>
            <input type="text" name="txtAppaterno" id="txtAppaterno"/>
            <br>
            <label>Apellido Materno:</label>
            <input type="text" name="txtApmaterno" id="txtApmaterno"/>
            <br>
            <label>Rut:</label>
            <input type="text" name="txtRutusuario" id="txtRutusuario"/>
            <br>
            <label>Fecha nacimiento:</label>
            <input type="date" name="txtFechanac" id="txtFechanac"/>
            <br>
            <label>Direccion:</label>
            <input type="text" name="txtDireccion" id="txtDireccion"/>
            <br>
            <label>Telefono:</label>
            <input type="number" name="txtNumtelefono" id="txtNumtelefono"/>
            <br>
            <input type="submit" value="Crear Cliente" />
            
        </form>
    </body>
</html>
