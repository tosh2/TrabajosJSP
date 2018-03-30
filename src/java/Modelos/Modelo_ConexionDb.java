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
    private String userdb;   
    private String passdb;
    private String driver;

    public Modelo_ConexionDb(){
        this.url    =   "jdbc:mysql://localhost/analisis";
        this.userdb   =   "root";
        this.passdb =   "123456";
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
    public String getUserdb() {
        return userdb;
    }

    /**
     * @return the contra
     */
    public String getPassdb() {
        return passdb;
    }

    /**
     * @return the driver
     */
    public String getDriver() {
        return driver;
    }
    
}
