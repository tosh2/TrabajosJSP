

<%@page import="Classes.Postulacion"%>
<%@page import="Modelos.Modelo_Postulacion"%>
<%@page import="Modelos.Modelo_Oferta"%>
<%@page import="Modelos.Modelo_Usuario"%>
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


<%
    //si el usuario no ha iniciado 
    HttpSession sesionLogin = request.getSession();
    if (sesionLogin.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
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
        <div class="contenedor">

            <%                     Oferta oferta = new Modelos.Modelo_Oferta().obtenerOferta((String) request.getParameter("idOferta"));
                Modelo_Usuario modeloUsuario = new Modelo_Usuario();
                Usuario usuarioLog = modeloUsuario.obtenerInformacionUsuario((String) sesionLogin.getAttribute("usuario"));
                if (request.getParameter("idOferta") != null) {
            %>
            <h2 style="text-align: center">Oferta # <%=    oferta.getOferta()%></h2>
            <%
                }
            %>
            <hr>
            <div class="col-md-6">
                <form action="Ctrl_Oferta" method="POST"> 

                    <input type="hidden" name="txt_idOferta" value="<%=oferta.getOferta()%>"  readonly="true">
                    Descripcion: 
                    <br>
                    <input disabled class="form-control" type="text" name="txt_descripcion" value="<%= oferta.getDescripcion()%>">
                    <br>
                    Numero de Plazas:<br>
                    <input disabled class="form-control" type="number" min="1" max="100" name="txt_numeroPlazas" value="<%= oferta.getNumeroPlazas()%>">
                    <br>
                    Nivel de Experiencia:<br>
                    <input disabled class="form-control" type="number" min="0" max="100" name="txt_nivelExperiencia" value="<%= oferta.getNivelExperiencia()%>">
                    <br>
                    Salario :<br>
                    <input disabled class="form-control" type="number" name="txt_salario" value="<%= oferta.getSalario()%>">
                    <br>

                    <div class="form-group">
                        <div>
                            <label for="exampleFormControlInput1">Vehiculo: </label>
                        </div>



                        <%
                            if (oferta.getVehiculo().equals("1")) {
                        %>
                        <div class="form-check form-check-inline">
                            <input disabled class="form-check-input" type="radio" name="txt_vehiculo"  id="txt_vehiculo" value="1" checked>
                            <label class="form-check-label" for="inlineRadio1">Si</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input disabled class="form-check-input" type="radio" name="txt_vehiculo" id="txt_vehiculo" value="0">
                            <label class="form-check-label" for="inlineRadio2">No</label>
                        </div>


                        <%} else {
                        %>
                        <div class="form-check form-check-inline">
                            <input disabled class="form-check-input" type="radio" name="txt_vehiculo"  id="txt_vehiculo" value="1">
                            <label class="form-check-label" for="inlineRadio1">Si</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input disabled class="form-check-input" type="radio" name="txt_vehiculo" id="txt_vehiculo" value="0" checked>
                            <label class="form-check-label" for="inlineRadio2">No</label>
                        </div>
                        <%}
                        %>



                    </div>

                    Categoria :<br>
                    <input disabled class="form-control" type="text" name="txt_categoria" value="<%= oferta.getCategoria()%>">
                    <br>
                    Puesto :<br>
                    <input disabled class="form-control" type="text" name="txt_puesto" value="<%= oferta.getPuesto()%>">
                    <br>

                    <br>
                    <br>

                </form>
            </div>
            <div class="col-md-12">
                <h2 style="text-align: center">Postulantes</h2>
                <hr>
                <form action="Ctrl_Oferta" method="POST" >       
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Edad</th>
                                <th scope="col">Sexo</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Opciones</th>
                            </tr>
                        </thead>
                        <%
                            List<Usuario> usuarios = new Modelos.Modelo_Oferta().postulantes(oferta.getOferta());
                            Iterator<Usuario> usuariosIt = usuarios.iterator();
                            Usuario usuario = null;
                            while (usuariosIt.hasNext()) {
                                usuario = usuariosIt.next();
                        %>

                        <tr>
                            <td><%=  usuario.getNombre()%>
                            </td>
                            <td><%=  usuario.getApellido()%>
                            </td>
                            <td><%=  usuario.getCorreo()%>
                            </td>
                            <td><%=  usuario.getEdad()%>
                            </td>
                            <td><%=  usuario.getSexo()%>
                            </td>
                            <%

                                Modelo_Oferta ofertaModel = new Modelo_Oferta();
                                int isOfertaUsuario = ofertaModel.isOfertaUsuario(oferta.getOferta(), (String) sesionLogin.getAttribute("usuario"));
                                Modelo_Postulacion modeloPost = new Modelo_Postulacion();
                                Postulacion postulacion = modeloPost.getPostulacion(usuario.getUsuario(), oferta.getOferta());
                            %>
                            <td >
                                <%if (postulacion != null) {%> 
                                <% if (postulacion.getEstado().equalsIgnoreCase("0")) {%>
                        <spam style="color: darkorange">Pendiente</spam>
                            <%} else if (postulacion.getEstado().equalsIgnoreCase("1")) {%>
                        <spam style="color: green">Aceptada</spam>
                            <%} else {%>
                        <spam style="color: red">Rechazada</spam>
                            <%}%>
                            <%}%>
                        </td>

                        <td>
                            <%if (postulacion != null) {%> 
                            <%if (isOfertaUsuario == 1) {%> 

                            <form action="Ctrl_Oferta" method="POST">
                                <input type="hidden" name="idOferta" value="<%=oferta.getOferta()%>"  readonly="true">
                                <input type="hidden" name="idPostulante" value="<%=usuario.getUsuario()%>"  readonly="true">
                                <input type="hidden" name="idUsuario" value="<%=usuarioLog.getUsuario()%>"  readonly="true">

                                <% if (postulacion.getEstado().equalsIgnoreCase("0") || postulacion.getEstado().equalsIgnoreCase("2")) {%>
                                <input type="submit" name="btn_aceptar" class="btn btn-success" value="Aceptar">

                                <% } else { %>
                                <input type="submit" name="btn_aceptar" class="btn btn-success" value="Aceptar" disabled>
                                <%}%>


                                <% if (postulacion.getEstado().equalsIgnoreCase("0") || postulacion.getEstado().equalsIgnoreCase("1")) {%>

                                <input type="submit" name="btn_rechazar" class="btn btn-danger" value="Rechazar"> 
                                <% } else { %>
                                <input type="submit" name="btn_rechazar" class="btn btn-danger" value="Rechazar" disabled> 
                                <%}%>

                                <%}%>
                            </form>
                            <%}%>
                        </td>

                        </tr>    
                        <%
                            }
                        %>
                    </table>
                </form>
            </div>

        </div> <!-- /container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>