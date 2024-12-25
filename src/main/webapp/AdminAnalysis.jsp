<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% 
    // Check if the session exists and the user is an admin
    if (session == null || session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Selling Analysis</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        header {
            background-color: white;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .navbar {
            display: flex;
            justify-content: center;
            background-color: #007bff;
            padding: 10px 0;
        }
        .navbar .menu {
            margin: 0 15px;
        }
        .navbar a {
            text-decoration: none;
            color: white;
            font-size: 16px;
        }
        .navbar a:hover {
            text-decoration: underline;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            text-align: center;
        }
        #ticketChart {
            max-width: 100%;
            max-height: 300px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<header>

    <div class="navbar">
        <div class="menu"><a href="AdminHome.jsp">Home</a></div>
        <div class="menu"><a href="AdminSearchTrain.jsp">Search Trains</a></div>
        <div class="menu"><a href="AddTrains.jsp">Add Train</a></div>
        <div class="menu"><a href="AdminViewAllTrainsServlet">View Trains</a></div>
        <div class="menu"><a href="CancelTrain.jsp">Cancel Train</a></div>
        <div class="menu"><a href="AdminAnalysis.jsp">Ticket Selling Analysis</a></div>
        <div class="menu"><a href="AdminLogoutServlet">Logout</a></div>
    </div>
</header>
<div class="container">
    <h2>Ticket Selling Analysis</h2>
    <canvas id="ticketChart"></canvas>
</div>
<script>
    // Fetch data from the servlet and render the chart
    fetch('TicketSellingAnalysisServlet')
        .then(response => {
            if (!response.ok) {
                throw new Error('Failed to fetch data from the server');
            }
            return response.json();
        })
        .then(data => {
            const labels = data.trainData.map(item => item.trainName);
            const ticketCounts = data.trainData.map(item => item.ticketCount);

            const ctx = document.getElementById('ticketChart').getContext('2d');
            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Tickets Sold',
                        data: ticketCounts,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            callbacks: {
                                label: function(tooltipItem) {
                                    return tooltipItem.label + ': ' + tooltipItem.raw + ' tickets';
                                }
                            }
                        }
                    }
                }
            });
        })
        .catch(error => {
            console.error('Error fetching data:', error);
            alert('Failed to load ticket analysis data. Please try again later.');
        });
</script>
</body>
</html>
