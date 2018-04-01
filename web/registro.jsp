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
    }else if(request.getAttribute("error")!=null){
            sesion.setAttribute("error", request.getAttribute("error"));
            response.sendRedirect("registro.jsp");
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
            <div><%= sesion.getAttribute("error")%></div>
        </div>
        <h1>Crear Cuenta</h1>
        <!--    tosh
                Ctrl_Registro = controlador
        -->
        <form name="form1" action="Ctrl_Registro" enctype="MULTIPART/FORM-DATA" method="POST"> 
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
            <input type="text" name="txt_edad" onkeypress="return soloNumeros(event)">
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
            <input type="file" name="file" />
            <br>
            <br>
            <div>
                <input type="text" name="txt_politica" value="acepto las politicas de privacidad" readonly="readonly" style="
                    width: 210px;
                    border:  none;
                ">
            </div>
            <div>
                <input type="radio" name="politica" value="1" checked>si
                <input type="radio" name="politica" value="2" >no
            </div>
            <a href="javascript:void(0);" onclick="window.open('http://localhost:8083/TrabajosJSP/login.jsp',  'popup', 'top=100, left=200, width=853, height=480, toolbar=NO, resizable=NO, Location=NO, Menubar=NO,  Titlebar=No, Status=NO')" rel="nofollow">politicas de privacidad</a>
            <br>
            <br>
            <input type="submit" name="btn_registrar" value="Registrar" onClick="return campoVacio()">
            <br>
        </form>               
        <!--<form action="subefichero.jsp" enctype="multipart/form-data" method="post"> 
        Fichero: <input type="file" name="fichero"/></br> 
        <input type="submit" value="Subir fichero"/> 
        </form> -->
        
        <script>
            function soloNumeros(e){
                key = e.keyCode || e.which;
                tecla = String.fromCharCode(key).toLowerCase();
                numeros ="0123456789";
                especiales = [8,37,39,46];
                tecla_especial = false;
                for(var i in especiales){
                        if(key==especiales[i]){
                                tecla_especial = true;
                                break;
                        }
                }
                if(numeros.indexOf(tecla) == -1 && !tecla_especial){
                        return false;
                }
            }
            function campoVacio(){
                var nombre=document.form1.txt_nombre.value;
                var apellido=document.form1.txt_apellido.value;
                var edad=document.form1.txt_edad.value;
                var correo=document.form1.txt_correo.value;
                var password=document.form1.txt_password.value;
                var password2=document.form1.txt_password_conf.value;
                var correcto=true;
                if(nombre==""||apellido==""||edad==""||correo==""||password==""||password2==""){
                        alert('falta llenar campos');
                        correcto=false;
                }else{
                    if(password!=password2){
                        alert('las contrase;as no coinciden');
                        correcto=false;
                    }
                }
                return correcto;
            }
        </script>
    </body>
</html>
