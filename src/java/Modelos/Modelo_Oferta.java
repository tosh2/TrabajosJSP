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
import java.sql.SQLException;

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
            sql = "SELECT * FROM Oferta;";
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
    
    public int crearOferta(String titulo, String descripcion, String numeroPlazas, String nivelExperiencia, String salario, String vehiculo){
        int rquery = 0; /*  determina si el query fue ejecutado correctamente*/
        try {
             Class.forName(db.getDriver());  //Crea Conexion con DB
            conn = DriverManager.getConnection(db.getUrl(),db.getUserdb(),db.getPassdb());
            sql = "INSERT INTO `oferta` (`oferta`, `titulo`, `descripcion`, `numeroPlazas`, `nivelExperiencia`, `salario`, `vehiculo`)"
                + " VALUES (NULL,'"+titulo+"','"+descripcion+"','"+numeroPlazas+"','"+nivelExperiencia+"','"+salario+"','"+vehiculo+"');";
            pst=conn.prepareStatement(sql);
            rquery  =   pst.executeUpdate();
            conn.close();
            System.out.println("Valor query "+rquery);
            return rquery;
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Grupo 8-Error: "+e);
        }
        return 0;
    }
    
}
