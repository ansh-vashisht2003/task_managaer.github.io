<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Taskify</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #F8F9FA;
            color: #333;
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
            text-align: center;
            width: 90%;
        }

        .login-container h1 {
            color: #30475E;
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .login-container form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
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
            margin-top: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Admin Login</h1>
        <form method="post" action="login.jsp">
            <input type="text" name="username" placeholder="Enter Username" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <button type="submit">Login</button>
            <% 
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                if (username != null && password != null) {
                    if (username.equals("admin") && password.equals("admin")) {
                        response.sendRedirect("dashboard.jsp");
                    } else {
                        out.println("<div class='error-message'>Invalid username or password!</div>");
                    }
                }
            %>
        </form>
    </div>
</body>
</html>
