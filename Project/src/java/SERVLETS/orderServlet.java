/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import MODEL.processProducts;
import MODEL.processTransactions;
import POJO.CustomerRigistration;
import POJO.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Student
 */
public class orderServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        RequestDispatcher dispatcher=null;
        
        try {
            List shopCart=(List) session.getAttribute("shopcart");
          List qty=(List) session.getAttribute("quantity");
            processTransactions pt=new processTransactions();
            processProducts pProduct=new processProducts();
            CustomerRigistration cr=(CustomerRigistration) session.getAttribute("userInfo");
            if(cr!=null)
            {
                String idNumber=cr.getCustomer_id();
                String acctType=request.getParameter("acctType");
                String acctNumber=request.getParameter("cardNumber");
                  String bankName=request.getParameter("bankname");
                  if(!idNumber.isEmpty() && !acctType.isEmpty() && !acctNumber.isEmpty() && !bankName.isEmpty())
                  {
                      if(acctType.equalsIgnoreCase("Saving"))
                      {
                          Products prod=null;
                          double total=0;
                          for(int i=0;i<shopCart.size();i++)
                          {
                              prod=(Products) shopCart.get(i);
                              int quantity=((Integer)qty.get(i)).intValue();
                              total+=prod.getItemPrice()*quantity;

                          }
                          
                            
                            String message=pt.payments(idNumber, acctType, acctNumber, bankName, total);
                            if(message!=null)
                            {
                                if(message.equals("Payment was made successful.")) {
                                         for(int i=0;i<shopCart.size();i++)
                                       {
                                           prod=(Products) shopCart.get(i);
                                           int quantity=((Integer)qty.get(i)).intValue();
                                           int newQty=prod.getNumberOfItems()-quantity;
                                           pProduct.updateProduct(prod, newQty);

                                       }
                                         request.setAttribute("mssg", message);
                                         request.setAttribute("email", cr.getEmail());
                                        // response.sendRedirect("success.jsp");
                                         dispatcher=request.getRequestDispatcher("success.jsp");

                                         dispatcher.forward(request, response);
                                 }
                                else
                                {
                                    request.setAttribute("error", message);
                                    dispatcher=request.getRequestDispatcher("transaction_e.jsp");

                                         dispatcher.forward(request, response);
                                }
                            }
                            else
                                {
                                    request.setAttribute("error", "Please enter account numbe.");
                                    dispatcher=request.getRequestDispatcher("transaction_e.jsp");

                                         dispatcher.forward(request, response);
                                }
                      }
                      else if(acctType.equalsIgnoreCase("Cheque"))
                      {
                          Products prod=null;
                          double total=0;
                          for(int i=0;i<shopCart.size();i++)
                          {
                              prod=(Products) shopCart.get(i);
                              int quantity=((Integer)qty.get(i)).intValue();
                              total+=prod.getItemPrice()*quantity;

                          }
                          
                            
                            String message=pt.payments(idNumber, acctType, acctNumber, bankName, total);
                            if(message!=null)
                            {
                                if(message.equals("Payment was made successful.")) {
                                         for(int i=0;i<shopCart.size();i++)
                                       {
                                           prod=(Products) shopCart.get(i);
                                           int quantity=((Integer)qty.get(i)).intValue();
                                           int newQty=prod.getNumberOfItems()-quantity;
                                           pProduct.updateProduct(prod, newQty);

                                       }
                                         request.setAttribute("mssg", message);
                                         request.setAttribute("email", cr.getEmail());
                                        // response.sendRedirect("success.jsp");
                                         dispatcher=request.getRequestDispatcher("success.jsp");

                                         dispatcher.forward(request, response);
                                 }
                                else
                                {
                                    request.setAttribute("error", message);
                                    dispatcher=request.getRequestDispatcher("transaction_e.jsp");

                                         dispatcher.forward(request, response);
                                }
                            }
                            else
                                {
                                    request.setAttribute("error", "Please enter account numbe.");
                                    dispatcher=request.getRequestDispatcher("transaction_e.jsp");

                                         dispatcher.forward(request, response);
                                }
                      }
                      else if(acctType.equalsIgnoreCase("Credit card"))
                      {
                          Products prod=null;
                          double total=0;
                          for(int i=0;i<shopCart.size();i++)
                          {
                              prod=(Products) shopCart.get(i);
                              int quantity=((Integer)qty.get(i)).intValue();
                              total+=prod.getItemPrice()*quantity;

                          }
                          
                            
                            String message=pt.payments(idNumber, acctType, acctNumber, bankName, total);
                            if(message!=null)
                            {
                                if(message.equals("Payment was made successful.")) {
                                         for(int i=0;i<shopCart.size();i++)
                                       {
                                           prod=(Products) shopCart.get(i);
                                           int quantity=((Integer)qty.get(i)).intValue();
                                           int newQty=prod.getNumberOfItems()-quantity;
                                           pProduct.updateProduct(prod, newQty);

                                       }
                                         request.setAttribute("mssg", message);
                                         request.setAttribute("email", cr.getEmail());
                                        // response.sendRedirect("success.jsp");
                                         dispatcher=request.getRequestDispatcher("success.jsp");

                                         dispatcher.forward(request, response);
                                 }
                                else
                                {
                                    request.setAttribute("error", message);
                                    dispatcher=request.getRequestDispatcher("transaction_e.jsp");

                                         dispatcher.forward(request, response);
                                }
                            }
                            else
                                {
                                    request.setAttribute("error", "Please enter account number.");
                                    dispatcher=request.getRequestDispatcher("transaction_e.jsp");

                                         dispatcher.forward(request, response);
                                }
                      }
                      else if(acctType.equalsIgnoreCase("---"))
                      {
                           request.setAttribute("error", "Please select account type.");
                           dispatcher=request.getRequestDispatcher("transaction_e.jsp");

                          dispatcher.forward(request, response);
                      }
                  }
                  
            }
        } 
        catch (ClassNotFoundException ex) {
            out.println(ex.getMessage());
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
