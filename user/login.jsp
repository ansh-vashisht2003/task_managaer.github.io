<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login - Taskify</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #F8F9FA;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: white;
            padding: 2rem 2.5rem;
            border-radius: 20px;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        .login-container h1 {
            color: #30475E;
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .login-container form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .login-container input {
            padding: 0.8rem;
            font-size: 1rem;
            border-radius: 10px;
            border: 1px solid #ddd;
            width: 100%;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .login-container input:focus {
            border-color: #F9A826;
        }

        .login-container button {
            padding: 0.8rem;
            font-size: 1rem;
            background-color: #F9A826;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .login-container button:hover {
            background-color: #30475E;
            transform: scale(1.05);
        }

        .error-message {
            color: red;
            font-size: 0.9rem;
            margin-top: 1rem;
        }

        .signup-link {
            margin-top: 1rem;
        }

        .signup-link a {
            color: #F9A826;
            text-decoration: none;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>User Login</h1>
        <form method="post" action="login.jsp">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <div class="signup-link">
            Don’t have an account? <a href="signup.jsp">Sign Up</a>
        </div>

        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username != null && password != null) {
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    // Load database driver and connect
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/taskmanager", "root", "password");

                    // Query to validate user credentials
                    String query = "SELECT id, name, email_id, phone_number FROM users WHERE username = ? AND password = ?";
                    stmt = conn.prepareStatement(query);
                    stmt.setString(1, username);
                    stmt.setString(2, password);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        // Save user details in session
                        HttpSession session1 = request.getSession();
                        session1.setAttribute("id", rs.getInt("id"));
                        session1.setAttribute("name", rs.getString("name"));
                        session1.setAttribute("email_id", rs.getString("email_id"));
                        session1.setAttribute("phone_number", rs.getString("phone_number"));

                        // Redirect to dashboard
                        response.sendRedirect("dashboard.jsp");
                    } else {
                        out.println("<div class='error-message'>Invalid username or password.</div>");
                    }
                } catch (Exception e) {
                    out.println("<div class='error-message'>An error occurred: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
</body>
</html>
