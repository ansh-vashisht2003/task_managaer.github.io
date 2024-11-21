<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Taskify</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #F8F9FA;
        }

        /* Navbar Styling */
        nav {
            background-color: #30475E;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        nav .logo {
            font-size: 1.8rem;
            font-weight: 600;
            color: #F9A826;
        }
        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            gap: 1.5rem;
        }
        nav ul li {
            display: inline;
        }
        nav ul li a {
            text-decoration: none;
            color: #F8F9FA;
            font-weight: 400;
            padding: 0.5rem 1rem;
            transition: background-color 0.3s ease, border-radius 0.3s ease;
        }
        nav ul li a:hover {
            background-color: #F9A826;
            border-radius: 5px;
        }

        /* Main content styling */
        .container {
            margin: 2rem auto;
            max-width: 900px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            text-align: center;
        }

        h1 {
            color: #30475E;
            font-size: 2rem;
            margin-bottom: 1.5rem;
            font-weight: 600;
        }

        p {
            color: #555;
            line-height: 1.7;
            font-size: 1rem;
            margin-bottom: 1rem;
            text-align: left;
        }

        ul {
            text-align: left;
            margin-top: 1rem;
            color: #555;
            padding-left: 20px;
        }

        ul li {
            margin-bottom: 0.5rem;
            font-size: 1rem;
            list-style: disc;
        }

        ul li strong {
            color: #30475E;
            font-weight: 500;
        }

        .cta-text {
            font-size: 1.1rem;
            color: #F9A826;
            margin-top: 2rem;
            font-weight: 600;
        }

        /* Styling for improved spacing and readability */
        .container p,
        .container ul {
            margin-top: 1.5rem;
        }

        .container ul li {
            padding-left: 15px;
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">Taskify</div>
        <ul>
            <li><a href="dashboard.jsp">Home</a></li>
            <li><a href="task.jsp">Tasks</a></li>
            <li><a href="done.jsp">Tasks Completed</a></li>
            <li><a href="../index.jsp">Logout</a></li>
        </ul>
    </nav>

    <div class="container">
        <h1>Your Dashboard</h1>
        <p>
            Welcome to your personal Taskify dashboard. Here, you can view your tasks, check completed tasks, 
            and manage your responsibilities efficiently. The dashboard is designed to provide a seamless experience 
            so that you can focus on your work without distractions.
        </p>
        <p>
            Use the navigation bar above to explore the following sections:
        </p>
        <ul>
            <li><strong>Home:</strong> This is the main page where you can find an overview of your activities.</li>
            <li><strong>Tasks:</strong> Navigate to the Tasks page to view and manage your assigned tasks.</li>
            <li><strong>Done Tasks:</strong> Check your completed tasks and review your progress.</li>
        </ul>
        <p class="cta-text">
            Thank you for using Taskify! We're here to help you stay organized and productive every day.
        </p>
    </div>
</body>
</html>
