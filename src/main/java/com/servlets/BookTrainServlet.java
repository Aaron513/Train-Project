package com.servlets;

import com.dao.TicketDAO;
import com.model.Ticket;
import com.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class BookTrainServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
    	String trainNumber = request.getParameter("trainnumber");
        String seatCount = request.getParameter("seats");
        HttpSession existingSession = request.getSession(false);
//      System.out.println(existingSession);
	      if (existingSession == null || existingSession.getAttribute("user") == null) {
	          response.sendRedirect("UserLogin.jsp");
	          return;
	      }
	      User user = (User) existingSession.getAttribute("user");
	        String uname = user.getUName(); // Assuming uname is stored in the session after login
        System.out.println(uname);
        if (uname == null) {
            request.setAttribute("message", "User not logged in. Please log in first.");
            request.setAttribute("messageType", "red");
            RequestDispatcher dispatcher = request.getRequestDispatcher("UserLogin.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Create a Ticket object
        Ticket ticket = new Ticket();
        ticket.setTrainNumber(Long.parseLong(trainNumber));
        ticket.setSeatCount(Integer.parseInt(seatCount));
        ticket.setUname(uname);

        // Call DAO for ticket booking
        TicketDAO ticketDAO = new TicketDAO();
        boolean isBooked = false;
        try {
            isBooked = ticketDAO.bookTicket1(ticket);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set response attributes
        if (isBooked) {
            request.setAttribute("message", "Ticket booked successfully! PNR: " + ticket.getPnr());
            request.setAttribute("messageType", "green");
        } else {
            request.setAttribute("message", "Booking failed. Not enough seats or invalid train number.");
            request.setAttribute("messageType", "red");
        }

        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("BookTicket.jsp");
        dispatcher.forward(request, response);
    }
}