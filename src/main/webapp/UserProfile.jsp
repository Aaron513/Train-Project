<%@ page contentType="text/html;charset=ISO-8859-1" language="java"%>
<%@ page import="com.model.User"%>
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
<title>User Profile</title>
<link rel="stylesheet" href="styles.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
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

.profile-container {
	width: 60%;
	margin: 20px auto;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.profile-details {
	width: 100%;
	margin-top: 20px;
	border-collapse: collapse;
}

.profile-details table {
	width: 100%;
	border: 1px solid #ddd;
	border-radius: 8px;
	overflow: hidden;
}

.profile-details th, .profile-details td {
	padding: 12px 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.profile-details th {
	background-color: #4CAF50;
	color: white;
}

.profile-details td {
	background-color: #f9f9f9;
}

.profile-details tr:hover td {
	background-color: #f1f1f1;
}

.message {
	color: red;
	margin-top: 20px;
	text-align: center;
	font-weight: bold;
}

h2 {
	text-align: center;
	color: #333;
}

footer {
	text-align: center;
	padding: 20px;
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>
	<header>
		<div class="navbar">
			<a href="UserHome.jsp">Home</a> <a href="ViewAllTrainsServlet">View
				Trains</a> <a href="ViewTicket.jsp">Your Tickets</a> <a
				href="SearchTrains.jsp">Search Trains</a> <a href="BookTicket.jsp">Book
				a Ticket</a> <a href="UserProfileServlet">Profile</a> <a
				href="CancelTicket.jsp">Cancel Ticket</a> <a href="UserLogin.jsp">Logout</a>
		</div>
		<h1 class="hd" align="center">Welcome to Train Ticket Management
			System</h1>
	</header>

	<div class="profile-container">
		<center>
			<h2>User Profile</h2>
		</center>

		<%-- Display message if there is any --%>
		<% String message = (String) request.getAttribute("message"); %>
		<% if (message != null) { %>
		<div class="message"><%= message %></div>
		<% } %>

		<%-- Display User Details --%>
		<div class="profile-details">
			<table>
				<tr>
					<th>Username</th>
					<td><%= user.getUName() %></td>
				</tr>
				<tr>
					<th>First Name</th>
					<td><%= user.getFName() %></td>
				</tr>
				<tr>
					<th>Last Name</th>
					<td><%= user.getLName() %></td>
				</tr>
				<tr>
					<th>Address</th>
					<td><%= user.getAddr() %></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><%= user.getMailId() %></td>
				</tr>
				<tr>
					<th>Phone Number</th>
					<td><%= user.getPhNo() %></td>
				</tr>
			</table>
		</div>
		<div align="center" style="margin-top: 10px; color:white">
			<button
				style="align-items: center; height: 40px; background-color: #5cb85c; color: #fff; padding: 10px; border: none; border-radius: 5px; cursor: pointer;">
				<a href="updateProfile.jsp" style="text-decoration-line: none; color:white">Update</a>
			</button>
		</div>
	</div>

</body>
</html>