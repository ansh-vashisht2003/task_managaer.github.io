<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services - Taskify</title>
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

        /* Service Section */
        .services {
            padding: 4rem 2rem;
            text-align: center;
        }
        .services h1 {
            font-size: 2.5rem;
            color: #30475E;
            margin-bottom: 1.5rem;
        }
        .services p {
            font-size: 1.2rem;
            color: #555;
            margin-bottom: 2rem;
        }
        .service-buttons {
            display: flex;
            justify-content: center;
            gap: 2rem;
            flex-wrap: wrap;
        }
        .service-buttons a {
            text-decoration: none;
            color: white;
            background-color: #F9A826;
            padding: 1rem 2rem;
            border-radius: 30px;
            font-size: 1.2rem;
            font-weight: 600;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .service-buttons a:hover {
            background-color: #30475E;
            transform: scale(1.05);
        }

        /* Footer */
        footer {
            background-color: #30475E;
            color: #F8F9FA;
            text-align: center;
            padding: 1rem;
            margin-top: 3rem;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav>
        <div class="logo">Taskify</div>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="serv.jsp">Work</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </nav>

    <!-- Service Section -->
    <div class="services">
        <h1>Choose Your Role</h1>
        <p>Select your role to proceed further.</p>
        <div class="service-buttons">
            <a href="admin/login.jsp">Admin</a>
            <a href="user/signup.jsp">User</a>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        © 2024 Taskify. All rights reserved.
    </footer>
</body>
</html>
