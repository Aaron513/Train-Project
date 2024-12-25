package com.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UserLogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("UserLogin.jsp");
    }
}