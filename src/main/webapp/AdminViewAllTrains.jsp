<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<% 
    // Check if the session exists and the user is an admin
    if (session == null || session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Trains</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .styled-table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 18px;
            font-family: Arial, sans-serif;
            width: 80%;
            border: 1px solid #ddd;
            text-align: left;
            margin-left:160px;
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
        <div class="active">
            <p1 class="menu"><a href="AdminHome.jsp">Home</a></p1>
        </div>
        <div class="home">
            <p1 class="menu"><a href="AdminSearchTrain.jsp">Search Trains</a></p1>
        </div>
        <div class="home">
            <p1 class="menu"><a href="AddTrains.jsp">Add Train</a></p1>
        </div>
        <div class = home>
        	<a href="AdminViewAllTrainsServlet">View Trains</a>
        	
        </div>
        <div class="home">
            <p1 class="menu"><a href="CancelTrain.jsp">Cancel Train</a></p1>
        </div>
        <div class = "home">
        	<a href="AdminAnalysis.jsp">Ticket Selling Analysis</a>
        </div>
        <div class="home">
            <p1 class="menu"><a href="AdminLogoutServlet">Logout</a></p1>
        </div>
    </div>

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