<%-- 
    Document   : registro
    Created on : 27-mar-2018, 20:36:47
    Author     : tosh
--%>

<%@page contentType="text/html;charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    /*
        Utilizado con: Ctrl_Registro
        "nivel", y "nombre", son atributos enviados desde: Ctrl_Registro
     */

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    </head>
    <body>

        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp"><h1>Bolsa de Empleo</h1></a>
            <div align="right">
                <a class="btn btn-outline-primary my-2 my-sm-0" href="registro.jsp">Registrarse</a>
                <a class="btn btn-outline-primary my-2 my-sm-0" href="login.jsp">Iniciar Sesión</a>
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="signup-form-container">
                        <form name="form1" autocomplete="off" action="Ctrl_Registro" enctype="MULTIPART/FORM-DATA" method="POST"> 
                            <div class="form-header">
                                <h3 class="form-title"><i class="fa fa-user"></i> Registrarme</h3>
                                <div class="pull-right">
                                    <h3 class="form-title"><span class="glyphicon glyphicon-pencil"></span></h3>
                                </div>
                            </div>
                            <div class="form-body">                      
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                                        <input name="txt_nombre" type="text" required class="form-control" placeholder="Nombre">
                                    </div>
                                    <span class="help-block" id="error"></span>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                                        <input name="txt_apellido" required type="text" class="form-control" placeholder="Apellido">
                                    </div>
                                    <span class="help-block" id="error"></span>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                                        <input name="txt_edad" type="number" min="0" max="125" required class="form-control" placeholder="Edad" >
                                    </div>
                                    <span class="help-block" id="error"></span>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></div>
                                        <input name="txt_correo" type="email" required class="form-control" placeholder="Correo">
                                    </div> 
                                    <span class="help-block" id="error"></span>                     
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <fieldset class="form-group">
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input type="radio" class="form-check-input" name="sexo" value="1" checked>
                                                        Hombre
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input type="radio" class="form-check-input" name="sexo" value="0">
                                                        Mujer
                                                    </label>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-4">
                                            <fieldset class="form-group">
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input type="radio" class="form-check-input" name="tipo" value="1" checked>
                                                        Empleador
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input type="radio" class="form-check-input" name="tipo" value="2">
                                                        Empleado
                                                    </label>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>

                            </div>                                
                            <div class="row">

                                <div class="form-group col-lg-6">
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                                        <input name="txt_password" id="password" required type="password" class="form-control" placeholder="Contraseña">
                                    </div>  
                                    <span class="help-block" id="error"></span>                    
                                </div>

                                <div class="form-group col-lg-6">
                                    <div class="input-group">
                                        <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                                        <input name="txt_password_conf" type="password" class="form-control" placeholder="Confirmar Contraseña">
                                    </div>  
                                    <span class="help-block" id="error"></span>                    
                                </div>

                            </div>
                            <input type="file" name="photo" />
                            <br>
                            <br>
                            <div>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                    Politicas de privacidad
                                </button>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <fieldset class="form-group">
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="politica" value="1" >
                                                    Acepto Las Politicas de Privacidad
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="politica" value="2" checked>
                                                    No Acepto las Politicas de Privacidad
                                                </label>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                            <%                        Object error = request.getAttribute("error");
                                if (error != null) {
                            %>
                            <label class="text-danger"><%=error%></label>
                            <%}%>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary " class="form-control" name="btn_registrar">
                                    Registrar
                                </button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <div class="container">

        </div>





        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Politicas de Privacidad</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Estas son las politicas de privacidad .i. 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>
</html>
