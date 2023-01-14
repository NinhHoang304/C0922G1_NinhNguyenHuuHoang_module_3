package controller;

import model.HocSinh;
import service.IHocSinhService;
import service.impl.HocSinhServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HocSinhServlet", value = "/HocSinhServlet")
public class HocSinhServlet extends HttpServlet {
    private final IHocSinhService hocSinhService = new HocSinhServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<HocSinh> hocSinhList = this.hocSinhService.selectAllHocSinh();
        request.setAttribute("hocSinhList", hocSinhList);
        request.getRequestDispatcher("view/muon_sach_list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
