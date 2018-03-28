<%-- 
    Document   : index
    Created on : 26-mar-2018, 18:45:56
    Author     : tosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div>
            <h1>Hola Mundo</h1>
            <!-- 
                Ctrl_Login = nombre del Servlet/Controlador
                txt_usuario, txt_password se envian como parametros al servlet
                btn_ingresar realiza la accion, y se compara en servlet
            -->
            <form action="Ctrl_Login" method="POST"> 
                <input type="text" name="txt_usuario" placeholder="Usuario"><br>
                <input type="password" name="txt_password" placeholder="Contraseña"><br>
                <input type="submit" name="btn_ingresar" value="Iniciar Sesion"><br>
            </form> 
    
            
            
        </div>
        <%
            /*
                Utilizado con: Ctrl_Login
            "nivel", y "nombre", son atributos enviados desde: Ctrl_Login
            */
            HttpSession sesion = request.getSession();
            int tipo = 0;   /*  1 = Ofertador ; 2 = Ofertante   */
            if(request.getAttribute("tipo")!=null){
                tipo = (Integer)request.getAttribute("tipo");
                if(tipo == 1){
                    sesion.setAttribute("usuario", request.getAttribute("usuario"));
                    sesion.setAttribute("tipo", tipo);
                    response.sendRedirect("Admin/admin.jsp");
                }
            }
            if(request.getParameter("cerrar")!=null){
                session.invalidate();
            }
        %>
        
    </body>
</html>
