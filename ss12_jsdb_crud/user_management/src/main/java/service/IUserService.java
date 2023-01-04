package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> selectAllUsers();

    User selectUser(int id);

    boolean insertUser(User user);

    boolean updateUser(User user);

    boolean deleteUser(int id);
}
