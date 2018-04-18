<%-- 
    Document   : general
    Created on : 28-mar-2018, 0:02:01
    Author     : tosh
--%>

<%@page import="Classes.Puesto"%>
<%@page import="Classes.Categoria"%>
<%@page import="Modelos.Modelo_Oferta"%>
<%@page import="Modelos.Modelo_Usuario"%>
<%@page import="Classes.Oferta"%>
<%@page import="java.util.Iterator"%>
<%@page import="Classes.Usuario"%>
<%@page import="Classes.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="java.util.*" %>



<!DOCTYPE html>
<%
    String dis = null;
    if (request.getParameter("cbodis") != null) {
        dis = request.getParameter("cbodis");
    }
%>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ofertas</title>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>    

    <body>



        <%@ include file="navBar.jsp" %>  
        <div class="contenedor">
            <section class="content" >
                <h2 style="text-align: center">Todas las ofertas</h2>
                <div class="box box-default">
                    <form action="" method="POST">
                        <table width="50%" border="0">
                            <tr>
                                <td>Selección filtro</td>
                                <td style="padding: 0px 15px;">
                                    <select name="cbodis" id="cbodis" >
                                        <option value="1">categoria</option>
                                        <option value="2">puesto</option>
                                        <!--<option value="3">mercado</option>-->
                                    </select>
                                </td>
                                <td style="padding: 0px 15px;">
                                    <input type="submit" name="btn_seleccion" class="btn-primary" id="btn_seleccion" >
                                </td>
                                <td style="padding: 0px 15px;">categoria:</td>
                                <td>
                                    <select name="seleccion" >
                                        <%                                            Modelo_Oferta ofertasModel1 = new Modelo_Oferta();
                                            List<Categoria> listaCategorias = ofertasModel1.obtenerCategorias();
                                            Iterator<Categoria> it1 = listaCategorias.iterator();
                                            Categoria ca = null;

                                            while (it1.hasNext()) {
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
                                    <select name="seleccion1"  >
                                        <%
                                            Modelo_Oferta ofertasModel2 = new Modelo_Oferta();
                                            List<Puesto> listaPuestos = ofertasModel2.obtenerPuestos();
                                            Iterator<Puesto> it2 = listaPuestos.iterator();
                                            Puesto pu = null;

                                            while (it2.hasNext()) {
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
                </div>

                <div class="form-control">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                        Crear Oferta
                    </button>  
                </div>


                <table class="table table-bordered table-hover">
                    <thead class="thead-dark">
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
                        if (dis != null) {
                            if (dis.equals("1")) {
                                String id = request.getParameter("seleccion");
                                listaOfertas = ofertasModel.obtenerOfertasCategorias(id);//pasar el id

                            } else if (dis.equals("2")) {
                                String id = request.getParameter("seleccion1");
                                listaOfertas = ofertasModel.obtenerOfertasPuesto(id);//pasar el id

                            } else {
                                String id = request.getParameter("seleccion1");
                                listaOfertas = ofertasModel.obtenerOfertasPuesto(id);//pasar el id

                            }
                        } else {
                            listaOfertas = ofertasModel.obtenerOfertas();
                        }
                        Iterator<Oferta> it = listaOfertas.iterator();
                        Oferta of = null;
                        while (it.hasNext()) {
                    %>
                    <tr>
                        <%
                            of = it.next();
                        %>

                        <td>
                            <%= of.getOferta()%>

                        </td>

                        <td>

                            <%= of.getTitulo()%>

                        </td>

                        <td>

                            <%= of.getDescripcion()%>

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

                            <%

                                Boolean isOfertaUsuario = ofertasModel.isOfertaUsuario(of.getOferta(), (String) sesion.getAttribute("usuario"));
                            %>
                            <form method="POST" action="Ctrl_Oferta"  >
                                <%if (isOfertaUsuario) {%> 
                                <a href="verOferta.jsp?idOferta=<%=of.getOferta()%>" class="btn btn-primary">Ver</a>
                                <input type="hidden" value="<%=of.getOferta()%>" name="txt_id" >
                                <input type="submit" name="btn_eliminar" class="btn btn-danger" value="Eliminar">


                                <%
                               } else {%>


                                <a href="verOferta.jsp?idOferta=<%=of.getOferta()%>" class="btn btn-primary">Ver</a>
                                <button type="submit" value="<%=of.getOferta()%>" name="btn_postularse" class="btn btn-primary">Postularse</button>
                                <%
                                    }
                                %>

                            </form>





                        </td>

                    </tr>    

                    <%}%>

                </table>

                <!--MODAL PARA CREAR OFERTA-->
                <!-- Button trigger modal -->


                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Crear Oferta</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="Ctrl_Oferta" method="POST"> 
                                    Titulo: <br>
                                    <input class="form-control"  type="text" name="txt_titulo" >
                                    <br>
                                    Descripcion: 
                                    <br>
                                    <textarea class="form-control"  name="txt_descripcion" rows="3"></textarea>
                                    <br>
                                    Numero de Plazas:<br>
                                    <input type="text" class="form-control" name="txt_numeroPlazas">
                                    <br>
                                    Nivel de Experiencia:<br>
                                    <input type="text" class="form-control" name="txt_nivelExperiencia">
                                    <br>
                                    Salario :<br>
                                    <input type="text" class="form-control" name="txt_salario">
                                    <br>
                                    Vehiculo :<br>
                                    <input type="text" class="form-control" name="txt_vehiculo">
                                    <br>
                                    Categoria
                                    <select class="form-control" name="categoria_seleccionada">
                                        <%
                                            List<Categoria> s = ofertasModel.obtenerCategorias();
                                            Iterator<Categoria> categoriasIt = s.iterator();
                                            Categoria categoria = null;

                                            while (categoriasIt.hasNext()) {
                                                categoria = categoriasIt.next();
                                        %>
                                        <option value="<%= categoria.getCategoria()%>"><%= categoria.getCategoria()%>-<%= categoria.getNombre()%></option>
                                        <%
                                            }
                                        %>
                                    </select>

                                    Puesto
                                    <select class="form-control" name="puesto_seleccionado">
                                        <%
                                            List<Puesto> p = ofertasModel.obtenerPuestos();
                                            Iterator<Puesto> puestosIt = p.iterator();
                                            Puesto puesto = null;

                                            while (puestosIt.hasNext()) {
                                                puesto = puestosIt.next();
                                        %>
                                        <option value="<%= puesto.getPuesto()%>"><%= puesto.getPuesto()%>-<%= puesto.getNombre()%></option>
                                        <%
                                            }
                                        %>
                                    </select>

                                    <br>
                                    <div class="modal-footer">
                                        <input type="submit" name="btn_crear" class="btn btn-primary" value="Guardar">

                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>
                </div>


                <!-- MODAL EDITAR OFERTA -->
                <!-- Button trigger modal -->


                <!-- Modal -->
                <div class="modal fade" id="ModalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Editar Oferta</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                            </div>

                        </div>
                    </div>
                </div>
            </section>          
        </div> <!-- /container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script>
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })

            $('#ModalEditar').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })
        </script>
    </body>
</html>








