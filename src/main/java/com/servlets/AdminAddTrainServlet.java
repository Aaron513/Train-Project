package com.servlets;

import com.dao.TrainDAO;
import com.model.Train;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminAddTrainServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Get parameters from the form
    	HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))) {
            res.sendRedirect("AdminLogin.jsp");
            return;
        }
        long trainNumber = Long.parseLong(req.getParameter("trainno"));
        String trainName = req.getParameter("trainname");
        String fromStation = req.getParameter("fromstation");
        String toStation = req.getParameter("tostation");
        long availableSeats = Long.parseLong(req.getParameter("available"));
        long fare = Long.parseLong(req.getParameter("fare"));

        // Create Train model object
        Train train = new Train();
        train.setTrainNumber(trainNumber);
        train.setTrainName(trainName);
        train.setFromStation(fromStation);
        train.setToStation(toStation);
        train.setAvailableSeats(availableSeats);
        train.setFare(fare);

        // Call the DAO to insert the train
        TrainDAO dao = new TrainDAO();
        boolean isAdded = dao.addTrain(train);

        // Redirect to the appropriate JSP with success/failure message
        if (isAdded) {
            req.setAttribute("successMessage", "Train added successfully!");
        } else {
            req.setAttribute("errorMessage", "Error while adding the train.");
        }

        // Forward request to AddTrains.jsp to show the result
        RequestDispatcher rd = req.getRequestDispatcher("AddTrains.jsp");
        rd.forward(req, res);
    }
}