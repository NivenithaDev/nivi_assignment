package Dao;

import Bean.CabBookingBean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CabBookingDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/nivi_cab";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "123456789";

    // ✅ Method to Save Booking
    public static boolean saveBooking(CabBookingBean booking) {
        boolean status = false;
        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            String sql = "INSERT INTO cab_booking (name, address, to_location, from_location, km) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, booking.getName());
            stmt.setString(2, booking.getAddress());
            stmt.setString(3, booking.getTo());
            stmt.setString(4, booking.getFrom());
            stmt.setInt(5, booking.getKm());

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                status = true;
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // ✅ Method to Retrieve All Bookings
    public static List<CabBookingBean> getAllBookings() {
        List<CabBookingBean> bookingList = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            String sql = "SELECT id, name, address, to_location, from_location, km FROM cab_booking"; // ✅ Include ID in SELECT
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CabBookingBean booking = new CabBookingBean();
                booking.setId(rs.getInt("id"));  // ✅ Fetch ID
                booking.setName(rs.getString("name"));
                booking.setAddress(rs.getString("address"));
                booking.setTo(rs.getString("to_location"));
                booking.setFrom(rs.getString("from_location"));
                booking.setKm(rs.getInt("km"));

                // ✅ Calculate Price (km * 200)
                int price = rs.getInt("km") * 200;
                booking.setPrice(price);

                bookingList.add(booking);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookingList;
    }
}
