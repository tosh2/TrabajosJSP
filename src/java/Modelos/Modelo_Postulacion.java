/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import Classes.Postulacion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Jose
 */
public class Modelo_Postulacion {

    Modelo_ConexionDb db = new Modelo_ConexionDb();
    String sql = "";
    Connection conn;
    PreparedStatement pst;
    ResultSet rs;
    String sql1 = "";
    Connection conn1;
    PreparedStatement pst1;
    ResultSet rs1;

    public int aceptarPostulante(String postulante, String ofertaUsuarioUsuario, String ofertaUsuarioOfertaOferta) {
        /*  tosh - Oferta no se elimina, solo se actualiza su campo estado*/
        try {
            Class.forName(db.getDriver());  //Crea Conexion con DB
            conn = DriverManager.getConnection(db.getUrl(), db.getUserdb(), db.getPassdb());

            sql = "UPDATE Postulacion SET postulacion.estado = 1 WHERE ofertaUsuario_usuario_usuario = '" + ofertaUsuarioUsuario + "' and ofertaUsuario_oferta_oferta='" + ofertaUsuarioOfertaOferta + "' and usuario_usuario='" + postulante + "';";
            pst = conn.prepareStatement(sql);

            pst.executeUpdate();
            conn.close();

            return 1;
        } catch (Exception e) {
        }
        return 0;
    }

    public int rechazarPostulante(String postulante, String ofertaUsuarioUsuario, String ofertaUsuarioOfertaOferta) {
        /*  tosh - Oferta no se elimina, solo se actualiza su campo estado*/
        try {
            Class.forName(db.getDriver());  //Crea Conexion con DB
            conn = DriverManager.getConnection(db.getUrl(), db.getUserdb(), db.getPassdb());

            sql = "UPDATE Postulacion SET postulacion.estado = 2 WHERE ofertaUsuario_usuario_usuario = '" + ofertaUsuarioUsuario + "' and ofertaUsuario_oferta_oferta='" + ofertaUsuarioOfertaOferta + "' and usuario_usuario='" + postulante + "';";
            pst = conn.prepareStatement(sql);

            pst.executeUpdate();
            conn.close();

            return 1;
        } catch (Exception e) {
        }
        return 0;
    }

    public Postulacion getPostulacion(String postulante, String ofertaUsuarioOfertaOferta) {
        Postulacion postulacion = null;
        try {
            Class.forName(db.getDriver());  //Crea Conexion con DB
            conn = DriverManager.getConnection(db.getUrl(), db.getUserdb(), db.getPassdb());
            sql = "SELECT * FROM Postulacion WHERE ofertaUsuario_oferta_oferta='" + ofertaUsuarioOfertaOferta + "' and usuario_usuario='" + postulante + "';";
            pst = conn.prepareStatement(sql);

            rs = pst.executeQuery();
            while (rs.next()) {
                postulacion = new Postulacion(rs.getString("estado"), rs.getString("usuario_usuario"), rs.getString("ofertaUsuario_usuario_usuario"), rs.getString("ofertaUsuario_oferta_oferta"));

            }
            conn.close();
            rs.close();
            return postulacion;
        } catch (SQLException | ClassNotFoundException e) {
            return postulacion;
        }
    }
}
