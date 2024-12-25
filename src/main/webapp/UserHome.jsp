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
    <title>User Home</title>
    <link rel="stylesheet" href="styles.css">
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
            <a href="CancelTicket.jsp">Cancel Ticket</a>
            <a href="UserLogoutServlet">Logout</a>
        </div>
        <h1 class="hd" align="center">Welcome, <%= user.getFName() %>!</h1>
    </header>
</body>
</html>