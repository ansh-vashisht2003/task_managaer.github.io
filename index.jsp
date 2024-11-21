<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Manager</title>
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

        /* Hero Section */
        .hero {
            background: #30475E;
            color: #F8F9FA;
            text-align: center;
            padding: 5rem 2rem;
            position: relative;
        }
        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
        }
        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
        }
        .hero .btn {
            text-decoration: none;
            background-color: #F9A826;
            color: #30475E;
            padding: 1rem 2rem;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .hero .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        /* Features Section */
        .features {
            display: flex;
            flex-direction: column;
            gap: 2rem;
            padding: 3rem 2rem;
            background-color: #F8F9FA;
            align-items: center;
        }
        .features .feature {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            width: 80%;
            text-align: center;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .features .feature:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .features .feature h3 {
            font-size: 1.5rem;
            color: #30475E;
            margin-bottom: 1rem;
        }
        .features .feature p {
            font-size: 1rem;
            color: #555;
        }

        /* Footer */
        footer {
            background-color: #30475E;
            color: #F8F9FA;
            text-align: center;
            padding: 1rem;
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

    <!-- Hero Section -->
    <div class="hero">
        <h1>Welcome to Taskify</h1>
      
    </div>

    <!-- Features Section -->
    <div class="features">
        <div class="feature">
            <h3>Plan Smarter</h3>
            <p>Organize your tasks with ease and never miss a deadline again.</p>
        </div>
        <div class="feature">
            <h3>Collaborate Effectively</h3>
            <p>Work with your team in real-time and achieve your goals faster.</p>
        </div>
        <div class="feature">
            <h3>Track Progress</h3>
            <p>Get insights on your tasks and stay on top of your productivity.</p>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        © 2024 Taskify. Designed for success.
    </footer>
</body>
</html>
