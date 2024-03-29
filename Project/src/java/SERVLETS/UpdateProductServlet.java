/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import POJO.AdminDAO;
import POJO.Products;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Student
 */
public class UpdateProductServlet extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
            String butOption = request.getParameter("decision");
             out.println("test 1");
            myAdmin=new AdminDAO();
           out.println("test 2");
                String itemName = request.getParameter("txtItemName");
                out.println("test 3");
                double itemPrice = Double.parseDouble(request.getParameter("txtItemPrice"));
                out.println("test 4");
                int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                out.println("test 5");
                String fruitVeg = "";
                int id = Integer.parseInt(request.getParameter("txtItemCode"));
                out.println("test 6");
                String imagePath = request.getParameter("txtImagePath");
                out.println("test 7");
                
                if(myAdmin.updateProduct(id, itemName, itemPrice, quantity, imagePath)==1)
                {
                    
                    dispatcher = request.getRequestDispatcher("admin.jsp");
                    dispatcher.forward(request, response);
                }
                
            
           
        } catch (Exception ex) {
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
