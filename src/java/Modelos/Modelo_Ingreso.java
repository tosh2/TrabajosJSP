/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;
import java.sql.*;

/**
 *
 * @author tosh
 * db   =   conexion con BD
 * sql  =   query
 * conn =   conexion con DB driver
 * pst  =   ejecuta query
 * rs   =   resultado del query
 */
public class Modelo_Ingreso {
    Modelo_ConexionDb db = new Modelo_ConexionDb();
    String sql = "";
    Connection conn;
    PreparedStatement pst;
    ResultSet rs;
    
    
    public int validarAcceso(String usuario, String password){
        int tipoUsuario = 0;
        try {
            Class.forName(db.getDriver());  //Crea Conexion con DB
            conn = DriverManager.getConnection(db.getUrl(),db.getUserdb(),db.getPassdb());
            sql = "SELECT tipo FROM usuario WHERE correo='"+usuario+"'AND password='"+password+"';";
            pst=conn.prepareStatement(sql);
            
            rs  =   pst.executeQuery();
            while(rs.next()){
                tipoUsuario   =   rs.getInt(1);   //  1   =   posicion del valor de la columna "nivel"
            }
            conn.close();
            rs.close();
            return tipoUsuario;
        } catch (SQLException | ClassNotFoundException e) {
            return tipoUsuario;
        }
    }
}
