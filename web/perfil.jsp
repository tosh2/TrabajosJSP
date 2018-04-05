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
    /*
    Utilizado con: Ctrl_Login
    "nivel", y "nombre", son atributos enviados desde: Ctrl_Login
    */
    HttpSession sesion = request.getSession();
            
    int tipo = 0;   /*  1 = Ofertador ; 2 = Ofertante   */
    if(request.getAttribute("tipo")!=null){
        tipo = (Integer)request.getAttribute("tipo");
                //if(tipo == 1){  //  ofertante
        sesion.setAttribute("usuario", request.getAttribute("usuario"));
        sesion.setAttribute("tipo", tipo);
                  //  response.sendRedirect("Admin/admin.jsp");
                //}
    }  
%>
  <%
            Modelo_Usuario usuarioModel  =   new Modelo_Usuario();
            Usuario infoUsuario =   usuarioModel.obtenerInformacionUsuario((String)sesion.getAttribute("usuario"));
  %>
        
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ofertas</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>    
    
  <body>

    <div class="container">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Bolsa Empleo</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="general.jsp">Inicio <span class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Ofertas
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="oferta.jsp">Mis Ofertas</a>
                                <a class="dropdown-item" href="general.jsp">Todas las ofertas</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#">Disabled</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        Bienvenido: 
                            <a href="perfil.jsp"> <%= sesion.getAttribute("usuario")%></a>
                            <h1>|</h1>
                            <a type="submit" class="btn btn-outline-success my-2 my-sm-0" href="index.jsp?cerrar=true">Cerrar Sesion</a>
                    </form>
                </div>
            </nav>  
            <section class="content-header">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"  aria-current="page"><a href="general.jsp">Home</a></li>
                    <li class="breadcrumb-item active" href="inicio.jsp" aria-current="page">Mi Perfil</li>
                </ol>
            </section>
            <section class="content" >
                <div class="col-md-6">
                    <form action="Ctrl_Perfil" method="POST">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Nombre</label>
                            <input type="text" class="form-control"  name="txt_nombre" value="<%= infoUsuario.getNombre() %>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Apellido</label>
                            <input type="text" class="form-control"  name="txt_apellido" value="<%= infoUsuario.getApellido()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Correo</label>
                            <input type="email" class="form-control"  name="txt_correo" value="<%= infoUsuario.getCorreo() %>">
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
                                if(infoUsuario.getSexo().equals("1")){
                                    %>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sexo"  id="sexo" value="1" checked>
                                        <label class="form-check-label" for="inlineRadio1">Hombre</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sexo" id="sexo" value="0">
                                        <label class="form-check-label" for="inlineRadio2">Mujer</label>
                                    </div>
                                    
                                   
                                    <%}else{
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
                                if(infoUsuario.getTipo().equals("1")){
                                    %>
                                   
                                     <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="tipo"  id="tipo" value="1" checked>
                                        <label class="form-check-label" for="inlineRadio1">Administrador</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="tipo" id="tipo" value="0">
                                        <label class="form-check-label" for="inlineRadio2">Postulante</label>
                                    </div>
                                    
                                   
                                    <%}else{
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