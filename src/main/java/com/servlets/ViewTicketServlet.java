package com.servlets;

import com.dao.TicketDAO;
import com.model.Ticket;
import com.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ViewTicketServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ensure user session is active
        HttpSession existingSession = request.getSession(false);
//        System.out.println(existingSession);
        if (existingSession == null || existingSession.getAttribute("user") == null) {
            response.sendRedirect("UserLogin.jsp");
            return;
        }
        User user = (User) existingSession.getAttribute("user");
        String uname = user.getUName();

        // Fetch tickets for the user
        TicketDAO ticketDAO = new TicketDAO();
        List<Ticket> tickets = ticketDAO.getTicketsByUser(uname);
//        for(Ticket t : tickets) {
//        	System.out.println(t.getPnr());
//        }

        // Pass tickets to JSP
        if (tickets != null && !tickets.isEmpty()) {
            request.setAttribute("tickets", tickets);
            System.out.println("hello");
        } else {
            request.setAttribute("message", "No tickets found for the current user.");
        }

        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewTicket.jsp");
        dispatcher.forward(request, response);
    }
}
