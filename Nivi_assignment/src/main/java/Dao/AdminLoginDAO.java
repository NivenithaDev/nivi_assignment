package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Bean.AdminLoginBean;

public class AdminLoginDAO {

    // Database Connection
    private static final String URL = "jdbc:mysql://localhost:3306/nivi_cab";
    private static final String USER = "root";
    private static final String PASSWORD = "123456789";

    public static boolean validate(AdminLoginBean admin) {
        boolean status = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());

            ResultSet rs = ps.executeQuery();
            status = rs.next(); // If result set has data, user is valid

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
