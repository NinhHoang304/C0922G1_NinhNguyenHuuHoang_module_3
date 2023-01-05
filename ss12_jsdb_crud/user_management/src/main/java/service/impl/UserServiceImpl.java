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
}
