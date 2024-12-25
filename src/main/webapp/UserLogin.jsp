<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Login</title>
    <link rel="stylesheet" href="styles.css">
    <script>
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            alert("<%= errorMessage %>");
        <%
            }
        %>
    </script>
</head>
<header>
<div class="navbar">
        <a href="UserLogin.jsp" class="brand">Train Ticket Management</a>
        <div>
            <a href="AdminLogin.jsp" class="active">Admin Login</a>
            <a href="UserRegister.jsp" class="active">Register</a>
        </div>
    </div>

</header>


<body>
    <center><h1>User Login</h1></center>
    <form action="userlogin" method="post">
        Username: <input type="text" name="uname"><br/>
        Password: <input type="password" name="pword"><br/>
        <input type="submit" value="Login">
    </form>
</body>
</html>