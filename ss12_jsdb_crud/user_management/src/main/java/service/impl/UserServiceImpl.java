package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepositoryImpl;
import service.IUserService;

import java.util.List;

public class UserServiceImpl implements IUserService {

    private final IUserRepository userRepository = new UserRepositoryImpl();

    @Override
    public List<User> selectAllUsers() {
        return this.userRepository.selectAllUsers();
    }

    @Override
    public User selectUser(int id) {
        return this.userRepository.selectUser(id);
    }

    @Override
    public boolean insertUser(User user) {
        return this.userRepository.insertUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return this.userRepository.updateUser(user);
    }

    @Override
    public boolean deleteUser(int id) {
        return this.userRepository.deleteUser(id);
    }

    @Override
    public List<User> findByCountry(String country) {
        return this.userRepository.findByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return this.userRepository.sortByName();
    }

    @Override
    public List<User> callAllUser() {
        return this.userRepository.callAllUser();
    }

    @Override
    public boolean callUpdateUser(User user) {
        return this.userRepository.callUpdateUser(user);
    }

    @Override
    public boolean callDeleteUser(int id) {
        return this.userRepository.callDeleteUser(id);
    }

    @Override
    public void addUserTransaction(User user, int[] permission) {
        this.userRepository.addUserTransaction(user, permission);
    }
}
