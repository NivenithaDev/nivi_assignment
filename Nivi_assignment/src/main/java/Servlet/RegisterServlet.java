package Servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Bean.CustomerBean;
import Dao.CustomerDAO;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String nicNumber = request.getParameter("nic_number");
        String mailId = request.getParameter("mail_id");

        CustomerBean customer = new CustomerBean();
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setPhoneNumber(phoneNumber);
        customer.setAddress(address);
        customer.setNicNumber(nicNumber);
        customer.setMailId(mailId);

        CustomerDAO dao = new CustomerDAO();
        boolean success = dao.registerCustomer(customer);

        if (success) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("indexpage.jsp?error=Registration Failed");
        }
    }
}
