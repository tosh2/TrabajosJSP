<%-- 
    Document   : admin
    Created on : 26-mar-2018, 23:45:33
    Author     : tosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    HttpSession sesion = request.getSession();
    if(sesion.getAttribute("tipo") == null){
        response.sendRedirect("../index.jsp");
    }else{
        String nivel = sesion.getAttribute("tipo").toString();
        if(!nivel.equals("1")){
            response.sendRedirect("../index.jsp");
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="right">
            Bienvenido <%= sesion.getAttribute("usuario")%>
            |
            <a href="../index.jsp?cerrar=true">Cerrar Sesion</a>
            <hr>
        </div>
        <h1>Hello World! As sudo</h1>
    </body>
</html>
