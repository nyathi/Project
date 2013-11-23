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
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Student
 */
public class GetProductServlet extends HttpServlet {

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Products product = null;
        RequestDispatcher dispatcher = null;
        Products products = null;
        try {
            AdminDAO myAdmin = new AdminDAO();

            
            int id = Integer.parseInt(request.getParameter("radioButton"));
            
            products = myAdmin.getProduct(id);
            
            request.setAttribute("product", products);
           
            dispatcher = request.getRequestDispatcher("updateProduct.jsp");
            
            dispatcher.forward(request, response);
        } catch (Exception ex) {
            out.println(ex.getMessage());
        }


    }
}
