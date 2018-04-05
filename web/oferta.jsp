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
String dis=null;
if(request.getParameter("cbodis")!=null){
    dis=request.getParameter("cbodis");
}
%>
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
                    <li class="breadcrumb-item active" href="inicio.jsp" aria-current="page"><a href="general.jsp">Home</a></li>
                    <li class="breadcrumb-item active" href="inicio.jsp" aria-current="page">Mis Ofertas</li>
                </ol>
            </section>
                          
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
                        listaOfertas = ofertasModel.miOferta((String)sesion.getAttribute("usuario"));
                        
                        Iterator<Oferta> it = listaOfertas.iterator();
                        Oferta of = null;
                        while(it.hasNext()){
                            %>
                            <tr>
                                <%
                                    of = it.next();
                                    %>

                                    <td>
                                        <%= of.getOferta() %>

                                    </td>

                                    <td>

                                        <%= of.getTitulo() %>

                                    </td>

                                    <td>

                                        <%= of.getDescripcion() %>

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
                                        <a href="verOferta.jsp?idOferta=<%=of.getOferta()%>" class="btn btn-primary">Ver Oferta</a>
                                        <%
                                        if(Integer.parseInt(of.getEstado()) == 0){
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


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>