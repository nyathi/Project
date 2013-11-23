/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL;

import POJO.CustomerRigistration;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Student
 */
public class processLogin {
    private connectToDB connB;
    private ResultSet result;
    private Statement statement;
    private Connection connection;

    public processLogin() throws ClassNotFoundException, SQLException {
        
        connB=new connectToDB();
        connection=connB.getConnection();
        statement=connection.createStatement();
        
    }
    public String loginAuthentication(String user ,String password) throws SQLException
    {
        String roleType=null;
        String sql="SELECT * FROM login WHERE Username='"+user+"' AND Password='"+password+"'";
        result=statement.executeQuery(sql);
        while(result.next()){
            int id=result.getInt("ID");
            String username=result.getString("Username");
            String pass=result.getString("Password");
            String role=result.getString("Role");
            
          roleType=role;
        }
        
        return roleType;
    }
    public String getUserIDNumber(String user ,String password) throws SQLException
    {
        String id=null;
        String sql="SELECT * FROM login WHERE Username='"+user+"' AND Password='"+password+"'";
        result=statement.executeQuery(sql);
        while(result.next()){
            id=result.getString("IdNumber");       
                      
        }
        
        return id;
    }
    public CustomerRigistration getUserInfo(String id) throws SQLException
    {
        String sql="SELECT * FROM customer WHERE customer_id='"+id+"'";
        result=statement.executeQuery(sql);
        CustomerRigistration cr=null;
        while(result.next())
        {
            cr=new CustomerRigistration(result.getString("customer_id"), result.getString("name")
                    , result.getString("telephone"), result.getString("email"), result.getString("gender"), result.getString("address"), "", "");
        }
        return cr;
    }
    public static void main(String[] a)
    {
        try {
            processLogin p=new processLogin();
            CustomerRigistration cr=p.getUserInfo("8911216097083");
            System.out.println("name "+cr.getName());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(processLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(processLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
