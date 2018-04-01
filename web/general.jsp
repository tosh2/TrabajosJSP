<%-- 
    Document   : general
    Created on : 28-mar-2018, 0:02:01
    Author     : tosh
--%>

<%@page import="Classes.Puesto"%>
<%@page import="Classes.Categoria"%>
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
<% 
String dis=null;
if(request.getParameter("cbodis")!=null){
    dis=request.getParameter("cbodis");
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ofertas</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>    
    <body>
        <div align="right">
            Bienvenido <%= sesion.getAttribute("usuario")%>
            |
            <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            <hr>
        </div>
        <h1>Bienvenido A General</h1>
        <a href="perfil.jsp" class="btn btn-primary">Perfil</a>
        <br>
        <br>
        <a href="oferta.jsp" class="btn btn-primary">Mis Ofertas</a>        
        <br>
        <br>
        <form action="" method="POST">
            <table width="50%" border="0">
                <tr>
                    <td>Selección filtro</td>
                    <td style="padding: 0px 15px;">
                        
                        <select name="cbodis" id="cbodis" style="background: #212529;padding:10px;color: white;">
                            <option value="1">categoria</option>
                            <option value="2">puesto</option>
                            <!--<option value="3">mercado</option>-->
                        </select></td>
                    <td style="padding: 0px 15px;">
                        <input type="submit" name="btn_seleccion" id="btn_seleccion" style="background: #212529;padding: 8px 15px;color:  white;">
                    </td>
                    <td style="padding: 0px 15px;">categoria:</td>
                    <td>
                    <select name="seleccion" style="background: #212529;padding:10px;color: white;">
                        <%
                            Modelo_Oferta ofertasModel1 = new Modelo_Oferta();
                            List<Categoria> listaCategorias = ofertasModel1.obtenerCategorias();
                            Iterator<Categoria> it1 = listaCategorias.iterator();
                            Categoria ca = null;

                            while(it1.hasNext()){
                                ca = it1.next();
                        %>
                            <option value="<%= ca.getCategoria()%>"><!--<%= ca.getCategoria()%> ---> <%= ca.getNombre()%></option>
                        <%
                            }
                        %>
                    </select>
                    </td>
                    <td style="padding: 0px 15px;">puesto:</td>
                    <td>
                    <select name="seleccion1" style="background: #212529;padding:10px;color: white;">
                        <%
                            Modelo_Oferta ofertasModel2 = new Modelo_Oferta();
                            List<Puesto> listaPuestos = ofertasModel2.obtenerPuestos();
                            Iterator<Puesto> it2 = listaPuestos.iterator();
                            Puesto pu = null;

                            while(it2.hasNext()){
                                pu = it2.next();
                        %>
                            <option value="<%= pu.getPuesto()%>"><!--<%= pu.getPuesto()%> ---> <%= pu.getNombre()%></option>
                        <%
                            }
                        %>
                    </select>
                    </td>
                </tr>
            </table>
        </form>
        <br>
        <br>
        <table class="table">
            <thead class="thead-dark">
                <tr>
                  <th scope="col">ID</th>
                  <th scope="col">Título</th>
                  <th scope="col">Descripción</th>
                  <th scope="col">No. Plazas</th>
                  <th scope="col">Nivel Experiencia</th>
                  <th scope="col">Salario</th>
                  <th scope="col">Vehiculo</th>
                </tr>
              </thead>
        <%
            /*
                tosh - Obtenemos una lista del modelo "Oferta",
                       e iteramos sobre la lista
            */
            Modelo_Oferta ofertasModel = new Modelo_Oferta();
            List<Oferta> listaOfertas;            
            if(dis!=null){
                if(dis.equals("1")){
                    String id=request.getParameter("seleccion");
                    listaOfertas = ofertasModel.obtenerOfertasCategorias(id);//pasar el id
                }else if(dis.equals("2")){
                    String id=request.getParameter("seleccion1");
                    listaOfertas = ofertasModel.obtenerOfertasPuesto(id);//pasar el id
                }else{
                    String id=request.getParameter("seleccion1");
                    listaOfertas = ofertasModel.obtenerOfertasPuesto(id);//pasar el id
                }
            }else{
                listaOfertas = ofertasModel.obtenerOfertas();
            }                        
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
    </tr>    
        <%
            }
        %>
        </table>
    </body>
</html>
