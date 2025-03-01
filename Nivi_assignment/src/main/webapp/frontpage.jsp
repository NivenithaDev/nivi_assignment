<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) sessionUser.getAttribute("username");
%>
<html>
<head>
    <title>Welcome</title>
    <style>
    
    	@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');
    
        body {
            	
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            background: white;
            padding: 20px;
            margin: auto;
            margin-top: 50px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            text-align: center;
        }
        .buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 20px;
        }
        button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
        .vehicles {
            margin: 20px 0;
            padding: 10px;
            background: #f8f9fa;
            border-radius: 10px;
        }
        .vehicles p {
            font-size: 18px;
            padding: 5px;
        }
        .form-container {
            background: #f1f1f1;
            padding: 20px;
            border-radius: 10px;
            text-align: left;
        }
        input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .form-container button {
            width: 100%;
            background-color: #28a745;
            font-size: 18px;
        }
        .form-container button:hover {
            background-color: #218838;
        }
        
        .welcome-text {
        font-size: 28px;
        font-family: 'Poppins', sans-serif;
        font-weight: 600;
        color: #333;
    	}
    	
    	.vehicle-title {
        font-size: 24px;
        font-family: 'Poppins', sans-serif;
        font-weight: 600;
        color: #007BFF;
    }

    .vehicle-item {
        font-size: 20px;
        font-family: 'Poppins', sans-serif;
        font-weight: 400;
        color: #555;
        margin: 5px 0;
    }
    
    </style>
</head>
<body>
    <div class="container">
        <div class="buttons">
            <form action="viewBill.jsp" method="post">
                <button type="submit">View Bills</button>
            </form>
            <form action="LogoutServlet" method="post">
                <button type="submit">Logout</button>
            </form>
        </div>

        <h2>Welcome, <%= username %>!</h2>

        <div class="vehicles">
            <h2>Available Vehicles</h2>
            <p>🚐 Nissan Van - 8 Seater | AC</p>
            <p>🚗 Suzuki Car - 4 Seater | AC</p>
            <p>🚐 Hiace Van - 9 Seater | AC</p>
            <p>🚐 Dolphin Van - 6 Seater | Non-AC</p>
        </div>

        <div class="form-container">
            <h2>Cab Booking</h2>
            <form action="CabBookingServlet" method="post">
                <input type="text" name="name" placeholder="Name" required>
                <input type="text" name="address" placeholder="Address" required>
                <input type="text" name="to" placeholder="To" required>
                <input type="text" name="from" placeholder="From" required>
                <input type="number" name="km" placeholder="Km" required>
                <button type="submit">Book Now</button>
            </form>
        </div>
    </div>
</body>
</html>
