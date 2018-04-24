<%-- 
    Document   : login
    Created on : 27-mar-2018, 23:42:16
    Author     : tosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Login</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    </head>


    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp"><h1>Bolsa de Empleo</h1></a>
        </nav>

        <div class="container">

            <div class="row" style="margin-top: 10%">
                <div></div>
                <div class="col-md-4 offset-md-4">
                    <h2 class="text-center">Iniciar Sesión</h2>
                    <hr>
                    <form action="Ctrl_Login" method="POST">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Correo</label>
                            <input type="email" class="form-control" name="txt_usuario" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Correo">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Contraseña</label>
                            <input type="password" class="form-control" name="txt_password" id="exampleInputPassword1" placeholder="Contraseña">
                        </div >
                        <div class="form-group">
                            <a href="registro.jsp">No tienes una cuenta?</a>
                        </div>
                        <div class="form-group">
                            <%
                                Object error = request.getAttribute("error");
                                if (error != null) {
                            %>
                            <label class="text-danger"><%=error%></label>
                            <%}%>
                        </div>

                        <div class="form-group">
                            <button type="submit" name="btn_ingresar" class="form-control btn btn-primary">Inicia Sesión</button>
                        </div>

                    </form>
                </div>
            </div>

        </div>

    </body>
</html>
