<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionAdmin = request.getSession(false);
    if (sessionAdmin == null || sessionAdmin.getAttribute("adminUsername") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
    String adminUsername = (String) sessionAdmin.getAttribute("adminUsername");

    // Database Connection Details
    String url = "jdbc:mysql://localhost:3306/nivi_cab";
    String user = "root";
    String password = "123456789";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>

<html>
<head>
    <title>Admin Home - Cab Bookings</title>
    <style>
        body { 
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            background: #fff;
            padding: 20px;
            margin: 50px auto;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h2, h3 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #00ffbf;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #e1f0ff;
        }
        .section {
            margin-top: 40px;
            padding: 20px;
            border-radius: 10px;
            background: linear-gradient(135deg, #007bff, #00d4ff);
            color: white;
            text-align: center;
            box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.1);
        }
        .section p {
            font-size: 18px;
        }
        .logout {
            text-align: center;
            margin-top: 20px;
        }
        .logout button {
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #dc3545;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .logout button:hover {
            background-color: #b52a3a;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, <%= adminUsername %>!</h2>
        
        <h3>Cab Booking Details</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Address</th>
                <th>To</th>
                <th>From</th>
                <th>KM</th>
                <th>Booked At</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);
                    String sql = "SELECT * FROM cab_booking ORDER BY created_at DESC";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();
                    
                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("address") %></td>
                            <td><%= rs.getString("to_location") %></td>
                            <td><%= rs.getString("from_location") %></td>
                            <td><%= rs.getInt("km") %></td>
                            <td><%= rs.getTimestamp("created_at") %></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
        </table>

        <!-- Available Vehicles Section -->
        <div class="section">
            <h2>Available Vehicles</h2>
            <p>🚐 <b>Nissan Van</b> - 8 Seater | AC</p>
            <p>🚗 <b>Suzuki Car</b> - 4 Seater | AC</p>
            <p>🚐 <b>Hiace Van</b> - 9 Seater | AC</p>
            <p>🚐 <b>Dolphin Van</b> - 6 Seater | Non-AC</p>
        </div>

        <!-- Available Drivers Section -->
        <div class="section">
            <h2>Available Drivers</h2>
            <p><b>Name:</b> Perera <br> <b>Age:</b> 32 <br> <b>Mobile No:</b> 0745632148</p>
            <p><b>Name:</b> Gunaretnam <br> <b>Age:</b> 38 <br> <b>Mobile No:</b> 0765231478</p>
            <p><b>Name:</b> Thushan <br> <b>Age:</b> 26 <br> <b>Mobile No:</b> 0787465321</p>
            <p><b>Name:</b> Akil <br> <b>Age:</b> 24 <br> <b>Mobile No:</b> 0729514753</p>
        </div>

        <form class="logout" action="AdminLogoutServlet" method="post">
            <button type="submit">Logout</button>
        </form>
    </div>
</body>
</html>
