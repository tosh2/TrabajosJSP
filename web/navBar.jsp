<%-- 
    Document   : navBar
    Created on : 8/04/2018, 03:31:30 PM
    Author     : Jose
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    /*
    Utilizado con: Ctrl_Login
    "nivel", y "nombre", son atributos enviados desde: Ctrl_Login
     */
    HttpSession sesion = request.getSession();

    int tipo = 0;
    /*  1 = Ofertador ; 2 = Ofertante   */
    if (request.getAttribute("tipo") != null) {
        tipo = (Integer) request.getAttribute("tipo");
        //if(tipo == 1){  //  ofertante
        sesion.setAttribute("usuario", request.getAttribute("usuario"));
        sesion.setAttribute("tipo", tipo);
        //  response.sendRedirect("Admin/admin.jsp");
        //}
    }
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
            <li class="nav-item dropdown">
                <a class="nav-link" href="blog.jsp">Blog</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" style="color:white">
            Bienvenido: 
            <a href="perfil.jsp"><%= sesion.getAttribute("usuario")%></a>

            <a type="submit" class="btn btn-outline-success my-2 my-sm-0" href="index.jsp?cerrar=true">Cerrar Sesion</a>
        </form>
    </div>
</nav>  
