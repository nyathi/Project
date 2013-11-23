/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;

import java.io.Serializable;

/**
 *
 * @author Student
 */
public class Products implements Serializable{
    
    private int id;
    private String itemName;
    private double itemPrice;
    private int numberOfItems;
    private String type;
    private String imagePath;

    public Products() {
    }

    public Products(int id, String itemName, double itemPrice, int numberOfItems, String type, String imagePath) {
        this.id = id;
        this.itemName = itemName;
        this.itemPrice = itemPrice;
        this.numberOfItems = numberOfItems;
        this.type = type;
        this.imagePath = imagePath;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }

    public int getNumberOfItems() {
        return numberOfItems;
    }

    public void setNumberOfItems(int numberOfItems) {
        this.numberOfItems = numberOfItems;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    public double getVat(double totPrice)
    {
        double vat=totPrice-0.14;
        return vat;
    }
    public double getTotprice(double vat,double price)
    {
        double prices=price-vat;
        return prices;
    }
    public double myTotPrice(double vat,double price)
    {
        return getTotprice( vat, price);
    }
    
    
}
