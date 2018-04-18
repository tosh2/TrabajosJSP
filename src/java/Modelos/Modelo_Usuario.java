/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import Classes.Usuario;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

/**
 *
 * @author tosh
 */
public class Modelo_Usuario {

    Modelo_ConexionDb db = new Modelo_ConexionDb();
    String sql = "";
    Connection conn;
    PreparedStatement pst;
    ResultSet rs;

    /*
        Tabla Usuario
     */
    public int registrarUsuario(String nombre, String apellido, String correo,
            String password, String edad, String sexo, String tipo_usuario, InputStream foto) {
        //  INSERT INTO 'usuario' ('usuario', 'nombre', 'apellido', 'correo', 'password', 'edad', 'sexo', 'tipo') VALUES (NULL, 'Carlos', 'Lopez', 'carlos@gmail.com', 'jdis123', '25', '1', '2');
        int rquery = 0;
        /*  determina si el query fue ejecutado correctamente*/
        try {
            Class.forName(db.getDriver());  //Crea Conexion con DB
            conn = DriverManager.getConnection(db.getUrl(), db.getUserdb(), db.getPassdb());

            sql = "INSERT INTO usuario (usuario, nombre, apellido, correo, password, edad, sexo, tipo,foto)"
                    + " VALUES (NULL,'" + nombre + "','" + apellido + "','" + correo + "','" + password + "','" + edad + "','" + sexo + "','" + tipo_usuario + "',?);";
            pst = conn.prepareStatement(sql);
            pst.setBlob(1, foto);
            rquery = pst.executeUpdate();
            conn.close();
            System.out.println("Valor query " + rquery);
            return rquery;
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e.toString());
        }

        return 0;
    }

    public Usuario obtenerInformacionUsuario(String correo) {
        Usuario usuario = null;
        try {
            Class.forName(db.getDriver());  //Crea Conexion con DB
            conn = DriverManager.getConnection(db.getUrl(), db.getUserdb(), db.getPassdb());
            sql = "SELECT * FROM usuario WHERE correo='" + correo + "';";
            pst = conn.prepareStatement(sql);

            rs = pst.executeQuery();
            while (rs.next()) {
                usuario = new Usuario(rs.getString("usuario"), rs.getString("nombre"), rs.getString("apellido"),
                        rs.getString("correo"), rs.getString("password"), rs.getString("edad"),
                        rs.getString("sexo"), rs.getString("tipo"));
            }
            conn.close();
            rs.close();
            return usuario;
        } catch (SQLException | ClassNotFoundException e) {
            return usuario;
        }
    }

    public boolean existeCorreo(String correo) {
        Usuario usuario = null;
        try {
            Class.forName(db.getDriver());  //Crea Conexion con DB
            conn = DriverManager.getConnection(db.getUrl(), db.getUserdb(), db.getPassdb());
            sql = "SELECT * FROM usuario WHERE correo='" + correo + "';";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                return true;
            }
            conn.close();
            rs.close();
            return false;
        } catch (SQLException | ClassNotFoundException e) {
            return false;
        }
    }

    public int actualizarUsuario(String nombre, String apellido, String correo,
            String password, String edad, String sexo, String tipo_usuario) {
        int rquery = 0;
        /*  determina si el query fue ejecutado correctamente*/
        try {
            Class.forName(db.getDriver());  //Crea Conexion con DB
            conn = DriverManager.getConnection(db.getUrl(), db.getUserdb(), db.getPassdb());
            sql = "UPDATE usuario SET "
                    + " nombre='" + nombre + "',apellido='" + apellido + "',correo='" + correo + "',password='" + password + "',edad='" + edad + "',sexo='" + sexo + "',tipo='" + tipo_usuario + "'"
                    + " WHERE correo='" + correo + "';";
            pst = conn.prepareStatement(sql);
            rquery = pst.executeUpdate();
            conn.close();
            System.out.println("Valor query " + rquery);
            return rquery;
        } catch (SQLException | ClassNotFoundException e) {
        }
        return 0;
    }

}
