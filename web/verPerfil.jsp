<%-- 
    Document   : verPerfil
    Created on : 03-abr-2018, 23:45:37
    Author     : tosh
--%>
<%
    //si el usuario no ha iniciado 
    HttpSession sesionLogin = request.getSession();
    if (sesionLogin.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
