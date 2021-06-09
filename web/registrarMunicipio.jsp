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
        <title>Registrar municipio - Municipios Turisticos de Antioquia</title>
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
                                <li><a class="dropdown-item" href="#"><% 
                                    if (session.getAttribute("usuario") != null)
                                        out.print(session.getAttribute("usuario"));
                                    else
                                        out.print("Visitante");
                                         %></a></li>
                                        
                                <li><hr class="dropdown-divider" /></li>
                               
                                <%if (session.getAttribute("usuario") != null){ %>
                                        <li><a class="dropdown-item" href="municipiosRegistrados.jsp">Ver aportes</a></li>
                                        <li><a class="dropdown-item" href="registrarMunicipio.jsp">Registrar municipio</a></li>
                                        <li><a class="dropdown-item" href="index.jsp?action=logout">Salir</a></li>

                                  <% }else{ %>
                                        <li><a class="dropdown-item" href="login.jsp">Ingresar</a></li>
                                        <li><a class="dropdown-item" href="registrar.jsp">Registrarse</a></li>
                                  <% } %>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>Crear un nuevo municipio</h1>
                <p class="lead">Realiza un aporte con informacion de lugares que conozcas</p>
                
                 <% if(session.getAttribute("usuario") == null){  %>
                        <div class="alert alert-danger" role="alert">
                            Necesita iniciar sesion para ingresar a esta pagina                   
                        </div>
                <%} else { %>  
                    <form class="row col-md-6 g-3 mx-auto my-3 " action="registrarMunicipio.jsp" method="POST">
                        <div class="col-md-6">
                          <label for="nombre" class="form-label" >Nombre del municipio</label>
                          <input type="text" class="form-control text-center" name="nombre" id="nombre">
                        </div>
                        <div class="col-md-6">
                            <label for="subregion" class="form-label ">Subregion</label>
                            <select class="form-select " name="subregion" id="subregion" aria-label="Subregion del municipio">
                                <option selected></option>
                                <option value="Valle de Aburra">Valle de Aburrá</option>
                                <option value="Oriente">Oriente</option>
                                <option value="Suroeste">Suroeste</option>
                                <option value="Norte">Norte</option>
                                <option value="Occidente">Occidente</option>
                                <option value="Uraba">Urabá</option>
                                <option value="Nordeste">Nordeste</option>
                                <option value="Magdalena">Magdalena</option>
                                <option value="Medio">Medio</option>
                                <option value="Bajo Cauca">Bajo Cauca</option>
                            </select>
                        </div>
                        <div class="col-12 form-floating">
                            <textarea class="form-control" name="descripcion" maxlength="500" placeholder="Escribe una descripcion del municipio"  id="descripcion" style="height: 180px"></textarea>
                          <label for="descripcion">Descripcion</label>
                        </div>
                        <div class="col-md-6">
                          <label for="km_distancia" class="form-label">Kilometros de distancia de Medellin</label>
                          <input type="number" class="form-control text-center" name="km_distancia" id="km_distancia">
                        </div>
                        <div class="col-md-6">
                          <label for="telefono" class="form-label">Telefono</label>
                          <input type="text" class="form-control text-center" name="telefono" id="telefono">
                        </div>
                        <div class="col-12">
                            <button type="submit" name="action" value="registrar" onclick="return comprobar()" class="btn btn-dark">Registrar</button>
                        </div>
                        <% if (request.getMethod().equalsIgnoreCase("POST") && request.getParameter("action").equalsIgnoreCase("registrar")){ 
                                if (Controlador.crearMunicipio(request.getParameter("nombre"), request.getParameter("subregion"), 
                                        request.getParameter("descripcion"), request.getParameter("km_distancia"),
                                        request.getParameter("telefono"), session.getAttribute("usuario").toString())){
                        %>

                        <div class="col-12">
                            <div class="alert alert-success" role="alert">
                                <p>Municipio registrado correctamente</p>
                                <a href="municipiosRegistrados.jsp">Ver todos tus municipios registrados</a>
                            </div>
                        </div>
                        <% } else { %>
                        <div class="col-12">
                            <div class="alert alert-danger" role="alert">
                                Ocurrio un error al registrar el municipio en la base de datos
                            </div>
                        </div>
                        <% } } %>
                     </form>
                 <% } %>
                 
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <!-- Core theme JS-->

        <script src="js/comprobarRegistrarMunicipio.js"></script>
    </body>
</html>
