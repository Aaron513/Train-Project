<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Admin Home</title>
    <link rel="stylesheet" href="styles.css">
    <style>
         
        .button {
            background-color: blue;
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

        .button:hover {
            opacity: 10;
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
            <p1 class="menu"><a href="CancleTrain.jsp">Cancel Train</a></p1>
        </div>
        <div class = home>
        	<a href="AdminAnalysis.jsp">Ticket Selling Analysis</a>
        	
        </div>
        
        <div class="home">
            <p1 class="menu"><a href="AdminLogoutServlet">Logout</a></p1>
        </div>
    </div>
    <center>
        <div class="tab" style="margin-top:300px;">
            <h1 class="hd">Welcome To Train Ticket Management System !!!<br/></h1>
        </div>
    </center>
</header>
</body>
</html>