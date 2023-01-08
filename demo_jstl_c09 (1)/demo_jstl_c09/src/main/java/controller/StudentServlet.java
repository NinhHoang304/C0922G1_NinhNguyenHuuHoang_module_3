package controller;

import model.Clazz;
import model.Student;
import model.Student1;
import service.IClazzService;
import service.IStudentService;
import service.impl.ClazzService;
import service.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet",urlPatterns = {"/student"})
public class StudentServlet extends HttpServlet {
     private IStudentService studentService = new StudentService();
     private IClazzService clazzService = new ClazzService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action ==null){
            action ="";
        }
        switch (action){
            case "create":
                save(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "search":
                search(request,response);
                break;
            default:
                break;
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String searchName = request.getParameter("searchName");
        String searchClassId = request.getParameter("searchClassId");
        List<Student1> studentList = studentService.search(searchName,searchClassId);
        request.setAttribute("studentList",studentList);
        List<Clazz> clazzList = clazzService.findByAll();
        request.setAttribute("clazzList", clazzList);
        try {
            request.getRequestDispatcher("view/student/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int deleteId = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = studentService.delete(deleteId);
        String mess ="Xoá thành công";
        if (!check){
            mess ="Xoá không thành công";
        }
        request.setAttribute("mess",mess);
        showList(request,response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        boolean gender= Boolean.parseBoolean(request.getParameter("gender"));
        float point = Float.parseFloat(request.getParameter("point"));
        int classId = Integer.parseInt(request.getParameter("classId"));
        Clazz clazz = new Clazz(classId);
        Student1 student = new Student1(name,gender,point,clazz);
        boolean check =studentService.save(student);
        String mess ="Thêm mới thành công";
        if (!check){
            mess= "Thêm mới không thành công";
        }
        request.setAttribute("mess", mess);
        showFormCreate(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action");
       if (action ==null){
           action ="";
       }
       switch (action){
           case "create":
               showFormCreate(request,response);
               break;
           default:
               showList(request,response);
               break;
       }
    }
    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<Clazz> clazzList = clazzService.findByAll();
        request.setAttribute("clazzList", clazzList);
        try {
            request.getRequestDispatcher("view/student/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Student1> studentList = studentService.findAll();
        request.setAttribute("studentList",studentList);
        List<Clazz> clazzList = clazzService.findByAll();
        request.setAttribute("clazzList", clazzList);
        try {
            request.getRequestDispatcher("view/student/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
