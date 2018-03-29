/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Classes.Oferta;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelos.Modelo_Oferta;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author tosh
 */
public class Ctrl_Oferta extends HttpServlet {

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
            Modelo_Oferta ofertaModel = new Modelo_Oferta();
            RequestDispatcher rd = null;
            int resultado = 0;
            
            String titulo;
            String descripcion;
            String numeroPlazas;
            String nivelExperiencia;
            String salario;
            String vehiculo;
            
            if(request.getParameter("btn_crear") != null){
                titulo              = request.getParameter("txt_titulo");
                descripcion         = request.getParameter("txt_descripcion");
                numeroPlazas        = request.getParameter("txt_numeroPlazas");
                nivelExperiencia    = request.getParameter("txt_nivelExperiencia");
                salario             = request.getParameter("txt_salario");
                vehiculo            = request.getParameter("txt_vehiculo");
                
                
                resultado = ofertaModel.crearOferta(titulo, descripcion, numeroPlazas, nivelExperiencia, salario, vehiculo);
                
                rd = request.getRequestDispatcher("oferta.jsp");
            }
            
            rd.forward(request, response);
  
            
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
