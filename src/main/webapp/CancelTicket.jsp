<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cancel Ticket</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<header>
    <div class="navbar">
        <a href="UserHome.jsp">Home</a>
        <a href="ViewAllTrainsServlet">View Trains</a>
        <a href="ViewTicketServlet">Your Tickets</a>
        <a href="SearchTrains.jsp">Search Trains</a>
        <a href="BookTicket.jsp">Book a Ticket</a>
        <a href="UserProfileServlet">Profile</a>
        <a href="CancelTicket.jsp">Cancel Ticket</a>
        <a href="UserLogin.jsp">Logout</a>
    </div>
    <center><h1>Cancel Your Ticket</h1></center>
</header>

<center>
    <form action="CancelTicketServlet" method="post">
        <label for="pnr">Enter PNR Number:</label>
        <input type="text" id="pnr" name="pnr" required>
        <button type="submit">Cancel Ticket</button>
    </form>
</center>

<%
    String message = (String) request.getAttribute("message");
    if (message != null) {
%>
    <div style="color: red; text-align: center;"><%= message %></div>
<%
    }
%>
</body>
</html>