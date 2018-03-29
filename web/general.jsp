<%-- 
    Document   : general
    Created on : 28-mar-2018, 0:02:01
    Author     : tosh
--%>

<%@page import="Modelos.Modelo_Oferta"%>
<%@page import="Classes.Oferta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="java.util.*" %>

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
    </head>    
    <body>
        <div align="right">
            Bienvenido <%= sesion.getAttribute("usuario")%>
            |
            <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            <hr>
        </div>
        <h1>Bienvenido A General</h1>
        <a href="perfil.jsp">Perfil</a>
        <br>
        <a href="oferta.jsp">Mis Ofertas</a>
        <br>
        <a href="">--</a>
        <br>
        <%
            /*
                tosh - Obtenemos una lista del modelo "Oferta",
                       e iteramos sobre la lista
            */
            Modelo_Oferta ofertasModel = new Modelo_Oferta();
            List<Oferta> listaOfertas = ofertasModel.obtenerOfertas();
            Iterator<Oferta> it = listaOfertas.iterator();
            Oferta of = null;
            
            while(it.hasNext()){
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
        <%
            }
        %>
        
    </body>
</html>
