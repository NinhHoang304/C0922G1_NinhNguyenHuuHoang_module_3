package controller;

import model.Facility;
import service.IFacilityService;
import service.impl.FacilityServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {

    private final IFacilityService facilityService = new FacilityServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            default:
                listFacility(request, response);
        }
    }

    private void listFacility(HttpServletRequest request, HttpServletResponse response) {
        // tạo list nhận giữ liệu đổ về từ repository thông qua facility service
        List<Facility> facilityList = this.facilityService.selectAllFacility();
        // đóng gói giữ liệu bằng phương thức request.setAttribute
        request.setAttribute("facilityList", facilityList);
        try {
            // request.getRequestDispatcher chuyển trang, forward gửi giữ liệu qua trang vừa chuyển đến
            request.getRequestDispatcher("view/facility.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
