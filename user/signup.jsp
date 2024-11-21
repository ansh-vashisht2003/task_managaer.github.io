<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Signup - Taskify</title>
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

        .signup-container {
            background-color: white;
            padding: 2rem 2.5rem;
            border-radius: 20px;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        .signup-container h1 {
            color: #30475E;
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .signup-container form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .signup-container input {
            padding: 0.8rem;
            font-size: 1rem;
            border-radius: 10px;
            border: 1px solid #ddd;
            width: 100%;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .signup-container input:focus {
            border-color: #F9A826;
        }

        .signup-container button {
            padding: 0.8rem;
            font-size: 1rem;
            background-color: #F9A826;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .signup-container button:hover {
            background-color: #30475E;
            transform: scale(1.05);
        }

        .error-message {
            color: red;
            font-size: 0.9rem;
        }

        .success-message {
            color: green;
            font-size: 1rem;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h1>User Signup</h1>
        <form method="post" action="signup.jsp">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="email" name="email_id" placeholder="Email ID" required>
            <input type="text" name="phone_number" placeholder="Phone Number" required pattern="[0-9]{10}" title="Phone number must be exactly 10 digits">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Signup</button>
           <p> Have an account? <a href="login.jsp">Login</a></p>
            <%
                String name = request.getParameter("name");
                String email_id = request.getParameter("email_id");
                String phone_number = request.getParameter("phone_number");
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                if (name != null && email_id != null && phone_number != null && username != null && password != null) {
                    Connection conn = null;
                    PreparedStatement checkEmailStmt = null;
                    PreparedStatement checkUsernameStmt = null;
                    PreparedStatement insertStmt = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/taskmanager", "root", "password");

                        // Check for unique email ID
                        String checkEmailQuery = "SELECT COUNT(*) FROM users WHERE email_id = ?";
                        checkEmailStmt = conn.prepareStatement(checkEmailQuery);
                        checkEmailStmt.setString(1, email_id);
                        ResultSet emailResult = checkEmailStmt.executeQuery();
                        emailResult.next();

                        // Check for unique username
                        String checkUsernameQuery = "SELECT COUNT(*) FROM users WHERE username = ?";
                        checkUsernameStmt = conn.prepareStatement(checkUsernameQuery);
                        checkUsernameStmt.setString(1, username);
                        ResultSet usernameResult = checkUsernameStmt.executeQuery();
                        usernameResult.next();

                        if (emailResult.getInt(1) > 0) {
                            out.println("<div class='error-message'>Email ID is already registered.</div>");
                        } else if (usernameResult.getInt(1) > 0) {
                            out.println("<div class='error-message'>Username is already taken.</div>");
                        } else {
                            // Insert new user
                            String insertQuery = "INSERT INTO users (name, email_id, phone_number, username, password) VALUES (?, ?, ?, ?, ?)";
                            insertStmt = conn.prepareStatement(insertQuery);
                            insertStmt.setString(1, name);
                            insertStmt.setString(2, email_id);
                            insertStmt.setString(3, phone_number);
                            insertStmt.setString(4, username);
                            insertStmt.setString(5, password);
                            insertStmt.executeUpdate();

                            out.println("<div class='success-message'>Signup successful! Redirecting to login page...</div>");
                            response.setHeader("Refresh", "2; URL=login.jsp");
                        }
                    } catch (Exception e) {
                        out.println("<div class='error-message'>An error occurred. Please try again later.</div>");
                        e.printStackTrace();
                    } finally {
                        try {
                            if (checkEmailStmt != null) checkEmailStmt.close();
                            if (checkUsernameStmt != null) checkUsernameStmt.close();
                            if (insertStmt != null) insertStmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
        </form>
    </div>
</body>
</html>
