package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> selectAllUsers();

    User selectUser(int id);

    void insertUser(User user);

    boolean updateUser(User user);

    boolean deleteUser(int id);
}
