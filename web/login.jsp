<%-- 
    Document   : login
    Created on : 27-mar-2018, 23:42:16
    Author     : tosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
            /*
                tosh - 
                Utilizado con: Ctrl_Login
                "nivel", y "nombre", son atributos enviados desde: Ctrl_Login
            */
            HttpSession sesion = request.getSession();
            
            int tipo = 0;   /*  1 = Ofertador ; 2 = Ofertante   */
            if(request.getAttribute("tipo")!=null){
                tipo = (Integer)request.getAttribute("tipo");
               // if(tipo == 1){  //  ofertante
                    sesion.setAttribute("usuario", request.getAttribute("usuario"));
                    sesion.setAttribute("tipo", tipo);
                    
                    response.sendRedirect("general.jsp");
                //}
            }
        %>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Log-In</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    </head>
    <body>
        <div class="jumbotron" style="padding-top: 45px">
            <div align="right" style="padding-right: 20px;">
                <a href="index.jsp" style="padding:10px;border-radius:5px;background: #337ab7;color:white;">Regresar</a>
            </div>
        </div>
        <div class="container">        
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h2>Inicia Sesion</h2>
                <hr>
            </div>
        </div>
        
        <!-- tosh
                Ctrl_Login = nombre del Servlet/Controlador
                txt_usuario, txt_password se envian como parametros al servlet
                btn_ingresar realiza la accion, y se compara en servlet
        -->
        <form class="form-horizontal" action="Ctrl_Login" method="POST"> 
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="form-group has-danger">
                        <label class="sr-only" for="email">Email</label>
                        <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                            <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                            <input type="text" name="txt_usuario" class="form-control" id="email"
                                   placeholder="you@example.com" required autofocus>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="sr-only" for="password">Password</label>
                        <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                            <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
                            <input type="password" name="txt_password" class="form-control" id="password"
                                   placeholder="Password" required>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-control-feedback">
                        <span class="text-danger align-middle">
                        <!-- Put password error message here -->    
                        </span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6" style="padding-top: .35rem">
                    <div class="form-check mb-2 mr-sm-2 mb-sm-0">
                        <label class="form-check-label">
                            <input class="form-check-input" name="remember"
                                   type="checkbox" >
                            <span style="padding-bottom: .15rem">Remember me</span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="row" style="padding-top: 1rem">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <button name="btn_ingresar" type="submit" class="btn btn-success"><i class="fa fa-sign-in"></i> Login</button>
                    <a class="btn btn-link" href="">Forgot Your Password?</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    ¿No tienes cuenta?<a class="btn btn-link" href="registro.jsp">Registrarme</a>
                </div>
            </div>            
        </form>
            
        </div>
    </body>
</html>
