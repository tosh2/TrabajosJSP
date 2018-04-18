<%-- 
    Document   : Perfil
    Created on : 28-mar-2018, 23:59:44
    Author     : tosh
--%>

<%@page import="Classes.Usuario"%>
<%@page import="Modelos.Modelo_Usuario"%>
<%@page import ="java.io.*" %>
<%@page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesionAux = request.getSession();
    Modelo_Usuario usuarioModel = new Modelo_Usuario();
    Usuario infoUsuario = usuarioModel.obtenerInformacionUsuario((String) sesionAux.getAttribute("usuario"));
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ofertas</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>    

    <body>



        <%@ include file="navBar.jsp" %>
        <div class="contenedor">
            <h2 style="text-align: center">Mi Perfil</h2>
            <hr>
            <section class="content" >
                <div class="col-md-6">
                    <form action="Ctrl_Perfil" method="POST">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Nombre</label>
                            <input type="text" class="form-control"  name="txt_nombre" value="<%= infoUsuario.getNombre()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Apellido</label>
                            <input type="text" class="form-control"  name="txt_apellido" value="<%= infoUsuario.getApellido()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Correo</label>
                            <input type="email" class="form-control"  name="txt_correo" value="<%= infoUsuario.getCorreo()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Edad</label>
                            <input type="number" class="form-control"  name="txt_edad" value="<%= infoUsuario.getEdad()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Contrasenha</label>
                            <input type="password" class="form-control"  name="txt_password">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Confirmar Contrasenha</label>
                            <input type="password" class="form-control"  name="txt_password_conf">
                        </div>
                        <div class="form-group">
                            <div>
                                <label for="exampleFormControlInput1">Sexo: </label>
                            </div>



                            <%
                                if (infoUsuario.getSexo().equals("1")) {
                            %>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="sexo"  id="sexo" value="1" checked>
                                <label class="form-check-label" for="inlineRadio1">Hombre</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="sexo" id="sexo" value="0">
                                <label class="form-check-label" for="inlineRadio2">Mujer</label>
                            </div>


                            <%} else {
                            %>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="sexo"  id="sexo" value="1">
                                <label class="form-check-label" for="inlineRadio1">Hombre</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="sexo" id="sexo" value="0" checked>
                                <label class="form-check-label" for="inlineRadio2">Mujer</label>
                            </div>
                            <%}
                            %>



                        </div>
                        <div class="form-group">
                            <div>
                                <label for="exampleFormControlInput1">Tipo Usuario: </label>
                            </div>




                            <%
                                if (infoUsuario.getTipo().equals("1")) {
                            %>

                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="tipo"  id="tipo" value="1" checked>
                                <label class="form-check-label" for="inlineRadio1">Administrador</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="tipo" id="tipo" value="0">
                                <label class="form-check-label" for="inlineRadio2">Postulante</label>
                            </div>


                            <%} else {
                            %>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="sexo"  id="inlineRadio1" value="1">
                                <label class="form-check-label" for="inlineRadio1">Administrador</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="sexo" id="inlineRadio2" value="0" checked>
                                <label class="form-check-label" for="inlineRadio2">Postulante</label>
                            </div>
                            <%}
                            %>



                        </div>

                        <div class="form-group">
                            <img src="${pageContext.request.contextPath}/images/<%=sesion.getAttribute("usuario")%>" style="width:200px;height:200px;">
                        </div>            


                        <div class="form-group">
                            <input type="submit" name="btn_guardar" value="Guardar">
                        </div>
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