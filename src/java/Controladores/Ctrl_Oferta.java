package Controladores;

import Classes.Oferta;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelos.Modelo_Oferta;
import Modelos.Modelo_Postulacion;
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

            RequestDispatcher rd = null;

            Modelo_Oferta ofertaModel = new Modelo_Oferta();

            int resultado = 0;
            /*  tosh - Verifica si CRUD se ejecuto correctamente: 0 = error */

 /*  atributos de oferta */
            String titulo;
            String descripcion;
            String numeroPlazas;
            String nivelExperiencia;
            String salario;
            String vehiculo;
            String categoria;
            String puesto;

            /*  obtenemos Correo/Usuario actual */
            String usuario = (String) request.getSession().getAttribute("usuario");

            if (request.getParameter("btn_crear") != null) {

                /*  obtenemos valores de atributos de oferta    */
                titulo = request.getParameter("txt_titulo");
                descripcion = request.getParameter("txt_descripcion");
                numeroPlazas = request.getParameter("txt_numeroPlazas");
                nivelExperiencia = request.getParameter("txt_nivelExperiencia");
                salario = request.getParameter("txt_salario");
                vehiculo = request.getParameter("txt_vehiculo");
                categoria = request.getParameter("categoria_seleccionada");
                puesto = request.getParameter("puesto_seleccionado");

                /*  Creamos la oferta **verificar si es correcta o no   */
                resultado = ofertaModel.crearOferta(usuario, titulo, descripcion, numeroPlazas,
                        nivelExperiencia, salario, vehiculo, categoria, puesto);

                System.out.println(request.getParameter("categoria_seleccionada"));
                System.out.println(request.getParameter("puesto_seleccionado"));

                rd = request.getRequestDispatcher("oferta.jsp");

            } else if (request.getParameter("btn_seleccionar") != null) {
                String ofertaseleccionada = request.getParameter("lst_oferta_seleccionada");
                rd = request.getRequestDispatcher("oferta.jsp?idOferta=" + ofertaseleccionada);
            } else if (request.getParameter("btn_actualizar") != null) {
                titulo = request.getParameter("txt_titulo");
                descripcion = request.getParameter("txt_descripcion");
                numeroPlazas = request.getParameter("txt_numeroPlazas");
                nivelExperiencia = request.getParameter("txt_nivelExperiencia");
                salario = request.getParameter("txt_salario");
                vehiculo = request.getParameter("txt_vehiculo");
                categoria = request.getParameter("txt_categoria");
                puesto = request.getParameter("txt_puesto");

                String idOferta = request.getParameter("txt_id");

                /*  Creamos la oferta **verificar si es correcta o no   */
                resultado = ofertaModel.actualizarOferta(idOferta, titulo, descripcion, numeroPlazas,
                        nivelExperiencia, salario, vehiculo, categoria, puesto);
                System.out.println("Hola mundo");
                if (resultado == 1) {
                    request.setAttribute("mensaje", "Oferta Actualizada");
                } else {
                    request.setAttribute("mensaje", "Ocurrio un error, la oferta no se actualizo");
                }
                rd = request.getRequestDispatcher("oferta.jsp");
            } else if (request.getParameter("btn_eliminar") != null) {
                String idOferta = request.getParameter("txt_id");
                resultado = ofertaModel.eliminarOferta(idOferta);
                rd = request.getRequestDispatcher("general.jsp");
            } else if (request.getParameter("btn_publicar") != null) {
                String idOferta = request.getParameter("txt_id");
                resultado = ofertaModel.publicarOferta(idOferta);
                rd = request.getRequestDispatcher("general.jsp");
            } else if (request.getParameter("btn_editar") != null) {
                String idOferta = request.getParameter("txt_idOferta");
                titulo = request.getParameter("txt_titulo");
                descripcion = request.getParameter("txt_descripcion");
                numeroPlazas = request.getParameter("txt_numeroPlazas");
                nivelExperiencia = request.getParameter("txt_nivelExperiencia");
                salario = request.getParameter("txt_salario");
                vehiculo = request.getParameter("txt_vehiculo");
                categoria = request.getParameter("txt_categoria");
                puesto = request.getParameter("txt_puesto");
                resultado = ofertaModel.actualizarOferta(idOferta, titulo, descripcion, numeroPlazas, nivelExperiencia, salario, vehiculo, categoria, puesto);
                rd = request.getRequestDispatcher("verOferta.jsp");
            } else if (request.getParameter("btn_postularse") != null) {
                String idOferta = request.getParameter("btn_postularse");
                int estado = ofertaModel.postularse(usuario, idOferta);
                if (estado == 0) {
                    request.setAttribute("error", "Solamente te puedes postular una vez en una oferta");
                }
                rd = request.getRequestDispatcher("general.jsp");
            } else if (request.getParameter("btn_aceptar") != null) {
                String idPostulante = request.getParameter("idPostulante");
                String idUsuario = request.getParameter("idUsuario");
                String idOferta = request.getParameter("idOferta");
                Modelo_Postulacion modeloPost = new Modelo_Postulacion();
                modeloPost.aceptarPostulante(idPostulante, idUsuario, idOferta);
                rd = request.getRequestDispatcher("verOferta.jsp?idOferta=" + idOferta);
            } else if (request.getParameter("btn_rechazar") != null) {
                String idPostulante = request.getParameter("idPostulante");
                String idUsuario = request.getParameter("idUsuario");
                String idOferta = request.getParameter("idOferta");
                Modelo_Postulacion modeloPost = new Modelo_Postulacion();
                modeloPost.rechazarPostulante(idPostulante, idUsuario, idOferta);
                rd = request.getRequestDispatcher("verOferta.jsp?idOferta=" + idOferta);
            } else {
                rd = request.getRequestDispatcher("general.jsp");
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
