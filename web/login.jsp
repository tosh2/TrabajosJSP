<%-- 
    Document   : login
    Created on : 27-mar-2018, 23:42:16
    Author     : tosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
            /*
                tosh - 
                Utilizado con: Ctrl_Login
                "nivel", y "nombre", son atributos enviados desde: Ctrl_Login
            */
            HttpSession sesion = request.getSession();
            
            int tipo = 0;   /*  1 = Ofertador ; 2 = Ofertante   */
            if(request.getAttribute("tipo")!=null){
                tipo = (Integer)request.getAttribute("tipo");
               // if(tipo == 1){  //  ofertante
                    sesion.setAttribute("usuario", request.getAttribute("usuario"));
                    sesion.setAttribute("tipo", tipo);
                    response.sendRedirect("general.jsp");
                //}
            }
        %>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log-In</title>
    </head>
    <body>
        <div align="right">
            <a href="index.jsp">Regresar</a>
            |
            <a href="registro.jsp">Registrarse</a>
            <hr>
        </div>
        <h1>Inicia Sesion</h1>
        
        <!-- tosh
                Ctrl_Login = nombre del Servlet/Controlador
                txt_usuario, txt_password se envian como parametros al servlet
                btn_ingresar realiza la accion, y se compara en servlet
        -->
        <form action="Ctrl_Login" method="POST"> 
            Correo:<br>
            <input type="text" name="txt_usuario">
            <br>
            Contraseña:<br>
            <input type="password" name="txt_password">
            <br>
            <input type="submit" name="btn_ingresar" value="Iniciar Sesion">
            <br>
            
            ¿No tienes cuenta?<a href="registro.jsp">Registrarme</a>
        </form>
            
            
    </body>
</html>
