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
        <title>Oferta</title>
    </head>
    <body>
        
        <!--    ------------------------------------------------------------------------    -->
        <div align="right"> 
            Bienvenido <%= sesion.getAttribute("usuario")%>
            |
            <a href="general.jsp">Inicio</a>
            |
            <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            <hr>
        </div>
        <!--    ------------------------------------------------------------------------    -->
        
        <%
        Oferta oferta = new Modelos.Modelo_Oferta().obtenerOferta((String)request.getParameter("idOferta"));
            
        if(request.getParameter("idOferta")!=null){    
        %>
            <h1>Oferta # <%=    oferta.getOferta()  %></h1>
        <%
        }    
        %>
        
       <!-- <form action="Ctrl_verOferta" method="GET">
            E-mail:
            <input type="email" name="email">
        </form>-->
        <form>
            <input type="range" name="points" min="0" max="10">
        </form>
        <form>
            Quantity (between 1 and 5):
            <input type="number" name="quantity" min="1" max="5">
            <input type="number" required name="price" min="0" value="0" step="0.01">
        </form>
        <hr>
        <form action="Ctrl_veroferta" method="POST"> 
            Id:<br>
            <input type="text" name="txt_idOferta" value="<%=oferta.getOferta()%>"  readonly="true">
            <br>
            Titulo: <br>
            <input type="text" name="txt_titulo" value="<%= oferta.getTitulo()%>">
            <br>
            Descripcion: 
            <br>
            <input type="text" name="txt_descripcion" value="<%= oferta.getDescripcion()%>">
            <br>
            Numero de Plazas:<br>
            <input type="text" name="txt_numeroPlazas" value="<%= oferta.getNumeroPlazas()%>">
            <br>
            Nivel de Experiencia:<br>
            <input type="text" name="txt_nivelExperiencia" value="<%= oferta.getNivelExperiencia()%>">
            <br>
            Salario :<br>
            <input type="text" name="txt_salario" value="<%= oferta.getSalario()%>">
            <br>
            Vehiculo :<br>
            <input type="text" name="txt_vehiculo" value="<%= oferta.getVehiculo()%>">
            <br>
            Categoria
        
            <br>
            <br>
            <input type="submit" name="btn_postularse" value="Postularse">
            <br>
        </form>
        
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
        
    </body>
</html>