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

    private String oferta;
    private String titulo;
    private String descripcion;
    private String numeroPlazas;
    private String nivelExperiencia;
    private String salario;
    private String vehiculo;

    private String categoria;
    private String puesto;
    private String estado;

    public Oferta(String oferta, String titulo, String descripcion,
            String numeroPlazas, String nivelExperiencia, String salario, String vehiculo) {
        this.oferta = oferta;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.numeroPlazas = numeroPlazas;
        this.nivelExperiencia = nivelExperiencia;
        this.salario = salario;
        this.vehiculo = vehiculo;
    }

    /**
     * @return the oferta
     */
    public String getOferta() {
        return oferta;
    }

    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @return the numeroPlazas
     */
    public String getNumeroPlazas() {
        return numeroPlazas;
    }

    /**
     * @return the nivelExperiencia
     */
    public String getNivelExperiencia() {
        return nivelExperiencia;
    }

    /**
     * @return the salario
     */
    public String getSalario() {
        return salario;
    }

    /**
     * @param salario the salario to set
     */
    public void setSalario(String salario) {
        this.salario = salario;
    }

    /**
     * @return the vehiculo
     */
    public String getVehiculo() {
        return vehiculo;
    }

    /**
     * @return the categoria
     */
    public String getCategoria() {
        return categoria;
    }

    /**
     * @param categoria the categoria to set
     */
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    /**
     * @return the puesto
     */
    public String getPuesto() {
        return puesto;
    }

    /**
     * @param puesto the puesto to set
     */
    public void setPuesto(String puesto) {
        this.puesto = puesto;
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
}
