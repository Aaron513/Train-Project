<%@ page session="true" %>
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<% 
    // Use the session object provided by JSP directly
    if (session == null || session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cancel A Train</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .button {
            background-color: #B2361C;
            border: none;
            border-radius: 1000px;
            color: white;
            padding: 10px 18px;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            margin: 4px 2px;
            opacity: 0.6;
            transition: 0.3s;
            text-decoration: none;
            cursor: pointer;
        }
        .button:hover { opacity: 1; }
    </style>
    <script>
        // Function to display alert
        function showAlert(message) {
            if (message) {
                alert(message);
            }
        }
    </script>
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

<center>
    <div class="tab">
        <h1 class="menu">Hey, Admin! Welcome to the Train Ticket Management System</h1>
        <h2 class="menu">Train Cancellation</h2>
    </div>
</center>

<!-- Form to cancel train -->
<form class="tab" action="AdminCancleTrainServlet" method="post">
    Train Number: <input type="text" name="trainno" required><br/><br/>
    <input type="submit" value="CANCEL TRAIN" class="button">
</form><br/>

<%-- Dynamically display success or error message using script --%>
<script>
    <% 
        String message = (String) request.getAttribute("message");
        String alertMessage = message != null ? message : "";
    %>
    showAlert('<%= alertMessage %>');
</script>
</body>
</html>