/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;

import java.io.Serializable;
import java.sql.*;

public class Report
    implements Serializable
{

    private double overRollPrice;
    private double totalItemPrice;
    private Date day;
    private String itemName;
    private String itemType;
    private int totalNumberAll;
    private int totalIterm;
    private Connection connection;
    private Statement statement;
    private PreparedStatement preparedStatement;
    private ResultSet result;
    private int row;

    public Report(int i, int j)
    {
        row = 0;
        totalNumberAll = i;
        totalIterm = j;
    }

    public double getTolPrice()
    {
        double d = 0.0D;
        String s = "Select * from products";
        return d;
    }

    public int getTotalNumberAll()
    {
        return totalNumberAll;
    }

    public void setTotalNumberAll(int i)
    {
        totalNumberAll = i;
    }

    public int getTotalIterm()
    {
        return totalIterm;
    }

    public void setTotalIterm(int i)
    {
        totalIterm = i;
    }
}
