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
        .logout {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome,</h2>
        
        <form class="logout" action="LogoutServlet" method="post">
            <button type="submit">Logout</button>
        </form>
    </div>
</body>
</html>
