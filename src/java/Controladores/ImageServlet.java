/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelos.Modelo_Usuario;
import Modelos.Modelo_ConexionDb;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataSource;

/**
 *
 * @author tosh
 */
@WebServlet("/images/*")
public class ImageServlet extends HttpServlet {

    // content=blob, name=varchar(255) UNIQUE.
    private static final String SQL_FIND = "SELECT foto FROM usuario WHERE usuario.correo = ?";

    private Modelo_ConexionDb dataSource = new Modelo_ConexionDb();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String imageName = request.getPathInfo().substring(1); // Returns "foo.png".
        try {
            Class.forName(dataSource.getDriver());  //Crea Conexion con DB
            
            
            try (Connection connection = DriverManager.getConnection(dataSource.getUrl(),dataSource.getUserdb(),dataSource.getPassdb()); PreparedStatement statement = connection.prepareStatement(SQL_FIND)) {
                statement.setString(1, imageName);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    byte[] content = resultSet.getBytes(1);
                    response.setContentType(getServletContext().getMimeType(imageName));
                    response.setContentLength(content.length);
                    response.getOutputStream().write(content);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Something failed at SQL/DB level.", e);
        }
            
            
            
            
            
            
            
            
            
            
            
            
        } catch (ClassNotFoundException ex) {
        
            
            
            
            Logger.getLogger(ImageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        
    }

}
