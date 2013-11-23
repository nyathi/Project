/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;

import MODEL.connectToDB;
import java.io.PrintStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package POJO:
//            CustomerRigistration

public class CustomerRegistrationDAO
{

    private Connection connection;
    private Statement statement;
    private ResultSet result;
    private int row;

    public CustomerRegistrationDAO()
        throws ClassNotFoundException, SQLException
    {
        row = 0;
        connection = (new connectToDB()).getConnection();
        statement = connection.createStatement();
    }

    public boolean userExists(String s)
        throws SQLException
    {
        boolean flag = false;
        String s1 = (new StringBuilder()).append("SELECT * FROM customer WHERE customer_id='").append(s).append("'").toString();
        for(result = statement.executeQuery(s1); result.next();)
        {
            flag = true;
        }

        return flag;
    }

    public int insertCustomerReg(CustomerRigistration customerrigistration)
        throws SQLException
    {
        boolean flag = false;
        String s = (new StringBuilder()).append("insert into customer(customer_id,name,telephone,email,gender,address,userName,pa" +
"ssword) values('"
).append(customerrigistration.getCustomer_id()).append("','").append(customerrigistration.getName()).append("','").append(customerrigistration.getTelephone()).append("','").append(customerrigistration.getEmail()).append("','").append(customerrigistration.getGender()).append("','").append(customerrigistration.getAddress()).append("','").append(customerrigistration.getUserName()).append("','").append(customerrigistration.getPassword()).append("')").toString();
        String s1 = "User";
        row = statement.executeUpdate(s);
        if(row > 0)
        {
            String s2 = (new StringBuilder()).append("insert into login(Username,IdNumber,Password,Role) values('").append(customerrigistration.getUserName()).append("','").append(customerrigistration.getCustomer_id()).append("','").append(customerrigistration.getPassword()).append("','").append(s1).append("')").toString();
            int i = statement.executeUpdate(s2);
            if(i > 0)
            {
                System.out.println("login saved");
            } else
            {
                System.out.println("not  saved");
            }
        }
        return row;
    }

    public boolean login(String s, String s1)
        throws SQLException
    {
        boolean flag = false;
        int i = 0;
        String s2 = (new StringBuilder()).append("SELECT * FROM customer WHERE userName ='").append(s).append("' and  password='").append(s1).append("'").toString();
        for(result = statement.executeQuery(s2); result.next();)
        {
            i++;
        }

        if(i == 1)
        {
            flag = true;
        }
        return flag;
    }

    public int deleteCustomerDetail(String s)
        throws SQLException
    {
        String s1 = (new StringBuilder()).append("DELETE FROM customer WHERE customer_id = '").append(s).append("'").toString();
        row = statement.executeUpdate(s1);
        return row;
    }

    public ArrayList getAllUser()
        throws SQLException
    {
        ArrayList arraylist = new ArrayList();
        String s = "SELECT * FROM customer";
        CustomerRigistration customerrigistration;
        for(result = statement.executeQuery(s); result.next(); arraylist.add(customerrigistration))
        {
            customerrigistration = new CustomerRigistration(result.getString("customer_id"), result.getString("name"), result.getString("telephone"), result.getString("email"), result.getString("gender"), result.getString("address"), "", "");
        }

        return arraylist;
    }

    public int updateEmployeeDetail(CustomerRigistration customerrigistration)
        throws SQLException
    {
        String s = (new StringBuilder()).append("UPDATE customer SET name ='").append(customerrigistration.getName()).append("',").append("userName = '").append(customerrigistration.getUserName()).append("',").append("address = '").append(customerrigistration.getAddress()).append("',").append("gender = '").append(customerrigistration.getGender()).append("',").append("telephone ='").append(customerrigistration.getTelephone()).append("',").append("email = ").append(customerrigistration.getEmail()).append("',").append("email = ").append(customerrigistration.getPassword()).append(" WHERE customer_id =").append(customerrigistration.getCustomer_id()).append("").toString();
        row = statement.executeUpdate(s);
        return row;
    }

    public List getCustomerInfor(int i)
        throws SQLException
    {
        ArrayList arraylist = new ArrayList();
        String s = (new StringBuilder()).append("SELECT * FROM customer WHERE customer_id =").append(i).toString();
        CustomerRigistration customerrigistration;
        for(result = statement.executeQuery(s); result.next(); arraylist.add(customerrigistration))
        {
            customerrigistration = new CustomerRigistration(result.getString(1), result.getString(2), result.getString(3), result.getString(4), result.getString(5), result.getString(6), result.getString(7), result.getString(8));
        }

        return arraylist;
    }
}
