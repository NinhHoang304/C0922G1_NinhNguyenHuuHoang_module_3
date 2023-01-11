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
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                createFacility(request, response);
                break;
            case "edit":
                editFacility(request, response);
                break;
            case "delete":
                deleteFacility(request, response);
                break;
        }
    }

    private void editFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idEdit"));
        String name = request.getParameter("nameEdit");
        int area = Integer.parseInt(request.getParameter("areaEdit"));
        double cost = Double.parseDouble(request.getParameter("costEdit"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeopleEdit"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeEdit"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeIdEdit"));
        String standardRoom = request.getParameter("standardRoomEdit");
        String descriptionOtherConvenience = request.getParameter("descriptionEdit");
        double poolArea = Double.parseDouble(request.getParameter("poolAreaEdit"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloorsEdit"));
        String facilityFree = request.getParameter("facilityFreeEdit");
        if (this.facilityService.selectFacilityById(id) != null) {
            boolean check = this.facilityService.updateFacility(new Facility(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree));
            if (!check) {
                request.setAttribute("message", "Edit failed!");
            } else {
                request.setAttribute("message", "Edit successful!");
            }
        } else {
            request.setAttribute("message", "Edit failed because id already not exists!");
        }
        listFacility(request, response);
    }

    private void createFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentType"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");
        Facility facility = new Facility(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        if (this.facilityService.selectFacilityById(id) == null) {
            boolean check = this.facilityService.insertFacility(facility);
            if (!check) {
                request.setAttribute("message", "Add failed!");
            } else {
                request.setAttribute("message", "Add successful!");
            }
        } else {
            request.setAttribute("message", "Add failed because id already exists!");
        }
        listFacility(request, response);
    }


    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int deleteId = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = this.facilityService.deleteFacility(deleteId);
        String mess = "Xoá thành công";
        if (!check){
            mess = "Xoá không thành công";
        }
        request.setAttribute("mess", mess);
        listFacility(request, response);
    }
}
