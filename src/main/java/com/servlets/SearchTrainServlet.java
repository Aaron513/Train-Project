package com.servlets;

import com.dao.TrainDAO;
import com.model.Train;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class SearchTrainServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        
        // Retrieve input values
        String fromStation = req.getParameter("fromStation");
        String toStation = req.getParameter("toStation");
        
        TrainDAO trainDAO = new TrainDAO();
        List<Train> trains = trainDAO.getTrainsByStations(fromStation, toStation);
        
        if (trains == null || trains.isEmpty()) {
            req.setAttribute("message", "No trains found for the specified route!");
            RequestDispatcher rd = req.getRequestDispatcher("SearchTrains.jsp");
            rd.forward(req, res);
        } else {
            req.setAttribute("trainList", trains);
            RequestDispatcher rd = req.getRequestDispatcher("SearchResult.jsp");
            rd.forward(req, res);
        }
    }
}