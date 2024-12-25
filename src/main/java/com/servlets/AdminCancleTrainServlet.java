package com.servlets;

import com.dao.TrainDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminCancleTrainServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Get the train number from the form
    	HttpSession session = req.getSession(false); // false means don't create a new session if one doesn't exist
        if (session == null || session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))) {
            // User is not logged in or not an admin
            res.sendRedirect("AdminLogin.jsp"); // Redirect to login page
            return;
        }

        long trainNumber = Long.parseLong(req.getParameter("trainno"));

        // Create a DAO object to handle the database operation
        TrainDAO dao = new TrainDAO();
        boolean isCancelled = dao.cancelTrain(trainNumber);

        // Set the success or error message based on the result
        if (isCancelled) {
            req.setAttribute("message", "Train number " + trainNumber + " has been successfully cancelled.");
        } else {
            req.setAttribute("message", "Train number " + trainNumber + " is not available.");
        }

        // Forward the request to the JSP
        RequestDispatcher rd = req.getRequestDispatcher("CancelTrain.jsp");
        rd.forward(req, res);
    }
}