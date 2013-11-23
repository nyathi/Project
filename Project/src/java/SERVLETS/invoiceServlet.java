/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;


import MODEL.processTransactions;
import POJO.CustomerRigistration;
import POJO.Products;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.HeaderFooter;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfAppearance;
import com.lowagie.text.pdf.PdfNumber;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import java.awt.Color;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
/**
 *
 * @author Trust Hope
 */
public class invoiceServlet extends HttpServlet {

    ServletOutputStream sOut;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        OutputStream file = null;
         response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
         HttpSession session=request.getSession();
        try {
            
            Document document=new Document();
            HeaderFooter header=new HeaderFooter(new Phrase("Online Farming System",FontFactory.getFont(FontFactory.HELVETICA_BOLDOBLIQUE,20,Font.BOLD)),false);
            header.setAlignment(PdfAppearance.ALIGN_CENTER);
            header.setBorder(PdfNumber.STRING);
           // head.set
            /*Image logo = Image.getInstance("D:/foot_image.bmp");
            logo.setAlignment(Image.MIDDLE);
            logo.scaleAbsoluteHeight(20);
            logo.scaleAbsoluteWidth(20);
            logo.scalePercent(100);
            Chunk chunk = new Chunk(logo, 0, 10);
            HeaderFooter header = new HeaderFooter(new Phrase(chunk), false);
            header.setAlignment(Element.ALIGN_CENTER);
            header.setBorder(Rectangle.NO_BORDER);*/

            PdfWriter.getInstance(document, new FileOutputStream("D:/invoice.pdf"));
            PdfWriter.getInstance(document, response.getOutputStream());
           document.setHeader(header);
            document.open();
            Table table =new Table(3,100);
            table.setSpacing(1);
            
             Paragraph subTitle = new Paragraph("*************INVOICE********************");
            subTitle.setAlignment(PdfAppearance.ALIGN_CENTER);
            document.add(subTitle);
            Cell cell1=new Cell("Purchae item");
            cell1.setBackgroundColor(Color.GREEN);
            
            table.addCell(cell1);
            Cell cell2=new Cell("Quantity");
            cell2.setBackgroundColor(Color.GREEN);
            table.addCell(cell2);
            Cell cell3=new Cell("Cost");
            cell3.setBackgroundColor(Color.GREEN);
            table.addCell(cell3);
            //document.add(table);
             List shopCart=(List) session.getAttribute("shopcart");
           List qty=(List) session.getAttribute("quantity");
           PdfPTable table1=new PdfPTable(3);
           CustomerRigistration cr=(CustomerRigistration)  session.getAttribute("userInfo");
           processTransactions pt=new processTransactions();
           DecimalFormat d=new DecimalFormat("0.00");
           double total=0.0;
           Date date=new Date();
           Calendar cal=Calendar.getInstance();
           cal.setTime(date);
           String time=cal.get(Calendar.HOUR)+":"+cal.get(Calendar.MINUTE);
           String strDate=cal.get(Calendar.DAY_OF_MONTH)+"/"+cal.get(Calendar.MONTH)+"/"+cal.get(Calendar.YEAR)+" "+time;
           for(int i=0;i<shopCart.size();i++)
           {
               Products p=(Products)shopCart.get(i);
                int q=((Integer) qty.get(i)).intValue();
               table1.addCell(p.getItemName());
               String  quantity=String.valueOf(q);
               table1.addCell(quantity);
               double cost=p.getItemPrice()*q;
               table1.addCell(d.format(cost));
              pt.insertOrder(cr.getCustomer_id(), cr.getName(), p.getId(), p.getItemName(), q, cost,strDate);
               total+=cost;
           }
           
           Table t=new Table(3);
           Cell cell=new Cell("");
           cell.setColspan(3);
           t.addCell(cell);
           t.addCell("Grand total:");
           t.addCell("");
           t.addCell(d.format(total));
           
           
           
           String adress="Name :"+cr.getName()+"\nAddress :"+cr.getAddress()+"\nEmail :"+cr.getEmail()+"\nContact :"+cr.getTelephone();
          Paragraph address=new Paragraph(adress);
          address.setAlignment(PdfAppearance.ALIGN_LEFT);
          
           
           Paragraph p1 = new Paragraph("Thank you for shopping with us...enjoy your day!");
            Paragraph p2 = new Paragraph("Enjoy your day!!!");
            p1.setAlignment(PdfAppearance.ALIGN_CENTER);
            p2.setAlignment(PdfAppearance.ALIGN_CENTER);
            
            document.add(address);
            document.add(table);
            document.add(table1);
            document.add(t);
            document.add(p1);
            document.add(p2);
            document.add(new Paragraph(" "));
            document.add(new Paragraph("******************************************* END OF REPORT ********************************************"));
            document.add(new Paragraph("Generated on: " + new Date().toString()));
           
           session.invalidate();
            document.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(invoiceServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(invoiceServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (DocumentException ex) {
            Logger.getLogger(invoiceServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
