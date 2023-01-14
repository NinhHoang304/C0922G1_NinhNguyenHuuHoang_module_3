package controller;

import model.Sach;
import model.TheMuonSach;
import service.IHocSinhService;
import service.IMuonSachService;
import service.impl.MuonSachServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MuonSachServlet", value = "/muon_sach")
public class MuonSachServlet extends HttpServlet {
    private final IMuonSachService muonSachService = new MuonSachServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TheMuonSach> theMuonSachList = this.muonSachService.selectAllTheMuonSach();
        request.setAttribute("theMuonSachList", theMuonSachList);
        request.getRequestDispatcher("view/muon_sach_list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
