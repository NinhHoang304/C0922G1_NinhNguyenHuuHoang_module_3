package com.example.display_list_customer;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "home", value = "/home")
public class home extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://luv.vn/wp-content/uploads/2021/09/hinh-anh-nguoi-mau-lam-hinh-nen-dien-thoai-3.jpg"));
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://luv.vn/wp-content/uploads/2021/09/hinh-anh-nguoi-mau-lam-hinh-nen-dien-thoai-3.jpg"));
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://luv.vn/wp-content/uploads/2021/09/hinh-anh-nguoi-mau-lam-hinh-nen-dien-thoai-3.jpg"));
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://luv.vn/wp-content/uploads/2021/09/hinh-anh-nguoi-mau-lam-hinh-nen-dien-thoai-3.jpg"));
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://luv.vn/wp-content/uploads/2021/09/hinh-anh-nguoi-mau-lam-hinh-nen-dien-thoai-3.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
