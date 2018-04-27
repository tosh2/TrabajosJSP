<%-- 
    Document   : blog
    Created on : 8/04/2018, 03:26:59 PM
    Author     : Jose
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    //si el usuario no ha iniciado 
    HttpSession sesionLogin = request.getSession();
    if (sesionLogin.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blogs</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head> 

    <body>

        <%@ include file="navBar.jsp" %>
        <div class="contenedor col-md-12" >
            <section class="content" >
                <h2 style="text-align: center">Blog's</h2>
                <div class="box box-default">
                    <form action="" method="POST">
                        <table>
                            <tr>
                                <td>Categoria</td>

                                <td style="padding: 0px 15px;">
                                    <select name="cbodis" id="cbodis" >
                                        <option value="1">categoria</option>
                                        <option value="2">puesto</option>
                                        <!--<option value="3">mercado</option>-->
                                    </select>
                                </td>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </section>

            <div class="form-control">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    Crear Blog
                </button>  
            </div>


            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>                                   
                        <th scope="col">ID</th>
                        <th scope="col">Título</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Opciones</th>
                    </tr>
                </thead>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <form method="POST" action="Ctrl_Oferta" class="text-center" >
                            <a href="verOferta.jsp?idOferta=" class="btn btn-primary">Ver Blog</a>
                            <a href="editarOferta.jsp?idOferta=" class="btn btn-warning">Editar</a>
                            <input type="hidden" value="" name="txt_id" >
                            <input type="submit" name="btn_eliminar" class="btn btn-danger" value="Eliminar">  

                        </form>
                    </td>
                </tr>
            </table>

        </div>




        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
