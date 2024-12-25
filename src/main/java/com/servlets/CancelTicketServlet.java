package com.servlets;

import com.dao.TicketDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CancelTicketServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pnr = request.getParameter("pnr");
        TicketDAO ticketDAO = new TicketDAO();

        try {
            boolean isCancelled = ticketDAO.cancelTicket(pnr);
            if (isCancelled) {
                request.setAttribute("message", "Ticket with PNR " + pnr + " has been successfully cancelled.");
            } else {
                request.setAttribute("message", "No ticket found with PNR " + pnr + ".");
            }
        } catch (Exception e) {
            request.setAttribute("message", "An error occurred while cancelling the ticket. Please try again.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("CancelTicket.jsp");
        dispatcher.forward(request, response);
    }
}