<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Taskify</title>
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
        }padding: 30px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            color: #30475e;
            font-size: 2.5em;
        }

        .header p {
            color: #F9A826;
            font-size: 1.1em;
        }

        .tasks-table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
        }

        .tasks-table th, .tasks-table td {
            padding: 15px;
            text-align: left;
            font-size: 1.1em;
        }

        .tasks-table th {
            background-color: #F9A826;
            color: white;
            text-transform: uppercase;
        }

        .tasks-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .tasks-table tr:hover {
            background-color: #f1f1f1;
        }

        .tasks-table td input[type="number"] {
            width: 80px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 1em;
            margin-right: 10px;
        }

        .tasks-table td input[type="submit"] {
            background-color: #F9A826;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease;
        }

        .tasks-table td input[type="submit"]:hover {
            background-color: #e78b22;
        }

        .tasks-table td form {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .actions {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }

        .tasks-table td {
            text-align: center;
        }

        .tasks-table td input[type="number"]:focus {
            outline: none;
            border-color: #F9A826;
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
            <h1>Welcome, <%= session.getAttribute("name") %></h1>
            <p>Your tasks for today</p>
        </div>

        <table class="tasks-table">
            <thead>
                <tr>
                    <th>Task ID</th>
                    <th>Task Name</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Progress (%)</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    PreparedStatement updateStmt = null;

                    try {
                        // Establish database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/taskmanager", "root", "password");

                        // Fetch tasks for the logged-in user
                        int userId = (int) session.getAttribute("id");
                        String query = "SELECT id, task_name, task_description, status, done FROM tasks WHERE user_id = ?";
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
                    <td>
                        <form method="post">
                            <input type="number" name="progress" value="<%= rs.getInt("done") %>" min="0" max="100" />
                            <input type="hidden" name="task_id" value="<%= rs.getInt("id") %>" />
                            <input type="submit" value="Update" />
                        </form>
                    </td>
                    <td>
                        <% 
                            // Update progress and status if necessary
                            if ("POST".equals(request.getMethod())) {
                                int progress = Integer.parseInt(request.getParameter("progress"));
                                int taskId = Integer.parseInt(request.getParameter("task_id"));

                                if (progress == 100) {
                                    // Update the status to 'Completed'
                                    String updateQuery = "UPDATE tasks SET done = ?, status = 'Completed' WHERE id = ?";
                                    updateStmt = conn.prepareStatement(updateQuery);
                                    updateStmt.setInt(1, progress);
                                    updateStmt.setInt(2, taskId);
                                    updateStmt.executeUpdate();
                                } else {
                                    // Just update the 'done' value
                                    String updateQuery = "UPDATE tasks SET done = ? WHERE id = ?";
                                    updateStmt = conn.prepareStatement(updateQuery);
                                    updateStmt.setInt(1, progress);
                                    updateStmt.setInt(2, taskId);
                                    updateStmt.executeUpdate();
                                }
                            }
                        %>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<p style='color:red;'>Error fetching tasks: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (updateStmt != null) try { updateStmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
