<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>ADMIN LOGIN</title>
    <link rel="stylesheet" href="styles.css">
    <style>
	
    </style>
</head>
<body>
    <div class="navbar">
        <a href="UserLogin.jsp" class="brand">Train Ticket Management</a>
        <div>
            <a href="UserLogin.jsp" class="active">Customer Login</a>
            <a href="UserRegister.jsp" class="active">Register</a>
        </div>
    </div>
<header>
<!-- 

    <div class="main">
        <p1 class="menu"><a href="UserLogin.jsp">Login as User</a></p1>
        <p1 class="menu"><a href="UserRegister.jsp">New User</a></p1>
        <p1 class="menu"><a href="AdminLogin.jsp">Login as Admin</a></p1>
    </div>
 -->

</header>

<!--<div class="tab green">Admin Login</div>-->

<form action="AdminLoginServlet" class="tab brown" method="post">
<h1 align="center">Admin Login</h1>
    <br/>User Name: <input type="text" name="uname"><br/><br/>
    Password: <input type="password" name="pword"><br/><br/>
    <input type="submit" value=" LOGIN " class="button"><br/>
</form>
<br/>
</body>
</html>