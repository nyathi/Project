/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import MODEL.processProducts;
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

/**
 *
 * @author Student
 */
public class productServlet extends HttpServlet {

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

            processProducts pProduct = new processProducts();
            ArrayList<Products> allItems = pProduct.getVegaAndFruits();
            request.setAttribute("items", allItems);
            dispatcher = request.getRequestDispatcher("sale.jsp?start=0&end=5");
            dispatcher.forward(request, response);

            myAdmin = new AdminDAO();

            if (butOption.equals("Register new Product")) {

                String itemName = request.getParameter("txtItemName");
                double itemPrice = Double.parseDouble(request.getParameter("txtItemPrice"));
                int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                String fruitVeg = "";

                String imagePath = request.getParameter("txtImagePath");
                String radOption = request.getParameter("type");

                if (radOption.equals("Fruit")) {
                    fruitVeg = "Fruit";
                } else if (radOption.equals("Vegetable")) {
                    fruitVeg = "Vegetable";
                } else if (radOption.equals("livestock")) {
                    fruitVeg = "Live stock";
                }
                product = new Products(0, itemName, itemPrice, quantity, fruitVeg, imagePath);

                if (myAdmin.insertProduct(product) == 1) {
                    // out.print("saved");
                    dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);
                } else {
                    out.print("not saved");
                }


            } else if (butOption.equals("Search Product")) {
                // int itemCode = Integer.parseInt(request.getParameter("txtItemCode"));
                myAdmin = new AdminDAO();
                List myList = myAdmin.getAllProduct();
                request.setAttribute("allProduct", myList);
                dispatcher = request.getRequestDispatcher("search.jsp");
                dispatcher.forward(request, response);

            }
            else if(butOption.equals("Delete Product"))
            {
                  myAdmin = new AdminDAO();
                List myList = myAdmin.getAllProduct();
                request.setAttribute("allProduct", myList);
                dispatcher = request.getRequestDispatcher("deleteProduc.jsp");
                dispatcher.forward(request, response);
            }
            /* else if (butOption.equals("get one Product")) {

                int id = Integer.parseInt(request.getParameter("radioButton"));
                products = myAdmin.getProduct(id);
                request.setAttribute("product", products);
                dispatcher = request.getRequestDispatcher("updateProduct.jsp");
                dispatcher.forward(request, response);

            }
            else if(butOption.equals("Update Product"))
            {
                  myAdmin=new AdminDAO();

                String itemName = request.getParameter("txtItemName");
                double itemPrice = Double.parseDouble(request.getParameter("txtItemPrice"));
                int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                String fruitVeg = "";
                int id = Integer.parseInt(request.getParameter("txtItemCode"));
                String imagePath = request.getParameter("txtImagePath");

                if(myAdmin.updateProduct(id, itemName, itemPrice, quantity, imagePath)==1)
                {

                    dispatcher = request.getRequestDispatcher("admin.jsp");
                    dispatcher.forward(request, response);
                }
            }*/
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(productServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
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
