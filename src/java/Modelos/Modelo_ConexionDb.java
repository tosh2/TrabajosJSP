package Modelos;

/**
 *
 * @author tosh url = cadena conexion con MySQL user = usuario de BD contra =
 * contraseña de usuario de BD driver = Driver de Java con MySQL
 */
public class Modelo_ConexionDb {

    /*  tosh - Editar variables de clase para conexion  */
    private String url;
    private String driver;
    private final String userdb = "root";
    private final String passdb = "analisis2";
    private final String port = ":3306";

    public Modelo_ConexionDb() {
        this.url = "jdbc:mysql://localhost" + port + "/analisis";
        this.driver = "com.mysql.jdbc.Driver";
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
