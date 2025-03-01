package Servlet;

import Bean.CabBookingBean;
import Dao.CabBookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CabBookingServlet")
public class CabBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String to = request.getParameter("to");
        String from = request.getParameter("from");
        int km = Integer.parseInt(request.getParameter("km"));

        CabBookingBean booking = new CabBookingBean();
        booking.setName(name);
        booking.setAddress(address);
        booking.setTo(to);
        booking.setFrom(from);
        booking.setKm(km);

        if (CabBookingDAO.saveBooking(booking)) {
            response.sendRedirect("frontpage.jsp?status=success");
        } else {
            response.sendRedirect("frontpage.jsp?status=fail");
        }
    }
}
