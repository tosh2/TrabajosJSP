/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelos.Modelo_Ingreso;  //  Importamos modelo de acceso (Login)
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tosh
 */
public class Ctrl_Login extends HttpServlet {

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

            /*
            txt_usuario, y txt_password, son parametros enviados desde: index.jsp
            "usuario", y "tipo" nombres de variables
            setAttribute es JSP para sesion "nombre"
            
             */
            String usuario;
            String password;

            int tipo = 0;
            /*  1 = Ofertador ; 2 = Ofertante   */

            Modelo_Ingreso log = new Modelo_Ingreso();
            RequestDispatcher rd = null;

            if (request.getParameter("btn_ingresar") != null) {
                usuario = request.getParameter("txt_usuario");
                password = request.getParameter("txt_password");
                //nivel = acc.validar(nombre, contra);
                tipo = log.validarAcceso(usuario, password);
                HttpSession sesion = request.getSession();
                if (tipo == 0) {
                    //datos incorrectos
                    request.setAttribute("error", "Correo/contraseña invalida");
                    rd = request.getRequestDispatcher("login.jsp");
                } else if (tipo > 0) {
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("tipo", tipo);

                    rd = request.getRequestDispatcher("general.jsp");
                }

            } else if (request.getParameter("btn_cerrar") != null) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", null);
                sesion.setAttribute("tipo", null);
                rd = request.getRequestDispatcher("login.jsp");
            } else {
                rd = request.getRequestDispatcher("general.jsp");
            }

            rd.forward(request, response);  //direccionamos al index.jsp

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
