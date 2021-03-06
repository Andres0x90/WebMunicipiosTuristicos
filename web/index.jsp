<%-- 
    Document   : index
    Created on : 4/06/2021, 08:17:26 PM
    Author     : Andres
--%>

<%@page import="controlador.Controlador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Municipio"%>
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
        <title>Municipios Turisticos de Antioquia</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

    </head>
    <body>
        <!-- Responsive navbar-->
        <% if (request.getParameter("action") != null && request.getParameter("action").equalsIgnoreCase("logout")
                && session.getAttribute("usuario") != null){
            session.removeAttribute("usuario");
        }    
        %>
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
                <h1>Ver todos los municipios registrados</h1>
                <p class="lead">Visualiza la lista completa de los municipios que tenemos registrados</p>
 
                <div class="row col-md-8 mx-auto my-2">
                            <table class="table table-striped">
                            <caption>Lista de municipios</caption>
                            <thead>
                                <tr>
                                    <th>Municipio</th>
                                    <th>Subregion</th>
                                    <th>Mas informacion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%! ArrayList<Municipio> municipios; %>
                                <%  if (request.getParameter("subregion") != null)
                                        municipios = Controlador.obtenerMunicipio("subregion", request.getParameter("subregion").toString());
                                    else
                                        municipios = Controlador.obtenerMunicipio("", null);
                                
                                    if (municipios != null){
                                        for (Municipio municipio: municipios){ %>
                                        <tr>
                                            <td><%= municipio.getNombre() %></td>
                                            <td><%= municipio.getSubregion()%></td>
                                            <td><a href="ver.jsp?idmunicipio=<%= municipio.getIdmunicipio()%>">Ver mas</a></td>
                                        </tr>
                                <%      } 
                                    } %>
                            </tbody>
                      </table>
                </div>
                        <form action="index.jsp" method="GET" class="row col-md-4 mx-auto"> 
                            
                            <label for="subregion" class="form-label ">Subregion</label>
                            <select class="form-select " name="subregion" id="subregion" aria-label="Subregion del municipio">
                                <option selected></option>
                                <option value="Valle de Aburra">Valle de Aburr??</option>
                                <option value="Oriente">Oriente</option>
                                <option value="Suroeste">Suroeste</option>
                                <option value="Norte">Norte</option>
                                <option value="Occidente">Occidente</option>
                                <option value="Uraba">Urab??</option>
                                <option value="Nordeste">Nordeste</option>
                                <option value="Magdalena">Magdalena</option>
                                <option value="Medio">Medio</option>
                                <option value="Bajo Cauca">Bajo Cauca</option>
                            </select>
                        
                        <div class="col-12 my-3">
                            <button type="submit" onclick="return comprobar()" class="btn btn-dark col-4 float-end">Filtrar</button>
                       </div>
                    </form>  
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <!-- Core theme JS-->
        <script src="js/comprobarFiltroIndex.js"></script>
    </body>
</html>
