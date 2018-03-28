<%-- 
    Document   : index
    Created on : 26-mar-2018, 18:45:56
    Author     : tosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
    if(request.getParameter("cerrar")!=null){
        session.invalidate();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    <body>
        <div align="right">
            <a href="registro.jsp">Registrarse</a>
            |
            <a href="login.jsp">Log-In</a>
            <hr>
        </div>
        <div>
            <h1>Bienvenido</h1>
            
            
        </div>        
        
        <%           
            if(request.getAttribute("tipo") != null){
            %>
            hola mundo
        <%
            }
        %>
        
    </body>
</html>
