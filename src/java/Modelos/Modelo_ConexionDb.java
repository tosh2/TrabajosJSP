package Modelos;

/**
 *
 * @author tosh
 * url  =   cadena conexion con MySQL
 * user =   usuario de BD
 * contra = contraseña de usuario de BD
 * driver = Driver de Java con MySQL
 */
public class Modelo_ConexionDb {
    private String url;    
    private String user;   
    private String contra;
    private String driver;

    public Modelo_ConexionDb(){
        this.url    =   "jdbc:mysql://localhost:3306/analisis";
        this.user   =   "root";
        this.contra =   "";
        this.driver =   "com.mysql.jdbc.Driver";
    }
    
    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @return the user
     */
    public String getUser() {
        return user;
    }

    /**
     * @return the contra
     */
    public String getContra() {
        return contra;
    }

    /**
     * @return the driver
     */
    public String getDriver() {
        return driver;
    }
    
}
