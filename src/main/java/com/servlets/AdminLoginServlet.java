package com.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String username = req.getParameter("uname");
        String password = req.getParameter("pword");

        // Check login credentials (hardcoded for demonstration purposes)
        if ("admin".equals(username) && "admin".equals(password)) {
            // Create a session for the user
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", "admin");

            // Redirect to the admin home page
            res.sendRedirect("AdminHome.jsp");
        } else {
            // Invalid credentials
            req.setAttribute("errorMessage", "Invalid username or password.");
            RequestDispatcher rd = req.getRequestDispatcher("AdminLogin.jsp");
            rd.forward(req, res);
        }
    }
}