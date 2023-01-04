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
        return null;
    }

    @Override
    public void insertUser(User user) {

    }

    @Override
    public boolean updateUser(User user) {
        return false;
    }

    @Override
    public boolean deleteUser(int id) {
        return false;
    }
}
