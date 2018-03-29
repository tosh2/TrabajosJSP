<%-- 
    Document   : registro
    Created on : 27-mar-2018, 20:36:47
    Author     : tosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    /*
        Utilizado con: Ctrl_Registro
        "nivel", y "nombre", son atributos enviados desde: Ctrl_Registro
    */
    HttpSession sesion = request.getSession();
    int tipo = 0;   /*  1 = Ofertador ; 2 = Ofertante   */
    if(request.getAttribute("tipo")!=null){
        tipo = (Integer)request.getAttribute("tipo");
        System.out.println("hola");
//        if(tipo == 1){
            sesion.setAttribute("usuario", request.getAttribute("usuario"));
            sesion.setAttribute("tipo", tipo);
            response.sendRedirect("general.jsp");
//        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">Regresar</a>
            |
            <a href="login.jsp">Log-In</a>
            <hr>
        </div>
        <h1>Crear Cuenta</h1>
        <!--    tosh
                Ctrl_Registro = controlador
        -->
        <form action="Ctrl_Registro" method="POST"> 
            Nombre: <br>
            <input type="text" name="txt_nombre" >
            <br>
            Apellido: 
            <br>
            <input type="text" name="txt_apellido" >
            <br>
            Correo:<br>
            <input type="text" name="txt_correo">
            <br>
            Edad:<br>
            <input type="text" name="txt_edad">
            <br>
            Contraseña :<br>
            <input type="password" name="txt_password">
            <br>
            Confirmar Contraseña :<br>
            <input type="password" name="txt_password_conf">
            <br>
            
            Sexo:<br>
            <input type="radio" name="sexo" value="1" checked>Hombre
            <input type="radio" name="sexo" value="0">Mujer
            <br>
            
            Tipo:<br>
            <input type="radio" name="tipo" value="1" checked>Empleador
            <input type="radio" name="tipo" value="2" >Empleado
            <br>
            <br>
            <input type="submit" name="btn_registrar" value="Registrar">
            <br>
        </form>
        
        
    </body>
</html>
