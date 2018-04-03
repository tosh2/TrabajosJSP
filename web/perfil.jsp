<%-- 
    Document   : Perfil
    Created on : 28-mar-2018, 23:59:44
    Author     : tosh
--%>

<%@page import="Classes.Usuario"%>
<%@page import="Modelos.Modelo_Usuario"%>
<%@page import ="java.io.*" %>
<%@page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi Perfil</title>
    </head>
    <body>
        
        <div align="right">
            Bienvenido <%= sesion.getAttribute("usuario")%>
            |
            <a href="general.jsp">Inicio</a>
            |
            <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            <hr>
        </div>
        
        
        <h1>Mi Perfil</h1>
        <%
            Modelo_Usuario usuarioModel  =   new Modelo_Usuario();
            Usuario infoUsuario =   usuarioModel.obtenerInformacionUsuario((String)sesion.getAttribute("usuario"));
        %>
        
        <form action="Ctrl_Perfil" method="POST"> 
            Nombre: <br>
            <input type="text" name="txt_nombre" value="<%= infoUsuario.getNombre() %>">
            <br>
            Apellido: 
            <br>
            <input type="text" name="txt_apellido" value="<%= infoUsuario.getApellido() %>">
            <br>
            Correo:<br>
            <input type="text" name="txt_correo" value="<%= infoUsuario.getCorreo() %>" readonly="true">
            <br>
            Edad:<br>
            <input type="text" name="txt_edad" value="<%= infoUsuario.getEdad() %>">
            <br>
            Contraseña :<br>
            <input type="password" name="txt_password">
            <br>
            Confirmar Contraseña :<br>
            <input type="password" name="txt_password_conf">
            <br>
            <br>
            Sexo:<br>
            <%
                if(infoUsuario.getSexo().equals("1")){
            %>
                    <input type="radio" name="sexo" value="1" checked>Hombre
                    <input type="radio" name="sexo" value="0" >Mujer
                    <br>
            <%
                }else{
            %>
                    <input type="radio" name="sexo" value="1">Hombre
                    <input type="radio" name="sexo" value="0" checked>Mujer
                    <br>
            <%
                }
            %>
            
            
            Tipo:<br>
            <%
                if(infoUsuario.getSexo().equals("1")){
            %>
                    <input type="radio" name="tipo" value="1" checked>Empleador
                    <input type="radio" name="tipo" value="2" >Empleado
                    <br>
            <%
                }else{
            %>
                    <input type="radio" name="tipo" value="1" >Empleador
                    <input type="radio" name="tipo" value="2" checked>Empleado
                    <br>
            <%
                }
            %>            
            <br>
            <input type="submit" name="btn_guardar" value="Guardar">
            <br>
        </form>
<%
 /*Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/analisis","root", "");
Statement st = con.createStatement();

ResultSet i = st.executeQuery("SELECT foto FROM usuario WHERE usuario.correo='"+(String)sesion.getAttribute("usuario")+"';");*/
%>
<img src="${pageContext.request.contextPath}/images/<%=sesion.getAttribute("usuario")%>" style="width:200px;height:200px;">
 <%
/*OutputStream img;
 while(i.next( )){
     byte barray[] = i.getBytes(1);
     response.setContentType("image/png");
     img  =   response.getOutputStream();
     img.write(barray);
     img.flush();
     img.close();
 }*/
   %>
        
    </body>
    
</html>
