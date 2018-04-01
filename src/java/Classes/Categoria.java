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
public class Categoria {
    private String categoria;

    public String getCategoria() {
        return categoria;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }
    private String nombre;
    private String descripcion;

    public Categoria(String categoria, String nombre, String descripcion){
        this.categoria             =   categoria;
        this.nombre             =   nombre;
        this.descripcion        =   descripcion;
    }
    
}