<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Train Tickets</title>
    <link rel="stylesheet" href="styles.css">
    <style type="text/css">
        /* General Reset */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        /* Navbar */
        .navbar {
            background-color: green;
            overflow: hidden;
            display: flex;
            flex-wrap: wrap;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            font-size: 16px;
            flex: 1;
            text-align: center;
        }

        

        /* Header */
        header {
            text-align: center;
            background-color: white;
            color: white;
            padding: 20px 10px;
        }

        header h1 {
            font-size: 24px;
            margin: 0;
        }

        /* Main Content */
        .main {
            max-width: 90%;
            margin: 20px auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .main h2 {
            text-align: center;
            color: #003366;
            font-size: 22px;
        }

        /* Form */
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        form label {
            font-weight: bold;
            color: #333;
        }

        form input[type="number"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
        }

        form button {
            background-color: green;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }

        form button:hover {
            background-color: #002244;
        }

        /* Table */
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        table td {
            padding: 10px;
            text-align: center;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tr:hover {
            background-color: #ddd;
        }

        /* Button */
        .button {
            background-color: Indigo;
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
            cursor: pointer;
        }

        .button:hover {
            opacity: 1;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar a {
                flex: 1 1 100%;
                text-align: left;
                padding-left: 20px;
            }

            header h1 {
                font-size: 20px;
            }

            .main {
                max-width: 100%;
                padding: 10px;
            }

            form input[type="number"], form button {
                font-size: 14px;
            }

            form button {
                padding: 8px 15px;
            }
        }

        @media (max-width: 480px) {
            header h1 {
                font-size: 18px;
            }

            form input[type="number"], form button {
                font-size: 12px;
            }
        }
         .tab {
        margin-top: 20px;
        text-align: center;
        color:green;
    }

    .tab p1 {
        font-size: 16px;
        padding: 10px;
        border-radius: 5px;
        display: inline-block;
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
</header>
   <center> <h1 class="hd">Train Ticket Management System</h1></center>
<div class="main">
    <h2>Book Your Train Tickets</h2>

    <!-- Display messages -->
    <c:if test="${message != null}">
        <div class="tab">
            <p1 class="${messageType}">${message}</p1>
        </div>
    </c:if>

    <!-- Booking form -->
    <form action="BookTrainServlet" method="post">
        <label for="trainnumber">Train Number:</label>
        <input type="number" id="trainnumber" name="trainnumber" required>
        
        <label for="seats">Seats:</label>
        <input type="number" id="seats" name="seats" required>
        
        <button type="submit">Book Tickets</button>
    </form>
</div>
</body>
</html>