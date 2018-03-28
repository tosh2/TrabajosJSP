/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

/**
 *
 * @author tosh
 */
public class Oferta {
    private String oferta_empresa;
    private String oferta;
    private String usuario;
    private String titulo;
    private String descripcion;

    public Oferta(String oferta_empresa, String oferta, String usuario, String titulo, String descripcion){
        this.oferta_empresa =   oferta_empresa;
        this.oferta         =   oferta;
        this.usuario        =   usuario;
        this.titulo         =   titulo;
        this.descripcion    =   descripcion;
        
    }
    
    /**
     * @return the oferta_empresa
     */
    public String getOferta_empresa() {
        return oferta_empresa;
    }

    /**
     * @param oferta_empresa the oferta_empresa to set
     */
    public void setOferta_empresa(String oferta_empresa) {
        this.oferta_empresa = oferta_empresa;
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

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @param titulo the titulo to set
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
