<%-- 
    Document   : index
    Created on : 4/06/2021, 08:17:26 PM
    Author     : Andres
--%>

<%@page import="controlador.Controlador"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="modelo.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - Municipios Turisticos de Antioquia</title>
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
                <h1>Entrar a tu cuenta</h1>
                <p class="lead">Accede a zonas restringidas</p>
                <% if(session.getAttribute("usuario") != null){  %>
                        <div class="alert alert-success" role="alert">
                            Ya cuenta con una sesion iniciada                    
                        </div>
                <%} else { %>
                    <form class="row col-md-4 mx-auto my-4" action="login.jsp" method="POST">
                          <div class="mb-3">
                            <label for="usuario" class="form-label" >Usuario</label>
                            <input type="text" class="form-control" name="cuenta" id="cuenta">
                          </div>
                          <div class="mb-3">
                            <label for="clave" class="form-label">Contrase??a</label>
                            <input type="password" class="form-control" name="clave" id="clave">
                          </div>
                          <% if (request.getMethod().equalsIgnoreCase("POST")){ 
                                if (Controlador.acceder(request.getParameter("cuenta"), request.getParameter("clave"))){
                                    session.setAttribute("usuario", request.getParameter("cuenta"));  
                                    response.sendRedirect("index.jsp");
                          %>
                            <div class="alert alert-success" role="alert">
                                Sesion creada exitosamente                    
                            </div>
                          <% }else{ %>
                            <div class="alert alert-danger" role="alert">
                                Usuario o contrase??a incorrectos                    
                            </div>
                            <% }} %>
                            <button type="submit" name="action" value="ingresar" onclick="return comprobar()" class="btn btn-dark ">Ingresar</button>
                        </form>
                    <% } %>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <!-- Core theme JS-->
        <script src="js/comprobarLogin.js"></script>
    </body>
</html>
