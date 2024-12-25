<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ page import="java.util.*" %>
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
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Train Details</title>
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
    <h2>Trains for the Selected Route</h2>
</center>

<%-- Retrieve the train list from the request --%>
<%
    List<com.model.Train> trainList = (List<com.model.Train>) request.getAttribute("trainList");
%>

<% if (trainList != null && !trainList.isEmpty()) { %>
    <table border="1" cellpadding="10" cellspacing="0">
        <thead>
            <tr>
                <th>Train Number</th>
                <th>Train Name</th>
                <th>From Station</th>
                <th>To Station</th>
                <th>Available Seats</th>
                <th>Fare (INR)</th>
            </tr>
        </thead>
        <tbody>
            <% for (com.model.Train train : trainList) { %>
                <tr>
                    <td><%= train.getTrainNumber() %></td>
                    <td><%= train.getTrainName() %></td>
                    <td><%= train.getFromStation() %></td>
                    <td><%= train.getToStation() %></td>
                    <td><%= train.getAvailableSeats() %></td>
                    <td><%= train.getFare() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
<% } else { %>
    <div class="message">No trains found!</div>
<% } %>


</body>
</html>