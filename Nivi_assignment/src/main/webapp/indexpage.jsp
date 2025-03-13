<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }
        .container {
            width: 40%;
            background: white;
            padding: 20px;
            margin: auto;
            margin-top: 50px;
            box-shadow: 0px 0px 10px gray;
            border-radius: 10px;
        }
        input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid gray;
            border-radius: 5px;
        }
        button {
            background-color: blue;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: darkblue;
        }
        .login-link {
            margin-top: 10px;
            display: block;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register</h2>
        <form action="RegisterServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required minlength="8">
            <input type="text" name="phone_number" placeholder="Phone Number" required pattern="\d{10}" title="Phone number must be 10 digits">
            <input type="text" name="address" placeholder="Address" required>
            <input type="text" name="nic_number" placeholder="NIC Number" required>
            <input type="email" name="mail_id" placeholder="Mail ID" required>
            <button type="submit">Register</button>
        </form>
        <a class="login-link" href="login.jsp">Already registered? Please login</a>
    </div>
</body>
</html>
