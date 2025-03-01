package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Bean.LoginBean;

public class LoginDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/nivi_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456789";

    public boolean validateUser(LoginBean loginBean) {
        boolean isValid = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT * FROM Customer WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, loginBean.getUsername());
            ps.setString(2, loginBean.getPassword());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isValid = true;
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }
}
