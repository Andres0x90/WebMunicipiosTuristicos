<%-- 
    Document   : index
    Created on : 4/06/2021, 08:17:26 PM
    Author     : Andres
--%>

<%@page import="controlador.Controlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Registrar usuario - Municipios Turisticos de Antioquia</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">


    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <img src="imgs/bandera.png" width="2%" class="m-2"/>

                <a class="navbar-brand" href="index.jsp">Municipios turisticos de Antioquia</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Home</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Menu</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Visitante</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="login.jsp">Ingresar</a></li>
                                <li><a class="dropdown-item" href="registrar.jsp">Registrarse</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>Crea una nueva cuenta</h1>
                <p class="lead">Accede a zonas restringidas</p>
                <form class="row col-md-6 g-3 mx-auto my-3 " action="registrar.jsp" method="POST">
                    <div class="col-md-6">
                      <label for="cuenta" class="form-label" >Nombre de la cuenta</label>
                      <input type="text" class="form-control text-center" name="cuenta" id="cuenta">
                    </div>
                    <div class="col-md-6">
                      <label for="clave" class="form-label ">Contraseña</label>
                      <input type="password" class="form-control text-center" name="clave" id="clave">
                    </div>
                    <div class="col-12">
                      <label for="nombre" class="form-label">Nombres</label>
                      <input type="text" class="form-control text-center" name="nombre" id="nombre">
                    </div>
                    <div class="col-12">
                      <label for="apellido" class="form-label">Apellidos</label>
                      <input type="text" class="form-control text-center" name="apellido" id="apellido">
                    </div>
                    <div class="col-12">
                        <button type="submit" name="action" value="registrar" onclick="return comprobar()" class="btn btn-dark">Registrarse</button>
                    </div>
                    <% if (request.getMethod().equalsIgnoreCase("POST") && request.getParameter("action").equalsIgnoreCase("registrar")){ 
                            if (Controlador.crearUsuario(request.getParameter("cuenta"), request.getParameter("clave"), 
                                    request.getParameter("nombre"), request.getParameter("apellido"))){
                    %>
                    
                    <div class="col-12">
                        <div class="alert alert-success" role="alert">
                            Usuario registrado correctamente
                        </div>
                    </div>
                    <% } else { %>
                    <div class="col-12">
                        <div class="alert alert-danger" role="alert">
                            Ocurrio un error al registrar el usuario en la base de datos
                        </div>
                    </div>
                    <% } } %>
                 </form>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <!-- Core theme JS-->

        <script src="js/comprobarRegistrar.js"></script>
    </body>
</html>
