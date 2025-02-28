package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import Bean.CustomerBean;

public class CustomerDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/nivi_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "123456789";

    public boolean registerCustomer(CustomerBean customer) {
        boolean result = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO Customer (username, password, phone_number, address, nic_number, mail_id) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, customer.getUsername());
            ps.setString(2, customer.getPassword());
            ps.setString(3, customer.getPhoneNumber());
            ps.setString(4, customer.getAddress());
            ps.setString(5, customer.getNicNumber());
            ps.setString(6, customer.getMailId());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
