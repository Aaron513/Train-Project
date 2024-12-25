package com.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.UserDAO;
import com.model.User;

public class UserRegServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();

        String uName = req.getParameter("uname");
        String pWord = req.getParameter("pword");
        String fName = req.getParameter("firstname");
        String lName = req.getParameter("lastname");
        String addr = req.getParameter("address");
        long phNo = Long.parseLong(req.getParameter("phoneno"));
        String mailId = req.getParameter("mailid");

        User user = new User();
        user.setUName(uName);
        user.setPWord(pWord);
        user.setFName(fName);
        user.setLName(lName);
        user.setAddr(addr);
        user.setPhNo(phNo);
        user.setMailId(mailId);

        UserDAO userDAO = new UserDAO();
        boolean result = userDAO.registerUser(user);

        if (result) {
            req.setAttribute("alertMessage", "User Registered Successfully!");
            req.setAttribute("alertType", "success"); // Success message type
        } else {
            req.setAttribute("alertMessage", "Error occurred during registration.");
            req.setAttribute("alertType", "error"); // Error message type
        }

        RequestDispatcher rd = req.getRequestDispatcher("UserRegister.jsp");
        rd.forward(req, res);
    }
}