<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Completed Tasks</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #F8F9FA;
            color: #333;
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

        .header {
            margin-bottom: 20px;
        }

        .header h1 {
            color: #30475E;
            font-size: 2rem;
            margin-bottom: 1.5rem;
            font-weight: 600;
        }

        .tasks-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .tasks-table th, .tasks-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .tasks-table th {
            background-color: #F9A826;
            color: white;
        }

        .tasks-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .tasks-table tr:hover {
            background-color: #ddd;
        }

        /* Styling for the links in the navbar */
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
        <div class="header">
            <h1>Completed Tasks</h1>
            <p>Below are the tasks you have completed.</p>
        </div>

        <table class="tasks-table">
            <thead>
                <tr>
                    <th>Task ID</th>
                    <th>Task Name</th>
                    <th>Description</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Establish database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/taskmanager", "root", "password");

                        // Fetch completed tasks for the logged-in user
                        int userId = (int) session.getAttribute("id");
                        String query = "SELECT id, task_name, task_description, status FROM tasks WHERE user_id = ? AND status = 'Completed'";
                        stmt = conn.prepareStatement(query);
                        stmt.setInt(1, userId);

                        rs = stmt.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("task_name") %></td>
                    <td><%= rs.getString("task_description") %></td>
                    <td><%= rs.getString("status") %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<p style='color:red;'>Error fetching completed tasks: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
