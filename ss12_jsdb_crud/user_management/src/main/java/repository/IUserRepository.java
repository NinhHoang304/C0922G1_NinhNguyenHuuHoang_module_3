package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> selectAllUsers();

    User selectUser(int id);

    boolean insertUser(User user);

    boolean updateUser(User user);

    boolean deleteUser(int id);

    List<User> findByCountry(String country);

    List<User> sortByName();

    List<User> callAllUser();

    boolean callUpdateUser(User user);

    boolean callDeleteUser(int id);
}
