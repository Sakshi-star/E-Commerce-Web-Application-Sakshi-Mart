package com.learn.mycart.servlets;

import com.learn.mycart.entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.learn.mycart.helper.FactoryProvider;
import jakarta.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
// fetching the data //
            try {
                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userPhone = request.getParameter("user_phone");
                String userAddress = request.getParameter("user_address");

//  validations
                if (userName == null || userName.isEmpty()) {
                    out.println("Name is blank");
                    return;
                }

                if (userEmail == null || userEmail.isEmpty()) {
                    out.println("Email is blank");
                    return;
                }
                if (userPassword == null || userPassword.isEmpty()) {
                    out.println("Password is blank");
                    return;
                }
                if (userPhone == null || userPhone.isEmpty()) {
                    out.println("Phone number is blank");
                    return;
                }
                if (userAddress == null || userAddress.isEmpty()) {
                    out.println("Address is blank");
                    return;
                }
//creating user object to store data
                User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");
                Session hibernateSession = FactoryProvider.getFactory().openSession();
                Transaction tx = hibernateSession.beginTransaction();
                int userId = (int) hibernateSession.save(user);

                tx.commit();
                hibernateSession.close();

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Registration Successful !!  User id is " + userId);
                response.sendRedirect("register.jsp");
                return;

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
