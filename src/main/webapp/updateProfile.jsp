<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ page import="com.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Profile</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .navbar {
            background: linear-gradient(90deg, #4CAF50, #2E8B57);
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar .brand {
            font-size: 24px;
            font-weight: bold;
            color: white;
            text-decoration: none;
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

        .navbar a.active {
            background-color: rgba(255, 255, 255, 0.4);
            font-weight: bold;
        }

        form {
            width: 30%;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffff;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"], input[type="password"], input[type="number"], input[type="email"] {
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
        // Check if there's a message to show
        <%
            String alertMessage = (String) request.getAttribute("alertMessage");
            String alertType = (String) request.getAttribute("alertType");
            if (alertMessage != null && alertType != null) {
        %>
            // Show the alert message using JavaScript
            alert("<%= alertMessage %>");
        <%
            }
        %>
    </script>

    <script>
        function validateForm() {
            // Get form inputs
            var uname = document.forms["registrationForm"]["uname"].value;
            var pword = document.forms["registrationForm"]["pword"].value;
            var firstname = document.forms["registrationForm"]["firstname"].value;
            var lastname = document.forms["registrationForm"]["lastname"].value;
            var phoneno = document.forms["registrationForm"]["phoneno"].value;
            var email = document.forms["registrationForm"]["mailid"].value;

            // Validate Username (3-20 chars, alphanumeric, no spaces)
            var unameRegex = /^[a-zA-Z0-9_]{3,20}$/;
            if (!uname.match(unameRegex)) {
                alert("Username must be between 3-20 characters, alphanumeric and no spaces.");
                return false;
            }

            // Validate Password (at least 8 chars, with one uppercase, one number, and one special character)
            var pwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            if (!pword.match(pwordRegex)) {
                alert("Password must be at least 8 characters, with one uppercase, one number, and one special character.");
                return false;
            }

            // Validate First Name (only letters, no numbers or special characters)
            var nameRegex = /^[A-Za-z]+$/;
            if (!firstname.match(nameRegex)) {
                alert("First Name must contain only letters.");
                return false;
            }

            // Validate Last Name (only letters, no numbers or special characters)
            if (!lastname.match(nameRegex)) {
                alert("Last Name must contain only letters.");
                return false;
            }

            // Validate Phone Number (10 digits, optional hyphen or space)
            var phoneRegex = /^[0-9]{10}$/;
            if (!phoneno.match(phoneRegex)) {
                alert("Phone number must be 10 digits.");
                return false;
            }

            // Validate Email (standard email format)
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!email.match(emailRegex)) {
                alert("Please enter a valid email address.");
                return false;
            }

            // If all validations pass, return true
            return true;
        }
    </script>

</head>
<%
    // Check session and avoid duplicate variable declarations
    HttpSession existingSession = request.getSession(false);
    if (existingSession == null || existingSession.getAttribute("user") == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }
    User user = (User) existingSession.getAttribute("user");
%>
<header>
        <nav class = "navbar">
            <a href="UserHome.jsp">Home</a>
            <a href="ViewAllTrainsServlet">View Trains</a>
            <a href="ViewTicketServlet">Your Tickets</a>
            <a href="SearchTrains.jsp">Search Trains</a>
            <a href="BookTicket.jsp">Book a Ticket</a>
            <a href="UserProfileServlet">Profile</a>
            <a href="CancelTicket.jsp">Cancel Ticket</a>
            <a href="UserLogin.jsp">Logout</a>
        </nav>
        <h1 align = "center">Update Your Details</h1>
    </header>

    <form name="registrationForm" action="userupdate" method="post">
        Username: <input disabled type="text" name="uname1" value="<%= user.getUName() %>">
        <input type="hidden" name="uname" value="<%= user.getUName() %>"><br/>
        New Password: <input type="password" name="pword" required><br/>
        First Name: <input type="text" name="firstname" value="<%= user.getFName() %>"><br/>
        Last Name: <input type="text" name="lastname" value="<%= user.getLName() %>"><br/>
        Address: <input type="text" name="address" value="<%= user.getAddr() %>"><br/>
        Phone No: <input type="text" name="phoneno" value="<%= user.getPhNo() %>"><br/>
        Email: <input type="email" name="mailid" value="<%= user.getMailId() %>"><br/>
        <input type="submit" value="Update Profile">
    </form>
</body>
</html>

