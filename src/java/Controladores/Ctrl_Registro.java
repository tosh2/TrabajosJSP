/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Classes.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelos.Modelo_Usuario;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author tosh
 */
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)
public class Ctrl_Registro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            Modelo_Usuario regModel = new Modelo_Usuario();

            RequestDispatcher rd = null;
            int resultado = 0;
            String nombre;
            String apellido;
            String correo;
            String password;
            String password_conf;
            String edad;
            String sexo;
            String tipo_usuario;
            String politica;
            InputStream inputStream = null; // input stream of the upload file

            if (request.getParameter("btn_registrar") != null) {
                nombre = request.getParameter("txt_nombre");
                apellido = request.getParameter("txt_apellido");
                correo = request.getParameter("txt_correo");
                password = request.getParameter("txt_password");
                password_conf = request.getParameter("txt_password_conf");
                edad = request.getParameter("txt_edad");
                sexo = request.getParameter("sexo");
                tipo_usuario = request.getParameter("tipo");
                politica = request.getParameter("politica");

                Part filePart = request.getPart("photo");
                if (filePart != null) {
                    // prints out some information for debugging
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    // obtains input stream of the upload file
                    inputStream = filePart.getInputStream();
                }

                //ps = conn.prepareStatement(sqlQuery);
                //ps.setBinaryStream(1, fis, (int) file.length());
                out.println(nombre);
                out.println(apellido);
                out.println(correo);
                out.println(password);
                out.println(password_conf);
                out.println(edad);
                out.println(sexo);
                out.println(tipo_usuario);
                if (politica.equals("2")) {
                    request.setAttribute("error", "No ha aceptado las politicas de privacidad");
                    rd = request.getRequestDispatcher("registro.jsp");
                } else if (!regModel.existeCorreo(correo)) {//valida si el correo que se esta registrando, ya existe en la base de datos

                    if (inputStream != null) {

                        System.out.println("hola aqui !!!");
                        resultado = regModel.registrarUsuario(nombre, apellido, correo, password, edad, sexo, tipo_usuario, inputStream);
                        request.setAttribute("usuario", correo);
                        request.setAttribute("tipo", Integer.parseInt(tipo_usuario));
                        if (resultado == 0) {
                            request.setAttribute("error", "Ha ocurrido un error, usuario no registrado");
                            rd = request.getRequestDispatcher("registro.jsp");
                        } else {
                            HttpSession sesion = request.getSession();
                            sesion.setAttribute("usuario", correo);
                            sesion.setAttribute("tipo", Integer.parseInt(tipo_usuario));
                            rd = request.getRequestDispatcher("general.jsp");
                        }
                    }

                } else {
                    //si ya existe, entonces no lo guarda
                    System.out.println("hola aqui !!!");
                    request.setAttribute("error", "error, el correo ya existe");
                    rd = request.getRequestDispatcher("registro.jsp");
                }
            } else {
                rd = request.getRequestDispatcher("general.jsp");
            }
            rd.forward(request, response);

            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Ctrl_Registro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ctrl_Registro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            Modelo_Usuario regModel = new Modelo_Usuario();

            RequestDispatcher rd = null;
            int resultado = 0;
            String nombre;
            String apellido;
            String correo;
            String password;
            String password_conf;
            String edad;
            String sexo;
            String tipo_usuario;
            String politica;
            InputStream inputStream = null; // input stream of the upload file

            if (request.getParameter("btn_registrar") != null) {
                nombre = request.getParameter("txt_nombre");
                apellido = request.getParameter("txt_apellido");
                correo = request.getParameter("txt_correo");
                password = request.getParameter("txt_password");
                password_conf = request.getParameter("txt_password_conf");
                edad = request.getParameter("txt_edad");
                sexo = request.getParameter("sexo");
                tipo_usuario = request.getParameter("tipo");
                politica = request.getParameter("politica");

                Part filePart = request.getPart("photo");
                if (filePart != null) {
                    // prints out some information for debugging
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    // obtains input stream of the upload file
                    inputStream = filePart.getInputStream();
                }

                //ps = conn.prepareStatement(sqlQuery);
                //ps.setBinaryStream(1, fis, (int) file.length());
                out.println(nombre);
                out.println(apellido);
                out.println(correo);
                out.println(password);
                out.println(password_conf);
                out.println(edad);
                out.println(sexo);
                out.println(tipo_usuario);
                if (politica.equals("2")) {
                    request.setAttribute("error", "No ha aceptado las politicas de privacidad");
                    rd = request.getRequestDispatcher("registro.jsp");
                } else if (!regModel.existeCorreo(correo)) {//valida si el correo que se esta registrando, ya existe en la base de datos

                    if (inputStream != null) {

                        System.out.println("hola aqui !!!");
                        resultado = regModel.registrarUsuario(nombre, apellido, correo, password, edad, sexo, tipo_usuario, inputStream);
                        request.setAttribute("usuario", correo);
                        request.setAttribute("tipo", Integer.parseInt(tipo_usuario));
                        rd = request.getRequestDispatcher("registro.jsp");
                    }

                } else {
                    //si ya existe, entonces no lo guarda
                    System.out.println("hola aqui !!!");
                    request.setAttribute("error", "error,Ya existe un usuario con el mismo correo");
                    rd = request.getRequestDispatcher("registro.jsp");
                }
            }
            rd.forward(request, response);

            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Ctrl_Registro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ctrl_Registro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
 /*
            Modelo_Usuario regModel = new Modelo_Usuario();

            RequestDispatcher rd = null;
            int resultado = 0;
            String nombre;
            String apellido;
            String correo;
            String password;
            String password_conf;
            String edad;
            String sexo;
            String tipo_usuario;
            String politica;
            InputStream inputStream = null; // input stream of the upload file

            if (request.getParameter("btn_registrar") != null) {
                nombre = request.getParameter("txt_nombre");
                apellido = request.getParameter("txt_apellido");
                correo = request.getParameter("txt_correo");
                password = request.getParameter("txt_password");
                password_conf = request.getParameter("txt_password_conf");
                edad = request.getParameter("txt_edad");
                sexo = request.getParameter("sexo");
                tipo_usuario = request.getParameter("tipo");
                politica = request.getParameter("politica");

                Part filePart = request.getPart("photo");
                if (filePart != null) {
                    // prints out some information for debugging
                    System.out.println(filePart.getName());
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    // obtains input stream of the upload file
                    inputStream = filePart.getInputStream();
                }

                //ps = conn.prepareStatement(sqlQuery);
                //ps.setBinaryStream(1, fis, (int) file.length());
                out.println(nombre);
                out.println(apellido);
                out.println(correo);
                out.println(password);
                out.println(password_conf);
                out.println(edad);
                out.println(sexo);
                out.println(tipo_usuario);
                if (politica.equals("2")) {
                    request.setAttribute("error","No ha aceptado las politicas de privacidad");
                   rd = request.getRequestDispatcher("registro.jsp");
                } else if (!regModel.existeCorreo(correo)) {//valida si el correo que se esta registrando, ya existe en la base de datos

                    if (inputStream != null) {

                        System.out.println("hola aqui !!!");
                        resultado = regModel.registrarUsuario(nombre, apellido, correo, password, edad, sexo, tipo_usuario, inputStream);
                        request.setAttribute("usuario", correo);
                        request.setAttribute("tipo", Integer.parseInt(tipo_usuario));
                        rd = request.getRequestDispatcher("registro.jsp");
                    }

                } else {
                    //si ya existe, entonces no lo guarda
                    System.out.println("hola aqui !!!");
                    request.setAttribute("error", "error, el correo ya existe");
                    rd = request.getRequestDispatcher("registro.jsp");
                }
            }
            rd.forward(request, response);

            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Ctrl_Registro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ctrl_Registro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
