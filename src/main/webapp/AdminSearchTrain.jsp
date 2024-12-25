<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
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
    <meta charset="ISO-8859-1">
    <title>Search Trains</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
   <center> <h2>Search for Trains by Stations</h2></center>

<form action="AdminSearchTrainServlet" method="post">
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