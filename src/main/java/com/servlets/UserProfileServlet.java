package com.servlets;

import com.dao.UserDAO;
import com.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UserProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        
        // Retrieve the current session, but don't create a new one if it doesn't exist
        HttpSession session = req.getSession(false);

        // Check if there is an active session and if the "user" attribute is available in the session
        if (session != null && session.getAttribute("user") != null) {
            // Get the "user" attribute from the session
            User user = (User) session.getAttribute("user");
            
            // Set the user data to the request scope so it can be accessed in the JSP
            req.setAttribute("user", user);
            
            // Forward the request to the UserProfile.jsp page
            RequestDispatcher rd = req.getRequestDispatcher("UserProfile.jsp");
            rd.forward(req, res);
        } else {
            // If no user is logged in, redirect to the login page with a message
            req.setAttribute("message", "Please login first!");
            RequestDispatcher rd = req.getRequestDispatcher("UserLogin.jsp");
            rd.forward(req, res);
        }
    }
}