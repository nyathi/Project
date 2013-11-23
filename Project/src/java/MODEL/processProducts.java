/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL;

import POJO.Products;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Student
 */
public class processProducts {
    private connectToDB connB;
    private ResultSet result;
    private Statement statement;
    private Connection connection;

    public processProducts() throws ClassNotFoundException, SQLException {
        
        connB=new connectToDB();
        connection=connB.getConnection();
        statement=connection.createStatement();
    }
    public Products getProduct(int id) throws SQLException {
        String sql = "select * from products where ID="+id;
        Products pro = null;
        result = statement.executeQuery(sql);
        while (result.next()) {
            pro = new Products(result.getInt(1), result.getString(2), result.getDouble(3), result.getInt(4), result.getString(5), result.getString(6));
        }
        return pro;

    }
    public ArrayList<Products> getVegaAndFruits() throws SQLException
    {
        ArrayList<Products> allProducts=new ArrayList<Products>();
        String sql="SELECT * FROM products WHERE itemType='Vegetable' OR itemType='Fruit'";
        
        result=statement.executeQuery(sql);
        while(result.next())
        {
            int id=result.getInt("ID");
            String itemName=result.getString("itemName");
            int numberOfItem=result.getInt("numberOfItems");
            String type=result.getString("itemType");
            double price=result.getDouble("itemPrice");
            String image=result.getString("imagePath");
            
            Products prod=new Products(id, itemName, price, numberOfItem,type, image);
            allProducts.add(prod);
        }
        return allProducts;

    }
        public ArrayList<Products> getLiveStocks() throws SQLException
        {
            ArrayList<Products> Products=new ArrayList<Products>();
        String sql="SELECT * FROM products WHERE itemType='Live stock'";
        
        result=statement.executeQuery(sql);
            while(result.next())
            {
                int id=result.getInt("ID");
                String itemName=result.getString("itemName");
                int numberOfItem=result.getInt("numberOfItems");
                String type=result.getString("itemType");
                double price=result.getDouble("itemPrice");
                String image=result.getString("imagePath");

                Products prod=new Products(id, itemName, price, numberOfItem,type, image);
                Products.add(prod);
            }
           return Products;
        }
    public int updateProduct(Products prod,int newQty) throws SQLException
    {
        String sql="Update products Set numberOfItems="+newQty+" Where ID="+prod.getId()+" and itemName='"+prod.getItemName()+"'";
        return statement.executeUpdate(sql);
    }
   
   public static void main(String[] args)
    {
      
        try {
            processProducts p=new processProducts();
            /*ArrayList<Products> pd=p.getLiveStocks();
            for(int y=0;y<pd.size();y++)
            {
                System.out.println("name"+pd.get(y).getItemName());
            }*/
            Products pr=new Products();
            pr.setId(1);
            pr.setItemName("Pamkin");
            if(p.updateProduct(pr, 50)>0)
            {
                System.out.print("updated!");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(processProducts.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(processProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
