package repository;

import model.Customer;
import model.CustomerType;

import java.util.List;

public interface ICustomerRepository {

    List<Customer> selectAllCustomer();

    Customer selectCustomerById(int id);

    boolean insertCustomer(Customer customer);

    boolean updateCustomer(Customer customer);

    boolean deleteCustomer(int id);

    // customer type method
    List<CustomerType> selectAllCustomerType();
}
