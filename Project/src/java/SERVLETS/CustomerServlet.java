/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import POJO.CustomerRegistrationDAO;
import POJO.CustomerRigistration;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Student
 */
public class CustomerServlet extends HttpServlet {

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

        String customer_id = request.getParameter("txtIDNumber");

        String name = request.getParameter("txtName");
        String telephone = request.getParameter("txtContact");
        String email = request.getParameter("email");
        String gender = request.getParameter("sex");
        String address = request.getParameter("address");
        String surname = request.getParameter("txtSurname");
        String password = request.getParameter("txtPassword");
        String password2=request.getParameter("txtPassword2");
        CustomerRigistration cust=null;
       RequestDispatcher dispatch=null;
        try {
            StringBuffer message=validateGender(customer_id, name, email, surname, password, password2,telephone);
            if(message.toString().isEmpty())
            {
                cust=new CustomerRigistration(customer_id, name+" "+surname, telephone, email, gender, address, email, password);
                CustomerRegistrationDAO dao=new CustomerRegistrationDAO();
                if(dao.userExists(customer_id)==false)
                {
                    if(dao.insertCustomerReg(cust)==1)
                    {

                      dispatch=request.getRequestDispatcher("registerSucess.jsp");
                      dispatch.forward(request, response);
                         //out.print("not saved");


                    }
                    else
                    {
                         out.print("not saved");
                    }
                }else if(dao.userExists(customer_id)==true)
                {
                    request.setAttribute("reg_Error","Id number already exist.");
                    dispatch=request.getRequestDispatcher("signup_e.jsp");
                      dispatch.forward(request, response);
                }
            }
            else
            {
                 request.setAttribute("reg_Error",message);
                    dispatch=request.getRequestDispatcher("signup_e.jsp");
                      dispatch.forward(request, response);
            }
       
        } catch (Exception ex) {
           out.print(ex.getMessage());
        }
    }

    
     public StringBuffer validateGender(String id,String name ,String email,String surname,String pass1,String pass,String address)
    {
        boolean validIDnumber=false;

        StringBuffer stb=new StringBuffer();

       
        if(name.isEmpty())
        {
            stb.append("Please enter name!\n");
            stb.append("\n");
        }
        if(name.isEmpty())
        {
            stb.append("Please enter surname!");
             stb.append("\n");
        }
        
        
         if(address.isEmpty())
        {
            stb.append("Address is empty..");
            stb.append("\n");
        }
         Pattern p=Pattern.compile("[a-zA-Z0-9\\_\\-]*@[a-zA-Z0-9\\-]*.[a-zA-Z0-9\\-\\.]*");
          Matcher m=p.matcher(email);
          boolean b=m.matches();
          if(b!=true)
          {
              stb.append("Invalid email\n");
            stb.append("\n");
          }
        if(id.length()!=13)
        {
            stb.append("ID number must contain numeric..");
            stb.append("\n");
        }

        if(validIDnumber)
        {
            stb.append("ID number must be digits and 13 digits in length\n");
             stb.append("\n");
        }
        
        if(pass.isEmpty() && pass1.isEmpty())
        {
            stb.append("Please enter password!");
                stb.append("\n");
        }
        else
        {
            if(!pass1.equals(pass))
            {
                stb.append("Password does not match!");
                stb.append("\n");
            }
            
        }
        

        
        return stb;
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
