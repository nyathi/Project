/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import MODEL.processProducts;
import POJO.AdminDAO;
import POJO.CustomerRegistrationDAO;
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

/**
 *
 * @author Miehleketo
 */
public class TestForAdminServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Products product = null;
        RequestDispatcher dispatcher = null;
        Products products = null;
        AdminDAO myAdmin = null;
        try {

            String butOption = request.getParameter("decision");
            String buSearch = request.getParameter("radioButtun");
            if (butOption.equals("Update Product")) {
                myAdmin = new AdminDAO();
                List myList = myAdmin.getAllProduct();
                request.setAttribute("allProduct", myList);
                dispatcher = request.getRequestDispatcher("search.jsp?start=0&end=5");
                dispatcher.forward(request, response);
            } else if (butOption.equals("delete Product")) {
                myAdmin = new AdminDAO();
                List myList = myAdmin.getAllProduct();
                request.setAttribute("allProduct", myList);
                dispatcher = request.getRequestDispatcher("deleteProduc.jsp?start=0&end=5");
                dispatcher.forward(request, response);
            }
            else if(butOption.equals("delete Customer"))
            {
                CustomerRegistrationDAO custDAO=new CustomerRegistrationDAO();
                String id=request.getParameter("radioButton");
                if(custDAO.deleteCustomerDetail(id)==1)
                {
                    dispatcher=request.getRequestDispatcher("admin.jsp");
                    dispatcher.forward(request, response);
                }
                   
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TestForAdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TestForAdminServlet.class.getName()).log(Level.SEVERE, null, ex);


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
