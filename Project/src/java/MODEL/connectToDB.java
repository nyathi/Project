/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Student
 */
public class connectToDB {
    private Connection connection;

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
       connection=DriverManager.getConnection("jdbc:mysql://localhost/farmDatabase","root",""); 
       return connection;
    }
    
    public void close() throws SQLException
    {
        connection.close();
    }
}
