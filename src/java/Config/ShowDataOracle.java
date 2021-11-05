
package Config;

import Config.Conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author Marco
 */
public class ShowDataOracle {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        String sSQL="";
        
        Conexion conexion = new Conexion();
        
        
        try {
            sSQL= "SELECT * FROM PRODUCTO";
            Connection con =conexion.conectar();
            Statement cn =con.createStatement();
            ResultSet res = cn.executeQuery (sSQL);
            
            while (res.next()) {
                System.out.println("---");
                System.out.println(res.getInt ("ID_PRODUCTO"));
                System.out.println(res.getString ("NOMBREPRODUCTO"));
                
           
                } 
        } catch (SQLException e) {
            System.out.println(e);
        }
            
    
}
    }

