package controller;

import model.User;
import service.IUserService;
import service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UsersServlet", value = "/users")
public class UsersServlet extends HttpServlet {

    private final IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = this.userService.callAllUser();
        request.setAttribute("user", userList);
        try {
            request.getRequestDispatcher("view/user/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        this.userService.callDeleteUser(id);
        listUser(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.userService.selectUser(id);
        request.setAttribute("user", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/user/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/user/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertUser(request, response);
                break;
            case "edit":
                updateUser(request, response);
                break;
            case "find":
                findByCountry(request, response);
                break;
            case "sort":
                sortByName(request, response);
                break;
        }
    }

    private void sortByName(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = this.userService.sortByName();
        request.setAttribute("users", userList);

        if (userList == null){
            try {
                request.getRequestDispatcher("view/user/error-404.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        }else {
            try {
                request.getRequestDispatcher("view/user/sort.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void findByCountry(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        List<User> userList = this.userService.findByCountry(country);
        request.setAttribute("users", userList);

        if (userList == null){
            try {
                request.getRequestDispatcher("view/user/error-404.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        }else {
            try {
                request.getRequestDispatcher("view/user/search.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User user = new User(id, name, email, country);
        this.userService.callUpdateUser(user);
        try {
            request.getRequestDispatcher("view/user/edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        this.userService.insertUser(new User(name, email, country));
        request.setAttribute("message", "New user was created");
        try {
            request.getRequestDispatcher("view/user/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
