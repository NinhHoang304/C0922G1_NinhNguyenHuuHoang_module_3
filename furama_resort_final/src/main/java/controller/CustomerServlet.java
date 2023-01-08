package controller;

import model.Customer;
import service.ICustomerService;
import service.impl.CustomerServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private final ICustomerService customerService = new CustomerServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            default:
                listCustomer(request, response);
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = this.customerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        try {
            request.getRequestDispatcher("view/customer.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int deleteId = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = this.customerService.deleteCustomer(deleteId);
        String mess = "Xoá thành công";
        if (!check){
            mess = "Xoá không thành công";
        }
        request.setAttribute("mess", mess);
        listCustomer(request, response);
    }
}
