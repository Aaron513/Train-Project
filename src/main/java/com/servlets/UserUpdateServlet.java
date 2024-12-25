package com.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.dao.UserDAO;
import com.model.User;

@WebServlet("/userupdate")
public class UserUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        
        

        String uName = req.getParameter("uname");
        String pWord = req.getParameter("pword");
        String fName = req.getParameter("firstname");
        String lName = req.getParameter("lastname");
        String addr = req.getParameter("address");
        long phNo = Long.parseLong(req.getParameter("phoneno"));
        String mailId = req.getParameter("mailid");

        User user = new User();
        user.setUName(uName);
        user.setPWord(pWord != null && !pWord.isEmpty() ? pWord : "default_password"); // Handle null password
        user.setFName(fName);
        user.setLName(lName);
        user.setAddr(addr);
        user.setPhNo(phNo);
        user.setMailId(mailId);

        boolean result = UserDAO.updateUser(user);

        if (result) {
            req.setAttribute("alertMessage", "User Profile Updated Successfully!");
            req.setAttribute("alertType", "success");
//            res.sendRedirect("UserProfile.jsp");
        } else {
            req.setAttribute("alertMessage", "Error occurred during Updation.");
            req.setAttribute("alertType", "error");
        }
        
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        res.sendRedirect("UserLogin.jsp");
//        RequestDispatcher rd = req.getRequestDispatcher("updateProfile.jsp");
//        rd.forward(req, res);
        
        
    }
}
