<%-- 
    Document   : oferta
    Created on : 29-mar-2018, 2:48:11
    Author     : tosh
--%>

<%@page import="Classes.Oferta"%>
<%@page import="java.util.*"%>
<%@page import="Modelos.Modelo_Oferta"%>
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
        <title>Mis Ofertas</title>
    </head>
    <body>
        <div align="right">
            Bienvenido <%= sesion.getAttribute("usuario")%>
            |
            <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            <hr>
        </div>
        <h1>Mis Ofertas</h1>
            
        
        <!--    tosh    -   Lista de Ofertas    -->
        <form action="Ctrl_Oferta">
            <select name="">
                <%
                    Modelo_Oferta ofertasModel = new Modelo_Oferta();
                    List<Oferta> listaOfertas = ofertasModel.obtenerOfertasPorUsuario((String)sesion.getAttribute("usuario"));
                    Iterator<Oferta> it = listaOfertas.iterator();
                    Oferta of = null;
                    
                    while(it.hasNext()){
                        of = it.next();
                %>
                    <option value="<%= of.getOferta() %>"><%= of.getOferta() %> - <%= of.getTitulo()%></option>
                <%
                    }
                %>
            </select>
            <input type="submit" name="btn_editar" value="Seleccionar">
        </form>
        <br>
        
        <!--    tosh
                Ctrl_Oferta = controlador
        -->
        <form action="Ctrl_Oferta" method="POST"> 
            Titulo: <br>
            <input type="text" name="txt_titulo" >
            <br>
            Descripcion: 
            <br>
            <input type="text" name="txt_descripcion" >
            <br>
            Numero de Plazas:<br>
            <input type="text" name="txt_numeroPlazas">
            <br>
            Nivel de Experiencia:<br>
            <input type="text" name="txt_nivelExperiencia">
            <br>
            Salario :<br>
            <input type="text" name="txt_salario">
            <br>
            Vehiculo :<br>
            <input type="text" name="txt_vehiculo">
            <br>

            <br>
            <input type="submit" name="btn_crear" value="Crear">
            <input type="submit" name="btn_editar" value="Editar">
            <input type="submit" name="btn_eliminar" value="Eliminar">
            <br>
        </form>
        
    </body>
</html>
