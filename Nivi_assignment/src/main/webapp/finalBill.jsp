<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.List, Bean.CabBookingBean, Dao.CabBookingDAO" %>

<%
    String deleteName = request.getParameter("deleteName");
    if (deleteName != null) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nivi_cab", "root", "123456789");
            String sql = "DELETE FROM cab_booking WHERE name=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, deleteName);
            stmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Fetch updated list of bookings
    List<CabBookingBean> bookings = CabBookingDAO.getAllBookings();
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
        .delete-btn {
            background-color: red;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
        }
        .delete-btn:hover {
            background-color: darkred;
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
                <th>Action</th>
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
                        <td>
                            <form method="post" style="margin: 0;">
    <input type="hidden" name="deleteName" value="<%= booking.getName() %>">
    <button type="submit" class="delete-btn">Delete</button>
</form>

                        </td>
                    </tr>
            <% }} else { %>
                <tr>
                    <td colspan="7">No bookings available</td>
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
