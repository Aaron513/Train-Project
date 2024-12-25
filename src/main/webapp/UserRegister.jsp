<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Registration</title>
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
            var confirmPassword = document.forms["registrationForm"]["confirm_pword"].value;
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
            
            if (pword !== confirmPassword) {
                alert("Passwords do not match. Please re-enter.");
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

<header>
    <div class="navbar">
        <a href="UserLogin.jsp" class="brand">Train Ticket Management</a>
        <div>
            <a href="UserLogin.jsp" class="active">User Login</a>
            <a href="AdminLogin.jsp" class="active">Admin Login</a>
            <a href="UserRegister.jsp" class="active">Register</a>
        </div>
    </div>
</header>

<body>
    <center><h1>Register</h1></center>
    
    <form name="registrationForm" action="userreg" method="post" onsubmit="return validateForm()">
        Username: <input type="text" name="uname" required><br/>
        Password: <input type="password" name="pword" required><br/>
        Confirm Password <input type="password" name="confirm_pword" id="confirm_pword" required>
        First Name: <input type="text" name="firstname" required><br/>
        Last Name: <input type="text" name="lastname" required><br/>
        Address: <input type="text" name="address"><br/>
        Phone No: <input type="text" name="phoneno" required><br/>
        Email: <input type="email" name="mailid" required><br/>
        <input type="submit" value="Register">
    </form>
</body>
</html>