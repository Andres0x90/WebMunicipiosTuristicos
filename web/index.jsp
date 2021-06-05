<%-- 
    Document   : index
    Created on : 4/06/2021, 08:17:26 PM
    Author     : Andres
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="modelo.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            try
            {
                Conexion.getConexion();
                out.print("Se conecto correctamente");
            }
            catch(SQLException ex)
            {
                out.print("Error al conectar");
            }
        %>
    </body>
</html>
