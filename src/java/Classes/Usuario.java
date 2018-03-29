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
public class Usuario {
    private String usuario;
    private String nombre;
    private String apellido;
    private String correo;
    private String password;
    private String edad;
    private String sexo;
    private String tipo;
    
    public Usuario(String usuario, String nombre, String apellido, String correo,
                    String password, String edad, String sexo, String tipo){
        this.usuario    =   usuario;
        this.nombre     =   nombre;
        this.apellido   =   apellido;
        this.correo     =   correo;
        this.password   =   password;
        this.edad       =   edad;
        this.sexo       =   sexo;
        this.tipo       =   tipo;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @return the edad
     */
    public String getEdad() {
        return edad;
    }

    /**
     * @return the sexo
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }
}
