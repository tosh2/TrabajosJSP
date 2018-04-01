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
public class Puesto {
    private String puesto;

    public String getPuesto() {
        return puesto;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }
    private String nombre;
    private String descripcion;
    
    public Puesto(String puesto, String nombre, String descripcion){
        this.puesto             =   puesto;
        this.nombre             =   nombre;
        this.descripcion        =   descripcion;
    }

}