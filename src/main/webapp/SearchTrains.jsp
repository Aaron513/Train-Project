<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<!DOCTYPE html>
<%@ page import="com.model.User" %>
<%
    // Check session and avoid duplicate variable declarations
    HttpSession existingSession = request.getSession(false);
    if (existingSession == null || existingSession.getAttribute("user") == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }
    User user = (User) existingSession.getAttribute("user");
%>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Search Trains</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Styling for the button */
.button {
    background-color: Indigo;
    border: none;
    border-radius: 1000px;
    color: white;
    padding: 10px 18px;
    text-align: center;
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 4px 2px;
    opacity: 0.6;
    transition: 0.3s;
    display: inline-block;
    text-decoration: none;
    cursor: pointer;
}

.button:hover { opacity: 1; }

.message {
    color: red;
    font-size: 14px;
    text-align: center;
}

/* Styling for tables */
table {
    width: 50%;
    margin: 20px auto;
    border-collapse: collapse;
}

table td {
    padding: 10px;
}

table tr:nth-child(even) {
    background-color: #f2f2f2;
}

table tr:hover {
    background-color: #ddd;
}

        .button:hover { opacity: 1; }
    </style>
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
            <a href="UserLogoutServlet">Logout</a>
        </div>
        <h1 class="hd" align="center">Train Ticket Management System</h1>
    </header>

<center>
    <h2>Search for Trains by Stations</h2>
</center>

<form action="SearchTrainServlet" method="post">
    <label for="fromStation">From Station:</label>
    <input type="text" id="fromStation" name="fromStation" required>
    
    <label for="toStation">To Station:</label>
    <input type="text" id="toStation" name="toStation" required>
    
    <input type="submit" value="Search Train" class="button">
</form>

<%-- Display message if there is any --%>
<% String message = (String) request.getAttribute("message"); %>
<% if (message != null) { %>
    <div class="message"><%= message %></div>
<% } %>

</body>
</html>