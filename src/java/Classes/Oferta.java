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

    public Oferta(String oferta, String titulo, String descripcion,
                    String numeroPlazas, String nivelExperiencia, String salario, String vehiculo){
        this.oferta             =   oferta;
        this.titulo             =   titulo;
        this.descripcion        =   descripcion;
        this.numeroPlazas       =   numeroPlazas;
        this.nivelExperiencia   =   nivelExperiencia;
        this.salario            =   salario;
        this.vehiculo           =   vehiculo;
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
}