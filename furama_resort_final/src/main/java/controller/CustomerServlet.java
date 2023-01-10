package controller;

import model.Customer;
import model.CustomerType;
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
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                break;
            default:
                listCustomer(request, response);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = this.customerService.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("view/customer_create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
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
            case "insert":
                insertCustomer(request, response);
                break;
            case "update":
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
        }
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerTypeId = Integer.parseInt(request.getParameter("customerType"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dayOfBirth");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        boolean check = this.customerService.insertCustomer(new Customer(customerTypeId,
                name, dateOfBirth, gender, idCard, phoneNumber, email, address));
        String mess ="Thêm mới thành công";
        if (!check){
            mess= "Thêm mới không thành công";
        }
        request.setAttribute("mess", mess);
        showCreateForm(request, response);
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
