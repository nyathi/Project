/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import MODEL.processLogin;
import MODEL.processProducts;
import POJO.CustomerRigistration;
import POJO.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String username=request.getParameter("username");
            String pass=request.getParameter("password");
            String decision=request.getParameter("decision");
            processLogin pLogin=new processLogin();
            RequestDispatcher dispatcher=null;
            HttpSession session=request.getSession(true);
             processProducts pProduct=new processProducts();
           
            if(decision.equalsIgnoreCase("Login"))
            {
               String role=pLogin.loginAuthentication(username, pass);
               if(role!=null)
               {
                if(role.equalsIgnoreCase("User"))
                {
                    
                    ArrayList<Products> allItems=pProduct.getVegaAndFruits();
                    session.setAttribute("items", allItems);
                    ArrayList<Products> all=pProduct.getLiveStocks();
                    session.setAttribute("livestock", all);
                    session.setAttribute("Role", role);
                    CustomerRigistration cr=pLogin.getUserInfo(pLogin.getUserIDNumber(username, pass));
                    //dispatcher=request.getRequestDispatcher("customer.jsp?start=0&end=5");
                   // dispatcher.forward(session, response);
                    
                    session.setAttribute("userInfo", cr);
                    response.sendRedirect("customer.jsp?start=0&end=5");
                }else if(role.equalsIgnoreCase("Admin"))
                {
                    session.setAttribute("Role", role);
                    response.sendRedirect("admin.jsp");
                }
                else
                {
                    session.setAttribute("login_error", "Invalid username or password.");
                    dispatcher=request.getRequestDispatcher("login_e.jsp");
                    dispatcher.forward(request, response);
                }
               }
               else
                {
                    session.setAttribute("login_error", "Invalid username or password.");
                    dispatcher=request.getRequestDispatcher("login_e.jsp");
                    dispatcher.forward(request, response);
                }
               
            }
            else
            {
                
            }
            
        } catch (ClassNotFoundException ex) {
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
        
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //processRequest(request, response);
            HttpSession session=request.getSession(true);
                 processProducts pProduct=new processProducts();
                 
                 ArrayList<Products> allItems=pProduct.getVegaAndFruits();
            session.setAttribute("items", allItems);
                ArrayList<Products> liveStck=pProduct.getLiveStocks();
                        session.setAttribute("livestock", liveStck);
                        response.sendRedirect("cLiveStock.jsp?start=0&end=5");
        } catch (ClassNotFoundException ex) {
            out.println(ex.getMessage());
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        }
        
    }

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
