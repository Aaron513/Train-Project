package com.servlets;

import com.dao.TrainDAO;
import com.model.Train;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ViewAllTrainsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TrainDAO trainDAO = new TrainDAO();
        List<Train> trainList = trainDAO.getAllTrains();

        if (trainList == null || trainList.isEmpty()) {
            req.setAttribute("message", "No trains found.");
        } else {
            req.setAttribute("trainList", trainList);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("ViewAllTrains.jsp");
        dispatcher.forward(req, resp);
    }
}