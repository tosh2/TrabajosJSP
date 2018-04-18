<%-- 
    Document   : verOferta
    Created on : 02-abr-2018, 19:06:41
    Author     : tosh
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Classes.Usuario"%>
<%@page import="Classes.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Classes.Oferta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ofertas</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>    

    <body>



        <%@ include file="navBar.jsp" %>
        <div class="contenedor">
            <section class="content" >
                <%                     Oferta oferta = new Modelos.Modelo_Oferta().obtenerOferta((String) request.getParameter("idOferta"));

                    if (request.getParameter("idOferta") != null) {
                %>
                <h2 style="text-align: center">Oferta # <%=    oferta.getOferta()%></h2>
                <%
                    }
                %>


                <hr>
                <div class="col-md-6">
                    <form action="Ctrl_Oferta" method="POST"> 


                        Titulo: <br>
                        <input class="form-control" type="text" name="txt_titulo" value="<%= oferta.getTitulo()%>">
                        <br>
                        Descripcion: 
                        <br>
                        <input class="form-control" type="text" name="txt_descripcion" value="<%= oferta.getDescripcion()%>">
                        <br>
                        Numero de Plazas:<br>
                        <input class="form-control" type="number" name="txt_numeroPlazas" value="<%= oferta.getNumeroPlazas()%>">
                        <br>
                        Nivel de Experiencia:<br>
                        <input class="form-control" type="number" name="txt_nivelExperiencia" value="<%= oferta.getNivelExperiencia()%>">
                        <br>
                        Salario :<br>
                        <input class="form-control" type="number" name="txt_salario" value="<%= oferta.getSalario()%>">
                        <br>

                        <div class="form-group">
                            <div>
                                <label for="exampleFormControlInput1">Vehiculo: </label>
                            </div>



                            <%
                                if (oferta.getVehiculo().equals("1")) {
                            %>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="txt_vehiculo"  id="txt_vehiculo" value="1" checked>
                                <label class="form-check-label" for="inlineRadio1">Si</label>
                            </div>
                            <div class="form-check form-check-inline" disabled>
                                <input class="form-check-input" type="radio" name="txt_vehiculo" id="txt_vehiculo" value="0">
                                <label class="form-check-label" for="inlineRadio2">No</label>
                            </div>


                            <%} else {
                            %>
                            <div class="form-check form-check-inline" disabled>
                                <input class="form-check-input" type="radio" name="txt_vehiculo"  id="txt_vehiculo" value="1">
                                <label class="form-check-label" for="inlineRadio1">Si</label>
                            </div>
                            <div class="form-check form-check-inline" disabled>
                                <input class="form-check-input" type="radio" name="txt_vehiculo" id="txt_vehiculo" value="0" checked>
                                <label class="form-check-label" for="inlineRadio2">No</label>
                            </div>
                            <%}
                            %>



                        </div>
                        <br>
                        Categoria :<br>
                        <input class="form-control" type="text" name="txt_categoria" value="<%= oferta.getCategoria()%>">
                        <br>
                        Puesto :<br>
                        <input class="form-control" type="text" name="txt_puesto" value="<%= oferta.getPuesto()%>">
                        <br>

                        <br>
                        <br>
                        <a href="general.jsp" style="padding:10px;border-radius:5px;background: #337ab7;color:white;">Regresar</a>
                        <br>
                    </form>
                </div>        
            </section>          
        </div> <!-- /container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>