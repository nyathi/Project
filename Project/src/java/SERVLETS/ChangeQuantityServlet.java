/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import POJO.AdminDAO;
import POJO.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Miehleketo
 */
//@WebServlet(name = "ChangeQuantityServlet.do", urlPatterns = {"/ChangeQuantityServlet"})
public class ChangeQuantityServlet extends HttpServlet {

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
        RequestDispatcher dispatcher = null;
        Products products = null;
        HttpSession session=request.getSession();
        double totalPrice = 0.0, vat = 0.0, amtDua = 0.0;
        try {
            AdminDAO myAdmin = new AdminDAO();

            List allItems =(List)request.getAttribute("product");
            List mylist = new ArrayList();
            String id[] = request.getParameterValues("itemID");
             out.println("test 0");
            String strQ = "";
            for (int x = 0; x < id.length; x++) {
                 out.println("test loop");

                strQ = strQ + x + "#";
            }
            for (int x = 0; x < id.length; x++) {
                 out.println("test loop2");
                String[] data = strQ.split("#");
                products = myAdmin.getProduct(Integer.parseInt(id[x]));
                 out.println("test 1");
                                 
                int quantity=Integer.parseInt(request.getParameter(data[x]));
                 out.println("test 2");
                if (myAdmin.changeQuantity(Integer.parseInt(id[x]), quantity) == 1) {
                     out.println("test 3");
                    totalPrice += myAdmin.getPrice(Integer.parseInt(id[x]));
                }
                vat=products.getVat(totalPrice);
                
                amtDua=products.getTotprice(vat, totalPrice);
                
                 mylist.add(products);
                  out.println("test 4");
            }
            vat = totalPrice - 0.14;
            
            request.setAttribute("product", mylist);
            dispatcher = request.getRequestDispatcher("paySlip.jsp?start=0&end=5");
            dispatcher.forward(request, response);

            dispatcher.forward(request, response);
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
