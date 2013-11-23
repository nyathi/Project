/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL;

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
public class processTransactions {
    
    private connectToDB connB;
    private ResultSet result;
    private Statement statement;
    private Connection connection;

    public processTransactions() throws ClassNotFoundException, SQLException {
         connB=new connectToDB();
        connection=connB.getConnection();
        statement=connection.createStatement();
    }
    
    public String payments(String idNumber,String acctType,String acctNumber,String bankName,double total) throws SQLException
    {
        String sql="Select * From accounts Where IdNumber='"+idNumber+"' And AccountNumber='"+acctNumber+"'";
        result=statement.executeQuery(sql);
        String message=null;
        while(result.next())
        {
            String accountType=result.getString("AccountType");
            String bnkName=result.getString("BankName");
            double balance=result.getDouble("Balance");
            if(bankName.equals(bankName) && accountType.equals(acctType))
            {
                if(total>0 &&total<=balance)
                {
                    double newBalance=balance-total;
                    String update="Update accounts Set Balance="+newBalance;
                    int up=statement.executeUpdate(update);
                    if(up>0)
                    {
                        message="Payment was made successful.";
                    }
                }
                else if(total>0 && total>balance)
                {
                    message="Grand total for item(s) to be purchase must be greater than zero and less or equals account blanace.";
                }
            }
            else if(!bankName.equals(bankName) && !accountType.equals(acctType))
            {
                message="Incorrect account type and bank name.";
            }
        }
                
        
        return message;
    }
    
    public int insertOrder(String custId,String custName,int itmeId,String itemName,int qty,double total,String date) throws SQLException
    {
        String sql="Insert Into traceOrder(CustomerID,CustomerName,ItemId,ItemName,Quantity,Total,Date) Values ('"+custId+"','"+custName+"',"+itmeId+",'"+
                itemName+"',"+qty+","+total+",'"+date+"')";
        return statement.executeUpdate(sql);
    }
    public ArrayList<overallReport> getReport() throws SQLException
    {
        ArrayList<overallReport> report=new ArrayList<overallReport>();
        String sql="Select * from traceOrder";
        result=statement.executeQuery(sql);
        overallReport rep=null;
        while(result.next())
        {
            String custID=result.getString("CustomerID");
            String custName=result.getString("CustomerName");
            int itemId=result.getInt("ItemId");
            String itemName=result.getString("ItemName");
            int muberOfProducts=result.getInt("Quantity");
            double total=result.getDouble("Total");
            String date=result.getString("Date");
            rep=new overallReport(custID, custName, itemId, itemName, muberOfProducts, total, date);
            report.add(rep);
        }
        return report;
    }
    /*public static void main(String[] d)
    {
        try {
            processTransactions pt=new processTransactions();
           ArrayList<overallReport> r=pt.getReport();
           for(int x=0;x<r.size();x++)
           {
               System.out.println("  "+r.get(x).getCutsName());
           }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(processTransactions.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(processTransactions.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }*/
}
