package controller;

import model.HocSinh;
import model.Sach;
import model.TheMuonSach;
import service.IHocSinhService;
import service.IMuonSachService;
import service.ISachService;
import service.impl.HocSinhServiceImpl;
import service.impl.MuonSachServiceImpl;
import service.impl.SachServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SachServlet", value = "/sach")
public class SachServlet extends HttpServlet {
    private final ISachService sachService = new SachServiceImpl();
    private final IMuonSachService muonSachService = new MuonSachServiceImpl();
    private final IHocSinhService hocSinhService = new HocSinhServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                showFormCreate(request, response);
                break;
            default:
                listSach(request, response);
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<Sach> sachList = this.sachService.selectAllBook();
        request.setAttribute("sachList", sachList);
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void listSach(HttpServletRequest request, HttpServletResponse response) {
        List<Sach> sachList = this.sachService.selectAllBook();
        request.setAttribute("sachList", sachList);
        List<TheMuonSach> theMuonSachList = this.muonSachService.selectAllTheMuonSach();
        request.setAttribute("theMuonSachList", theMuonSachList);
        List<HocSinh> hocSinhList = this.hocSinhService.selectAllHocSinh();
        request.setAttribute("hocSinhList", hocSinhList);
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
        try {
            request.getRequestDispatcher("view/muon_sach_list.jsp").forward(request, response);
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
                insertSach(request, response);
                break;
        }
    }

    private void insertSach(HttpServletRequest request, HttpServletResponse response) {
        String maMuonSach = request.getParameter("maMuonSach");
        String tenSach = request.getParameter("tenSach");
        String tenHocSinh = request.getParameter("tenHocSinh");
        String ngayMuon = request.getParameter("ngayMuon");
        String ngayTra = request.getParameter("ngayTra");
        TheMuonSach theMuonSach = new TheMuonSach(maMuonSach, tenSach, tenHocSinh, ngayMuon, ngayTra);
        boolean check = this.muonSachService.themMoiTheMuonSach(theMuonSach);
        String mess ="Thêm mới thành công";
        if (!check){
            mess= "Thêm mới không thành công";
        }
        request.setAttribute("mess", mess);
        listSach(request, response);
    }
}
