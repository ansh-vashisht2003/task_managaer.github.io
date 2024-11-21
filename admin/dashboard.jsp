<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Taskify</title>
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
        .container {
            margin: 2rem auto;
            max-width: 900px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1);
            padding: 2rem;
        }

        h1 {
            color: #30475E;
            margin-bottom: 1.5rem;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        form input, form textarea, form select, form button {
            padding: 0.8rem;
            font-size: 1rem;
            border-radius: 10px;
            border: 1px solid #ddd;
            outline: none;
            width: 100%;
        }

        form button {
            background-color: #F9A826;
            color: white;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        form button:hover {
            background-color: #30475E;
            transform: scale(1.05);
        }

        .task-table {
            width: 100%;
            margin-top: 2rem;
            border-collapse: collapse;
        }

        .task-table th, .task-table td {
            border: 1px solid #ddd;
            padding: 0.8rem;
            text-align: center;
        }

        .task-table th {
            background-color: #30475E;
            color: white;
        }

        .task-table td {
            background-color: #F8F9FA;
        }

        header{
            background: #30475E;
            color: #F8F9FA;
            text-align: center;
            padding: 5rem 2rem;
            position: relative;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Admin Dashboard</h1>
    </div>
    <nav>
        <div class="logo">Taskify</div>
        <ul>
            <li><a href="dashboard.jsp">Home</a></li>
            <li><a href="../index.jsp">Logout</a></li>
        </ul>
    </nav>

    <div class="container">
        <h1>Assign Tasks</h1>
        <form method="post" action="dashboard.jsp">
            <input type="text" name="task_name" placeholder="Task Name" required>
            <textarea name="task_description" placeholder="Task Description" rows="4" required></textarea>
            <select name="user_id" required>
                <option value="" disabled selected>Select User</option>
                <%
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/taskmanager", "root", "password");

                        String query = "SELECT id, name FROM users";
                        stmt = conn.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                            int userId = rs.getInt("id");
                            String userName = rs.getString("name");
                            out.println("<option value='" + userId + "'>" + userName + "</option>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </select>
            <button type="submit">Assign Task</button>
            <%
                String taskName = request.getParameter("task_name");
                String taskDescription = request.getParameter("task_description");
                String userId = request.getParameter("user_id");

                if (taskName != null && taskDescription != null && userId != null) {
                    try {
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/taskmanager", "root", "password");
                        String insertQuery = "INSERT INTO tasks (task_name, task_description, user_id, status) VALUES (?, ?, ?, 'Pending')";
                        stmt = conn.prepareStatement(insertQuery);
                        stmt.setString(1, taskName);
                        stmt.setString(2, taskDescription);
                        stmt.setString(3, userId);
                        stmt.executeUpdate();
                        out.println("<p style='color: green;'>Task assigned successfully!</p>");
                    } catch (Exception e) {
                        out.println("<p style='color: red;'>An error occurred. Please try again.</p>");
                        e.printStackTrace();
                    } finally {
                        try {
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
        </form>

        <h1>All Tasks</h1>
        <table class="task-table">
            <thead>
                <tr>
                    <th>Task ID</th>
                    <th>Task Name</th>
                    <th>Description</th>
                    <th>Assigned User</th>
                    <th>Status</th>
                     <th>% of Work Done</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/taskmanager", "root", "password");
                        String selectQuery = "SELECT t.id, t.task_name, t.task_description, u.name, t.status, t.done FROM tasks t JOIN users u ON t.user_id = u.id";
                        stmt = conn.prepareStatement(selectQuery);
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                            int taskId = rs.getInt("id");
                            String taskName1 = rs.getString("task_name");
                            String taskDescription1 = rs.getString("task_description");
                            String userName = rs.getString("name");
                            String status = rs.getString("status");
                            int done = rs.getInt("done");
                            out.println("<tr>");
                            out.println("<td>" + taskId + "</td>");
                            out.println("<td>" + taskName1 + "</td>");
                            out.println("<td>" + taskDescription1 + "</td>");
                            out.println("<td>" + userName + "</td>");
                            out.println("<td>" + status + "</td>");
                            out.println("<td>" + done + "%</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
