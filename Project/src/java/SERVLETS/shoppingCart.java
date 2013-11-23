/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package SERVLETS;

import POJO.AdminDAO;
import POJO.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
 * @author Miehleketo
 */
public class shoppingCart extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       HttpSession session=request.getSession(true);
       String decision=request.getParameter("decision");
       String[] ids=request.getParameterValues("items");
       RequestDispatcher dispatcher=null;
       if(session!=null)
       {
           List shopCart=(List) session.getAttribute("shopcart");
           List qty=(List) session.getAttribute("quantity");
           if(decision.equalsIgnoreCase("Add to Cart"))
           {
               int id=Integer.parseInt(request.getParameter("itemID"));
                int quantity=Integer.parseInt(request.getParameter("txtQuantity"));
                int q=Integer.parseInt(request.getParameter("itemQty"));
                // out.print("id is" +id+"\nQuantity is "+request.getParameter("txtQuantity"));
                if(shopCart==null)
                {
                    shopCart=new ArrayList();
                    qty=new ArrayList();
                     try {
                         AdminDAO myAdmin = new AdminDAO();
                         Products p=myAdmin.getProduct(id);
                         if(quantity>0 && quantity<=q)
                         {
                            
                            shopCart.add(p);
                            session.setAttribute("shopcart", shopCart);
                            qty.add(quantity);
                            session.setAttribute("quantity", qty);
                            response.sendRedirect("customer.jsp?start=0&end=5");
                         }
                         else if(quantity>0 && quantity>q)
                         {
                             request.setAttribute("qtyMessage","Only "+q+" "+ p.getItemName()+" available .");
                             dispatcher=request.getRequestDispatcher("customer_e.jsp?start=0&end=5");
                             dispatcher.forward(request, response);
                         }
                         else if(quantity<=0)
                         {
                             request.setAttribute("qtyMessage","Quantity cannot be 0 or less than 0.");
                             dispatcher=request.getRequestDispatcher("customer_e.jsp?start=0&end=5");
                             dispatcher.forward(request, response);
                         }
                     } catch (SQLException ex) {
                         out.print(ex.getMessage());
                     }
                }
                else if(shopCart!=null)
                {
                    try {
                         AdminDAO myAdmin = new AdminDAO(); 
                         Products p=myAdmin.getProduct(id);
                          if(quantity>0 && quantity<=q)
                         {
                           
                            shopCart.add(p);
                            session.setAttribute("shopcart", shopCart);
                            qty.add(quantity);
                            session.setAttribute("quantity", qty);
                            response.sendRedirect("customer.jsp?start=0&end=5");
                         }
                         else if(quantity>0 && quantity>q)
                         {
                             request.setAttribute("qtyMessage","Only "+q+" "+ p.getItemName()+" item(s) available .");
                             dispatcher=request.getRequestDispatcher("customer_e.jsp?start=0&end=5");
                             dispatcher.forward(request, response);
                         }
                         else if(quantity<=0)
                         {
                             request.setAttribute("qtyMessage","Quantity cannot be 0 or less than 0.");
                             dispatcher=request.getRequestDispatcher("customer_e.jsp?start=0&end=5");
                             dispatcher.forward(request, response);
                         }
                     } catch (SQLException ex) {
                         out.print(ex.getMessage());
                     }
                }
           }else if(decision.equals("Remove"))
           {
               Products prod=null;
               for(int i=0;i<ids.length;i++)
               {
                   for(int x=0;x<shopCart.size();x++)
                   {
                       prod=(Products)shopCart.get(x);
                       int id=Integer.parseInt(ids[i]);
                       if(id==prod.getId())
                       {
                           shopCart.remove(x);
                           qty.remove(x);
                       }
                   }
               }
               session.setAttribute("shopcart", shopCart);
               session.setAttribute("quantity", qty);
               response.sendRedirect("shoppingCart.jsp");
               
           }
           else
           {
               session.setAttribute("shopcart", shopCart);
               session.setAttribute("quantity", qty);
               response.sendRedirect("shoppingCart.jsp");
           }
           
           
       }
       else
       {
           
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(shoppingCart.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(shoppingCart.class.getName()).log(Level.SEVERE, null, ex);
        }
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
