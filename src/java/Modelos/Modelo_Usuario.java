/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
                                String password, String edad, String sexo, String tipo_usuario){
        //  INSERT INTO `usuario` (`usuario`, `nombre`, `apellido`, `correo`, `password`, `edad`, `sexo`, `tipo`) VALUES (NULL, 'Carlos', 'Lopez', 'carlos@gmail.com', 'jdis123', '25', '1', '2');
        int rquery = 0; /*  determina si el query fue ejecutado correctamente*/
        try {
             Class.forName(db.getDriver());  //Crea Conexion con DB
            conn = DriverManager.getConnection(db.getUrl(),db.getUser(),db.getContra());
            sql = "INSERT INTO `usuario` (`usuario`, `nombre`, `apellido`, `correo`, `password`, `edad`, `sexo`, `tipo`)"
                + " VALUES (NULL,'"+nombre+"','"+apellido+"','"+correo+"','"+password+"','"+edad+"','"+sexo+"','"+tipo_usuario+"');";
            pst=conn.prepareStatement(sql);
            rquery  =   pst.executeUpdate();
            conn.close();
            System.out.println("Valor query "+rquery);
            return rquery;
        } catch (SQLException | ClassNotFoundException e) {
        }
        
        return 0;
    }
    
}
