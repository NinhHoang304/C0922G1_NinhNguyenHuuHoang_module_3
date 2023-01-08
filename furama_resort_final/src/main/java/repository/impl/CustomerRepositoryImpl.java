package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {


    private final String SELECT_ALL_CUSTOMER = "select * from customer;";
    private final String DELETE_CUSTOMER_BY_ID = "delete from customer where id = ?;";
    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                int customerTypeId = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("name");
                String dayOfBirth = resultSet.getString("day_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                customerList.add(new Customer(id, customerTypeId, name, dayOfBirth, gender,
                        idCard, phoneNumber, email, address));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerList;
    }

    @Override
    public Customer selectCustomerById(int id) {
        return null;
    }

    @Override
    public boolean insertCustomer(Customer customer) {
        return false;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) {
        boolean rowDeleted;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDeleted;
    }
}
