<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ page import="com.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Ticket" %>
<%
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
    <title>View Ticket</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            text-align: center; /* Ensures content is centered */
        }
        header {
            background-color: white;
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
            color: black;
            text-align: center;
            margin-top: 20px;
        }
        table {
            margin: 20px auto; /* Center the table horizontally */
            border-collapse: collapse;
            width: 40%; /* Can adjust this value based on your needs */
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
            background-color: white;
            color: black;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
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
</header>
<h1 class="hd" align="center">Train Ticket Management System</h1>
<div class="main">
    <center><h2>View Your Ticket</h2></center>

    <%
    List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");
    if (tickets != null && !tickets.isEmpty()) {
%>
        <table border="1">
            <thead>
                <tr>
                    <th>PNR</th>
                    <th>Train Number</th>
                    <th>Train Name</th>
                    <th>From</th>
                    <th>To</th>
                    <th>Seats</th>
                </tr>
            </thead>
            <tbody>
                <% for (Ticket ticket : tickets) { %>
                    <tr>
                        <td><%= ticket.getPnr() %></td>
                        <td><%= ticket.getTrainNumber() %></td>
                        <td><%= ticket.getTrainName() %></td>
                        <td><%= ticket.getFromStation() %></td>
                        <td><%= ticket.getToStation() %></td>
                        <td><%= ticket.getSeatCount() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
<%
    } else {
%>
        <p>No tickets found.</p>
<%
    }
%>
</div>
</body>
</html>
