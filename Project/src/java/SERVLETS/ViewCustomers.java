/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import POJO.AdminDAO;
import POJO.CustomerRegistrationDAO;
import POJO.CustomerRigistration;
import POJO.Products;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ViewCustomers extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
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
        CustomerRegistrationDAO dao=null;
        HttpSession session=request.getSession();
        CustomerRigistration customer=null;
        try {
           
           dao=new CustomerRegistrationDAO();
           ArrayList<CustomerRigistration> all=dao.getAllUser();
           session.setAttribute("customers", all);
           response.sendRedirect("viewAllCustomer.jsp");
           //dispatcher=request.getRequestDispatcher("viewCustomer.jsp");
          // dispatcher.forward(request, response);
           
           /*ArrayList<CustomerRigistration> all=dao.getAllUser();
            for(int i=0;i<all.size();i++)
            {
                CustomerRigistration c=all.get(i);
                out.print(c.getName());
            }*/

        } catch (Exception ex) {
            Logger.getLogger(productServlet.class.getName()).log(Level.SEVERE, null, ex);
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
