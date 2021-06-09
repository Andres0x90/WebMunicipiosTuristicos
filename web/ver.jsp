<%-- 
    Document   : index
    Created on : 4/06/2021, 08:17:26 PM
    Author     : Andres
--%>

<%@page import="modelo.Municipio"%>
<%@page import="controlador.Controlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Ver municipio - Municipios Turisticos de Antioquia</title>
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
                <h1>Ver municipio</h1>
                <p class="lead">Visualiza la informacion de otros municipios registrados por nuestros usuarios</p>
                
                 <% if(session.getAttribute("usuario") == null){  %>
                        <div class="alert alert-danger" role="alert">
                            Necesita iniciar sesion para ingresar a esta pagina                   
                        </div>
                <%} else { %>  
                    <% if (request.getParameter("idmunicipio") != null){ %>
                    <%! Municipio municipio; %>
                    <% municipio = Controlador.obtenerMunicipio("id", request.getParameter("idmunicipio")).get(0); %>
                        <% if (municipio != null ){%>
                            <form class="row col-md-6 g-3 mx-auto my-3 ">
                                 <div class="col-md-4">
                                  <label for="id" class="form-label" >ID</label>
                                  <input type="text" disabled class="form-control text-center" name="id" id="id"
                                         value="<%= municipio.getIdmunicipio()  %>">
                                </div>                       
                                <div class="col-md-4">
                                  <label for="nombre" class="form-label" >Nombre del municipio</label>
                                  <input type="text" disabled class="form-control text-center" name="nombre" id="nombre"
                                         value="<%= municipio.getNombre()%>">
                                </div>
                                <div class="col-md-4">
                                    <label for="subregion" class="form-label ">Subregion</label>
                                    <select class="form-select " disabled name="subregion" id="subregion" aria-label="Subregion del municipio">
                                        <option selected><%= municipio.getSubregion()%></option>
                                    </select>
                                </div>
                                <div class="col-12 form-floating">
                                    <textarea class="form-control" disabled name="descripcion" maxlength="500" placeholder="Escribe una descripcion del municipio"  
                                              id="descripcion" style="height: 180px"><%= municipio.getDescripcion()%> </textarea>
                                  <label for="descripcion">Descripcion</label>
                                </div>
                                <div class="col-md-4">
                                  <label for="km_distancia"  class="form-label">km de distancia de Medellin</label>
                                  <input type="number" disabled class="form-control text-center" name="km_distancia" id="km_distancia"
                                         value="<%= municipio.getKm_distancia()%>">
                                </div>
                                <div class="col-md-4">
                                  <label for="telefono" class="form-label">Telefono</label>
                                  <input type="text" disabled class="form-control text-center" name="telefono" id="telefono"
                                         value="<%= municipio.getTelefono()%>">
                                </div>
                                <div class="col-md-4">
                                  <label for="fecha" class="form-label">Fecha de registro</label>
                                  <input type="text" disabled class="form-control text-center" name="fecha" id="fecha"
                                         value="<%= municipio.getFecha()%>">
                                </div>
                                <div class="col-12">
                                    <label for="fecha" class="form-label">Autor</label>
                                    <input type="text" disabled class="form-control text-center" name="autor" id="autor"
                                           value="<%= municipio.getUsuario().getCuenta() %>">
                                </div>
                            </form>
                        <%}else{ %>
                                <div class="col-12">
                                    <div class="alert alert-danger" role="alert">
                                        No se encontro ningun municipio con ese id
                                    </div>
                                </div>
                            <% } %>
                        <% } else { %>
                            <div class="col-12">
                                <div class="alert alert-warning" role="alert">
                                    Debe referenciar a un id para poder ver la informacion del municipio solicitado
                                </div>
                            </div>
                        <% } %>
                         
                 <% } %>
                 
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <!-- Core theme JS-->

    </body>
</html>
