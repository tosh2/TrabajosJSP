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
import java.util.ArrayList;
import java.util.List;

import Classes.Oferta;

/**
 *
 * @author tosh
 */
public class Modelo_Oferta {
    Modelo_ConexionDb db = new Modelo_ConexionDb();
    String sql = "";
    Connection conn;
    PreparedStatement pst;
    ResultSet rs;
    
    
    public List obtenerOfertas(){
        List ofertas = new ArrayList();
        try {
            Class.forName(db.getDriver());  //Crea Conexion con DB
            conn = DriverManager.getConnection(db.getUrl(),db.getUserdb(),db.getPassdb());
            sql = "SELECT * FROM oferta;";
            pst=conn.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                Oferta nuevaOferta = new Oferta(rs.getString("oferta"),rs.getString("titulo"),rs.getString("descripcion"),
                                                rs.getString("numeroPlazas"),rs.getString("nivelExperiencia"),
                                                rs.getString("salario"),rs.getString("vehiculo"));
                ofertas.add(nuevaOferta);
            }
            
            conn.close();
            rs.close();
            return ofertas;
        } catch (Exception e) {
        }
        return ofertas;
    }
    
}
