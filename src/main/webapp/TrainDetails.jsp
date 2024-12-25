<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Train Details</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to external stylesheet if needed -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            text-align: center; /* Ensures content is centered */
        }
        header {
            background-color: #003366;
            color: white;
            padding: 10px 0;
            text-align: center;
        }
        .navbar {
            background-color: #002244;
            overflow: hidden;
        }
        .navbar .home {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }
        .navbar .home a {
            color: white;
            text-decoration: none;
        }
        .navbar .home:hover {
            background-color: #00509e;
        }
        h1 {
            color: #003366;
            text-align: center;
            margin-top: 20px;
        }
        table {
            margin: 20px auto; /* Center the table horizontally */
            border-collapse: collapse;
            width: 70%; /* Can adjust this value based on your needs */
            background-color: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            display: block; /* Makes the table a block-level element */
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #003366;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .book-btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 12px;
            text-align: center;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
            border-radius: 4px;
        }
        .book-btn:hover {
            background-color: #218838;
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
        <a href="UserLogoutServlet">Logout</a>
    </div>
    <h1 class="hd">Train Ticket Management System</h1>
</header>

<h1>Searched Train Details</h1>

<!-- Centered Table -->
<table align="center">
    <tr>
        <th>Property</th>
        <th>Details</th>
        <th>Action</th>
    </tr>
    <tr>
        <td>Train Name:</td>
        <td>${train.trainName}</td>
        <td rowspan="6">
            <!-- Book Ticket Button -->
            <form action="BookTicketServlet" method="post">
                <input type="hidden" name="trainNumber" value="${train.trainNumber}">
                <input type="hidden" name="trainName" value="${train.trainName}">
                <input type="hidden" name="fromStation" value="${train.fromStation}">
                <input type="hidden" name="toStation" value="${train.toStation}">
                <input type="hidden" name="availableSeats" value="${train.availableSeats}">
                <input type="hidden" name="fare" value="${train.fare}">
                <button type="submit" class="book-btn">Book Ticket</button>
            </form>
        </td>
    </tr>
    <tr>
        <td>Train Number:</td>
        <td>${train.trainNumber}</td>
    </tr>
    <tr>
        <td>From Station:</td>
        <td>${train.fromStation}</td>
    </tr>
    <tr>
        <td>To Station:</td>
        <td>${train.toStation}</td>
    </tr>
    <tr>
        <td>Available Seats:</td>
        <td>${train.availableSeats}</td>
    </tr>
    <tr>
        <td>Fare:</td>
        <td>${train.fare}</td>
    </tr>
</table>

</body>
</html>