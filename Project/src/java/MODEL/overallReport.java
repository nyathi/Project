/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL;

/**
 *
 * @author Student
 */
public class overallReport {
    private String custID;
    private String cutsName;
    private int itemId;
    private String itemName;
    private int numberOfProducts;
    private double total;
    private String date;

    public overallReport(String custID, String cutsName, int itemId, String itemName, int numberOfProducts, double total, String date) {
        this.custID = custID;
        this.cutsName = cutsName;
        this.itemId = itemId;
        this.itemName = itemName;
        this.numberOfProducts = numberOfProducts;
        this.total = total;
        this.date = date;
    }

    public String getCustID() {
        return custID;
    }

    public void setCustID(String custID) {
        this.custID = custID;
    }

    public String getCutsName() {
        return cutsName;
    }

    public void setCutsName(String cutsName) {
        this.cutsName = cutsName;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getNumberOfProducts() {
        return numberOfProducts;
    }

    public void setNumberOfProducts(int numberOfProducts) {
        this.numberOfProducts = numberOfProducts;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
}
