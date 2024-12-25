package com.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminLogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Invalidate the session
        HttpSession session = req.getSession(false); // Don't create a new session if it doesn't exist
        if (session != null) {
            session.invalidate(); // Invalidate the session
        }

        // Redirect to login page
        res.sendRedirect("AdminLogin.jsp");
    }
}