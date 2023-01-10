package service;

import model.Customer;
import model.CustomerType;

import java.util.List;

public interface ICustomerService {
    List<Customer> selectAllCustomer();

    Customer selectCustomerById(int id);

    boolean insertCustomer(Customer customer);

    boolean updateCustomer(Customer customer);

    boolean deleteCustomer(int id);

    // customer type method
    List<CustomerType> selectAllCustomerType();
}
