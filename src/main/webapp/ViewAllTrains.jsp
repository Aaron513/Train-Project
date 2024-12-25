<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <meta charset="UTF-8">
    <title>View All Trains</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .styled-table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 18px;
            font-family: Arial, sans-serif;
            width: 80%;
            border: 1px solid #ddd;
            text-align: left;
            margin-left:150px
        }

        .styled-table th, .styled-table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
        }

        .styled-table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        .styled-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .center {
            text-align: center;
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
        <h1 class="hd" align="center">Welcome to Train Ticket Management System</h1>
    </header>

<div class="center">
    <h2>All Trains</h2>
</div>

<%-- Display trains in a table if available --%>
<%
    List<com.model.Train> trainList = (List<com.model.Train>) request.getAttribute("trainList");
    if (trainList != null && !trainList.isEmpty()) {
%>
    <table class="styled-table" align="center">
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
    <div class="center"><p>No trains found!</p></div>
<% } %>

</body>
</html>