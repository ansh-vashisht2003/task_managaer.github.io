<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Taskify</title>
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

        /* Contact Section */
        .contact {
            padding: 4rem 2rem;
            text-align: center;
            background-color: #F8F9FA;
        }
        .contact h1 {
            font-size: 2.5rem;
            color: #30475E;
            margin-bottom: 1.5rem;
        }
        .contact p {
            font-size: 1.2rem;
            color: #555;
            margin-bottom: 2rem;
        }
        .contact-details {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1.5rem;
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1);
        }
        .contact-details div {
            text-align: left;
            font-size: 1rem;
            color: #30475E;
        }
        .contact-details div i {
            margin-right: 0.5rem;
            color: #F9A826;
        }
        .contact-details a {
            text-decoration: none;
            color: #F9A826;
            transition: color 0.3s ease;
        }
        .contact-details a:hover {
            color: #30475E;
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

    <!-- Contact Section -->
    <div class="contact">
        <h1>Contact Us</h1>
        <p>We're here to help. Reach out to us using the following details:</p>
        <div class="contact-details">
            <div>
                <i class="fas fa-map-marker-alt"></i> Address: NMAMIT , Nitte , Karnataka 157004
            </div>
            <div>
                <i class="fas fa-phone-alt"></i> Phone: <a href="tel:+1234567890">+91 8156299134</a>
            </div>
            <div>
                <i class="fas fa-envelope"></i> Email: <a href="mailto:support@taskify.com">support@taskify.com</a>
            </div>
            <div>
                <i class="fas fa-globe"></i> Website: <a href="https://www.taskify.com" target="_blank">www.taskify.com</a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        © 2024 Taskify. All rights reserved.
    </footer>
</body>
</html>
