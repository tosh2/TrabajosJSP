<%-- 
    Document   : registro
    Created on : 27-mar-2018, 20:36:47
    Author     : tosh
--%>

<%@page contentType="text/html;charset=ISO-8859-1" pageEncoding="UTF-8"%>
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
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    </head>
    <body>
    <div class="jumbotron" style="padding-top: 45px">
        <div align="right" style="padding-right: 20px;">
            <a href="index.jsp" style="padding:10px;border-radius:5px;background: #337ab7;color:white;">Inicio</a>
            <a href="login.jsp" style="padding:10px 20px;border-radius:5px;background: #337ab7;color:white;">Log-In</a>
            <hr>
        </div>
    </div>
    <div class="container">
        <div class="signup-form-container">
            <form name="form1" autocomplete="off" action="Ctrl_Registro" enctype="MULTIPART/FORM-DATA" method="POST"> 
            <div class="form-header">
                <h3 class="form-title"><i class="fa fa-user"></i> Registrarme</h3>
            <div class="pull-right">
                <h3 class="form-title"><span class="glyphicon glyphicon-pencil"></span></h3>
            </div>
            </div>
            <div class="form-body">                      
                <div class="form-group">
                   <div class="input-group">
                   <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                   <input name="txt_nombre" type="text" class="form-control" placeholder="Nombre">
                   </div>
                   <span class="help-block" id="error"></span>
                </div>
                <div class="form-group">
                   <div class="input-group">
                   <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                   <input name="txt_apellido" type="text" class="form-control" placeholder="Apellido">
                   </div>
                   <span class="help-block" id="error"></span>
                </div>
                <div class="form-group">
                   <div class="input-group">
                   <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                   <input name="txt_edad" type="text" class="form-control" placeholder="Edad" onkeypress="return soloNumeros(event)">
                   </div>
                   <span class="help-block" id="error"></span>
                </div>
                <div class="form-group">
                    <fieldset class="form-group">
                        <div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="sexo" value="1" checked>
                            Hombre
                          </label>
                        </div>
                        <div class="form-check">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="sexo" value="0">
                            Mujer
                          </label>
                        </div>
                    </fieldset>
                </div>
                <div class="form-group">
                    <fieldset class="form-group">
                        <div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="tipo" value="1" checked>
                            Empleador
                          </label>
                        </div>
                        <div class="form-check">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="tipo" value="2">
                            Empleado
                          </label>
                        </div>
                    </fieldset>
                </div>
                <div class="form-group">
                   <div class="input-group">
                   <div class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></div>
                   <input name="txt_correo" type="text" class="form-control" placeholder="Correo">
                   </div> 
                   <span class="help-block" id="error"></span>                     
                </div>
            </div>                                
                <div class="row">
                        
                   <div class="form-group col-lg-6">
                        <div class="input-group">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                        <input name="txt_password" id="password" type="password" class="form-control" placeholder="Contraseña">
                        </div>  
                        <span class="help-block" id="error"></span>                    
                   </div>
                            
                   <div class="form-group col-lg-6">
                        <div class="input-group">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                        <input name="txt_password_conf" type="password" class="form-control" placeholder="Confirmar Contraseña">
                        </div>  
                        <span class="help-block" id="error"></span>                    
                   </div>
                            
             </div>
            <input type="file" name="photo" />
            <br>
            <br>
            <div>
                <input type="text" name="txt_politica" value="acepto las politicas de privacidad" readonly="readonly" style="
                    width: 240px;
                    border:  none;
                ">
            </div>
            <div class="form-group">
            <fieldset class="form-group">
                <div class="form-check">
                  <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="politica" value="1" checked>
                    Si
                  </label>
                </div>
                <div class="form-check">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="politica" value="2">
                    No
                  </label>
                </div>
            </fieldset>
            </div>
            </div>
            <a href="javascript:void(0);" onclick="window.open('http://localhost:8083/TrabajosJSP/login.jsp',  'popup', 'top=100, left=200, width=853, height=480, toolbar=NO, resizable=NO, Location=NO, Menubar=NO,  Titlebar=No, Status=NO')" rel="nofollow">politicas de privacidad</a>
            <br>
            <br>
            <div class="form-footer">
                <button type="submit" style="padding:5px 15px;border-radius:5px;background: #337ab7;color:white;" name="btn_registrar" onClick="return campoVacio()">
                 <span class="glyphicon glyphicon-log-in"></span> Registrar
                 </button>
            </div>
        </form>
        </div>
    </div>
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
