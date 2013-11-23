/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;

import MODEL.connectToDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package POJO:
//            CustomerRigistration, Products

public class AdminDAO
{

    private Connection connection;
    private Statement statement;
    private ResultSet result;
    private int row;

    public AdminDAO()
        throws ClassNotFoundException, SQLException
    {
        row = 0;
        connection = (new connectToDB()).getConnection();
        statement = connection.createStatement();
    }

    public int deleteCustomer(String s)
        throws SQLException
    {
        String s1 = (new StringBuilder()).append("delete from customer where customer_id='").append(s).append("'").toString();
        return statement.executeUpdate(s1);
    }

    public int deleteProduct(int i)
        throws SQLException
    {
        String s = (new StringBuilder()).append("delete from products where ID=").append(i).toString();
        return statement.executeUpdate(s);
    }

    public int insertProduct(Products products)
        throws SQLException
    {
        String s = (new StringBuilder()).append("insert into products(itemName,itemPrice,numberOfItems,itemType,imagePath) values" +
"('"
).append(products.getItemName()).append("',").append(products.getItemPrice()).append(",").append(products.getNumberOfItems()).append(",'").append(products.getType()).append("','").append(products.getImagePath()).append("')").toString();
        return statement.executeUpdate(s);
    }

    public int updateProduct(int i, String s, double d, int j, String s1)
        throws SQLException
    {
        String s2 = (new StringBuilder()).append("UPDATE products SET itemName='").append(s).append("',itemPrice=").append(d).append(",numberOfItems=").append(j).append(",imagePath='").append(s1).append("' WHERE ID=").append(i).toString();
        return statement.executeUpdate(s2);
    }

    public CustomerRigistration viewCustomer(int i)
        throws SQLException
    {
        String s = (new StringBuilder()).append("SELECT * FROM customer WHERE customer_id=").append(i).toString();
        CustomerRigistration customerrigistration = null;
        for(result = statement.executeQuery(s); result.next();)
        {
            customerrigistration = new CustomerRigistration(result.getString(1), result.getString(2), result.getString(3), result.getString(4), result.getString(5), result.getString(6), result.getString(7), result.getString(8));
        }

        return customerrigistration;
    }

    public List getAllProduct()
        throws SQLException
    {
        String s = "select * from products";
        Object obj = null;
        ArrayList arraylist = new ArrayList();
        Products products;
        for(result = statement.executeQuery(s); result.next(); arraylist.add(products))
        {
            products = new Products(result.getInt(1), result.getString(2), result.getInt(3), result.getInt(4), result.getString(5), result.getString(6));
        }

        return arraylist;
    }

    public Products getProduct(int i)
        throws SQLException
    {
        String s = (new StringBuilder()).append("select * from products where ID=").append(i).toString();
        Products products = null;
        for(result = statement.executeQuery(s); result.next();)
        {
            products = new Products(result.getInt(1), result.getString(2), result.getDouble(3), result.getInt(4), result.getString(5), result.getString(6));
        }

        return products;
    }

    public double getPrice(int i)
        throws SQLException
    {
        String s = (new StringBuilder()).append("select * from products where ID=").append(i).toString();
        Object obj = null;
        double d = 0.0D;
        for(result = statement.executeQuery(s); result.next();)
        {
            d = result.getDouble(3);
        }

        return d;
    }

    public String getTotalPriceReport()
        throws SQLException
    {
        String s = "select * from products";
        Object obj = null;
        String s1 = "";
        double d = 0.0D;
        for(result = statement.executeQuery(s); result.next();)
        {
            d += result.getDouble(3) * (double)result.getInt(4);
        }

        s1 = (new StringBuilder()).append(d).append("").toString();
        return s1;
    }

    public int getNumberOfItems()
        throws SQLException
    {
        int i = 0;
        String s = "select * from products";
        Object obj = null;
        String s1 = "";
        for(result = statement.executeQuery(s); result.next();)
        {
            i += result.getInt(4);
        }

        return i;
    }

    public double getPriceOfOneTypeProduct(String s)
        throws SQLException
    {
        String s1 = (new StringBuilder()).append("select * from products where itemName='").append(s).append("'").toString();
        Object obj = null;
        double d = 0.0D;
        for(result = statement.executeQuery(s1); result.next();)
        {
            d += result.getDouble(3) * (double)result.getInt(4);
        }

        return d;
    }

    public int checkNumberOfCustomer()
        throws SQLException
    {
        String s = "SELECT * FROM customer";
        int i = 0;
        for(result = statement.executeQuery(s); result.next();)
        {
            i++;
        }

        return i;
    }

    public int changeQuantity(int i, int j)
        throws SQLException
    {
        String s = (new StringBuilder()).append("SELECT * FROM customer where ID=").append(i).toString();
        int k = 0;
        for(result = statement.executeQuery(s); result.next();)
        {
            k = result.getInt(4);
        }

        k -= j;
        String s1 = (new StringBuilder()).append("UPDATE products SET numberOfItems=").append(k).append(" WHERE ID=").append(i).toString();
        return statement.executeUpdate(s1);
    }
}
