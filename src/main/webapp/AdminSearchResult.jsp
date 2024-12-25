<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ page import="java.util.*" %>
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