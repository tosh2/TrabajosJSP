/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

/**
 *
 * @author Jose
 */
public class Postulacion {

    private String fecha;
    private String estado;
    private String usuarioOferta;
    private String usuarioPostulante;
    private String oferta;

    public Postulacion(String estado, String usuarioPostulante, String usuarioOferta, String oferta) {
        this.estado = estado;
        this.usuarioPostulante = usuarioPostulante;
        this.usuarioOferta = usuarioOferta;
        this.oferta = oferta;
    }

    /**
     * @return the fecha
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * @return the usuarioOferta
     */
    public String getUsuarioOferta() {
        return usuarioOferta;
    }

    /**
     * @param usuarioOferta the usuarioOferta to set
     */
    public void setUsuarioOferta(String usuarioOferta) {
        this.usuarioOferta = usuarioOferta;
    }

    /**
     * @return the usuarioPostulante
     */
    public String getUsuarioPostulante() {
        return usuarioPostulante;
    }

    /**
     * @param usuarioPostulante the usuarioPostulante to set
     */
    public void setUsuarioPostulante(String usuarioPostulante) {
        this.usuarioPostulante = usuarioPostulante;
    }

    /**
     * @return the oferta
     */
    public String getOferta() {
        return oferta;
    }

    /**
     * @param oferta the oferta to set
     */
    public void setOferta(String oferta) {
        this.oferta = oferta;
    }

}
