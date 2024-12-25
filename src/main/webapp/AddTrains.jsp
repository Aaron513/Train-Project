<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Add Trains</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .button {
            background-color: green;
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
            display: inline-block;
            text-decoration: none;
            cursor: pointer;
        }

        .button:hover {
            opacity: 1;
        }

        .navbar {
            background: linear-gradient(90deg, #4CAF50, #2E8B57);
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-size: 16px;
            padding: 8px 12px;
            border-radius: 4px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .navbar a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: scale(1.1);
        }

        form {
            width: 30%;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            height: 40px;
            background-color: #5cb85c;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
    <script>
        // Display success or error alert messages
        function showAlert(message, type) {
            if (message) {
                if (type === 'success') {
                    alert("Success: " + message);
                } else if (type === 'error') {
                    alert("Error: " + message);
                }
            }
        }

        document.addEventListener('DOMContentLoaded', function () {
            <% 
                String successMessage = (String) request.getAttribute("successMessage");
                String errorMessage = (String) request.getAttribute("errorMessage");
            %>
            const successMessage = "<%= successMessage != null ? successMessage : "" %>";
            const errorMessage = "<%= errorMessage != null ? errorMessage : "" %>";

            if (successMessage) {
                showAlert(successMessage, 'success');
            }

            if (errorMessage) {
                showAlert(errorMessage, 'error');
            }
        });

        function validateForm() {
            const trainNo = document.querySelector('input[name="trainno"]').value;
            const availableSeats = document.querySelector('input[name="available"]').value;
            const fare = document.querySelector('input[name="fare"]').value;

            if (!/^[0-9]{6}$/.test(trainNo)) {
                alert("Train Number must be exactly 6 digits.");
                return false;
            }

            if (!/^[1-9][0-9]*$/.test(availableSeats)) {
                alert("Available Seats must be a positive integer.");
                return false;
            }

            if (!/^[0-9]+(\.[0-9]{1,2})?$/.test(fare)) {
                alert("Fare must be a positive number with up to two decimal places.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <header>
        <div class="navbar">
            <a href="AdminHome.jsp">Home</a>
            <a href="AdminSearchTrain.jsp">Search Trains</a>
            <a href="AddTrains.jsp">Add Train</a>
            <a href="CancelTrain.jsp">Cancel Train</a>
            <a href="AdminViewAllTrainsServlet">View Trains</a>
            <a href="AdminAnalysis.jsp">Ticket Selling Analysis</a>
            <a href="UserLogin.jsp">Logout</a>
        </div>
        <center>
            <h1>Train Ticket Management System</h1>
        </center>
    </header>

    <center>
        <h2>Add a New Train</h2>
    </center>
    <form action="AdminAddTrainServlet" method="post" onsubmit="return validateForm()">
        Train Number: <input type="text" name="trainno" required><br><br>
        Train Name: <input type="text" name="trainname" pattern="[A-Za-z ]+" required><br><br>
        From Station: <input type="text" name="fromstation" pattern="[A-Za-z ]+" required><br><br>
        To Station: <input type="text" name="tostation" pattern="[A-Za-z ]+" required><br><br>
        Available Seats: <input type="text" name="available" required><br><br>
        Fare (INR): <input type="text" name="fare" required><br><br>
        <input type="submit" value="ADD TRAIN" class="button">
    </form>
</body>
</html>