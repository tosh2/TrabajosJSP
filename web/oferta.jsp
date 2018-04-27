<%-- 
    Document   : oferta
    Created on : 29-mar-2018, 2:48:11
    Author     : tosh
--%>

<%@page import="java.sql.*"%>
<%@page import="Classes.Puesto"%>
<%@page import="Classes.Categoria"%>
<%@page import="Classes.Oferta"%>
<%@page import="java.util.*"%>
<%@page import="Modelos.Modelo_Oferta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    //si el usuario no ha iniciado 
    HttpSession sesionLogin = request.getSession();
    if (sesionLogin.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%
    String dis = null;
    if (request.getParameter("cbodis") != null) {
        dis = request.getParameter("cbodis");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ofertas</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>    

    <body>



        <%@ include file="navBar.jsp" %> 
        <div class="contenedor col-md-12" >

            <h2 style="text-align: center">Mis Ofertas</h2>


            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID</th>

                        <th scope="col">Título</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">No. Plazas</th>
                        <th scope="col">Nivel Experiencia</th>
                        <th scope="col">Salario</th>
                        <th scope="col">Vehiculo</th>
                        <th scope="col">Opciones</th>
                    </tr>
                </thead>
                <%
                    /*
      tosh - Obtenemos una lista del modelo "Oferta",
      e iteramos sobre la lista
                     */
                    Modelo_Oferta ofertasModel = new Modelo_Oferta();
                    List<Oferta> listaOfertas;
                    listaOfertas = ofertasModel.miOferta((String) sesionLogin.getAttribute("usuario"));

                    Iterator<Oferta> it = listaOfertas.iterator();
                    Oferta of = null;
                    while (it.hasNext()) {
                %>
                <tr>
                    <%
                        of = it.next();
                    %>

                    <td>
                        <%= of.getOferta()%>

                    </td>

                    <td>

                        <%= of.getTitulo()%>

                    </td>

                    <td>

                        <%= of.getDescripcion()%>

                    </td>

                    <td>

                        <%= of.getNumeroPlazas()%>

                    </td>

                    <td>

                        <%= of.getNivelExperiencia()%>

                    </td>

                    <td>

                        <%= of.getSalario()%>

                    </td>

                    <td>

                        <%= of.getVehiculo()%>

                    </td>    

                    <td>
                        <form method="POST" action="Ctrl_Oferta" >
                            <a href="verOferta.jsp?idOferta=<%=of.getOferta()%>" class="btn btn-primary">Ver</a>
                            <a href="editarOferta.jsp?idOferta=<%=of.getOferta()%>" class="btn btn-primary">Editar</a>
                            <%
                                if (Integer.parseInt(of.getEstado()) == 0) {
                            %>
                            <input type="hidden" value="<%=of.getOferta()%>" name="txt_id" >
                            <input type="submit" name="btn_publicar" class="btn btn-danger" value="Publicar">
                            <%
                                }
                            %>
                        </form>       

                    </td>

                </tr>    

                <%}%>

                <tbody>

                </tbody>
            </table>

        </section>          
    </div> <!-- /container -->

    <!-- Modal -->
    <div class="modal fade" id="ModalAlerta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLabel"><%=request.getAttribute("mensaje")%></h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <%
        Object error = request.getAttribute("mensaje");
        if (error != null) {%>
    <script>
        //$('#ModalEditar').modal('toggle');
        $('#ModalAlerta').modal('show');

    </script>

    <%}%>

</body>
</html>