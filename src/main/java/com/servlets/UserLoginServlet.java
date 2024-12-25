package com.servlets;

import com.dao.UserDAO;
import com.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class UserLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String pword = request.getParameter("pword");
        

        User user = UserDAO.authenticateUser(uname, pword);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("UserHome.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid Username or Password");
            RequestDispatcher dispatcher = request.getRequestDispatcher("UserLogin.jsp");
            dispatcher.forward(request, response);
        }
    }
}