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
    /*
    Utilizado con: Ctrl_Login
    "nivel", y "nombre", son atributos enviados desde: Ctrl_Login
    */
    HttpSession sesion = request.getSession();
            
    int tipo = 0;   /*  1 = Ofertador ; 2 = Ofertante   */
    if(request.getAttribute("tipo")!=null){
        tipo = (Integer)request.getAttribute("tipo");
        sesion.setAttribute("usuario", request.getAttribute("usuario"));
        sesion.setAttribute("tipo", tipo);
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
                    <li class="breadcrumb-item active" href="inicio.jsp" aria-current="page"><a href="general.jsp" >Home</a></li>
                    <li class="breadcrumb-item active" href="inicio.jsp" aria-current="page">Editar Oferta</li>
                </ol>
            </section>
            <section class="content" >
                 <%
        Oferta oferta = new Modelos.Modelo_Oferta().obtenerOferta((String)request.getParameter("idOferta"));
            
        if(request.getParameter("idOferta")!=null){    
        %>
            <h1>Oferta # <%=    oferta.getOferta()  %></h1>
        <%
        }    
        %>
                <form>
            <input type="range" name="points" min="0" max="10">
        </form>
        <form>
            Quantity (between 1 and 5):
            <input type="number" name="quantity" min="1" max="5">
            <input type="number" required name="price" min="0" value="0" step="0.01">
        </form>
        <hr>
        <div class="col-md-6">
        <form action="Ctrl_Oferta" method="POST"> 
          
            <input type="hidden" name="txt_idOferta" value="<%=oferta.getOferta()%>"  readonly="true">
            Titulo: <br>
            <input class="form-control" type="text" name="txt_titulo" value="<%= oferta.getTitulo()%>">
            <br>
            Descripcion: 
            <br>
            <input class="form-control" type="text" name="txt_descripcion" value="<%= oferta.getDescripcion()%>">
            <br>
            Numero de Plazas:<br>
            <input class="form-control" type="text" name="txt_numeroPlazas" value="<%= oferta.getNumeroPlazas()%>">
            <br>
            Nivel de Experiencia:<br>
            <input class="form-control" type="text" name="txt_nivelExperiencia" value="<%= oferta.getNivelExperiencia()%>">
            <br>
            Salario :<br>
            <input class="form-control" type="text" name="txt_salario" value="<%= oferta.getSalario()%>">
            <br>
           
             <div class="form-group">
                            <div>
                                <label for="exampleFormControlInput1">Vehiculo: </label>
                            </div>
                            
                            
                            
                            <%
                                if(oferta.getVehiculo().equals("1")){
                                    %>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="txt_vehiculo"  id="txt_vehiculo" value="1" checked>
                                        <label class="form-check-label" for="inlineRadio1">Si</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="txt_vehiculo" id="txt_vehiculo" value="0">
                                        <label class="form-check-label" for="inlineRadio2">No</label>
                                    </div>
                                    
                                   
                                    <%}else{
                                    %>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="txt_vehiculo"  id="txt_vehiculo" value="1">
                                        <label class="form-check-label" for="inlineRadio1">Si</label>
                                    </div>
                                    <div class="form-check form-check-inline">
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
            <input type="submit" class="btn btn-success" name="btn_postularse" value="Postularse">
            <input type="submit" class="btn btn-warning" name="btn_editar" value="Editar">
            <br>
        </form>
        </div>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                  <th scope="col">Nombre</th>
                  <th scope="col">Apellido</th>
                  <th scope="col">Correo</th>
                  <th scope="col">Edad</th>
                  <th scope="col">Sexo</th>
                </tr>
            </thead>
            <%
                List<Usuario> usuarios = new Modelos.Modelo_Oferta().postulantes(oferta.getOferta());
                Iterator<Usuario>usuariosIt = usuarios.iterator();
                Usuario usuario = null;
                while(usuariosIt.hasNext()){
                    usuario = usuariosIt.next();
            %>
            
            <tr>
                <td><%=  usuario.getNombre()    %>
                </td>
                <td><%=  usuario.getApellido()    %>
                </td>
                <td><%=  usuario.getCorreo()    %>
                </td>
                <td><%=  usuario.getEdad()    %>
                </td>
                <td><%=  usuario.getSexo()    %>
                </td>
            </tr>    
            <%
                }
            %>
        </table>
        
                
            </section>          
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>