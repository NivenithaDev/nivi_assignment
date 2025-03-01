<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, Bean.CabBookingBean" %>
<%
    List<CabBookingBean> bookings = (List<CabBookingBean>) request.getAttribute("bookings");
%>
<html>
<head>
    <title>Final Bill</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background-color: #f4f4f4; 
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container { 
            width: 60%; 
            background: white; 
            padding: 30px; 
            margin: auto; 
            margin-top: 50px; 
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2); 
            border-radius: 10px; 
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 20px; 
            text-align: center;
        }
        th, td { 
            padding: 12px; 
            border: 1px solid #ddd; 
        }
        th { 
            background-color: #007BFF; 
            color: white; 
        }
        tr:nth-child(even) { 
            background-color: #f2f2f2; 
        }
        .back-button {
            margin-top: 20px;
        }
        .back-button a {
            text-decoration: none;
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            display: inline-block;
        }
        .back-button a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Final Bill</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>To</th>
                <th>From</th>
                <th>KM</th>
                <th>Price</th>
            </tr>
            <% if (bookings != null && !bookings.isEmpty()) { 
                for (CabBookingBean booking : bookings) { %>
                    <tr>
                        <td><%= booking.getName() %></td>
                        <td><%= booking.getAddress() %></td>
                        <td><%= booking.getTo() %></td>
                        <td><%= booking.getFrom() %></td>
                        <td><%= booking.getKm() %></td>
                        <td>Rs <%= booking.getPrice() %></td>
                    </tr>
            <% }} else { %>
                <tr>
                    <td colspan="6">No bookings available</td>
                </tr>
            <% } %>
        </table>
        
        <!-- Back Button -->
        <div class="back-button">
            <a href="frontpage.jsp">⬅ Back to Home</a>
        </div>
    </div>
</body>
</html>
