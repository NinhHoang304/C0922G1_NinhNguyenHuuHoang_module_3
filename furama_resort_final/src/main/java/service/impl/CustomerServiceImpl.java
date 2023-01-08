package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepositoryImpl;
import service.ICustomerService;

import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    private final ICustomerRepository customerRepository = new CustomerRepositoryImpl();
    @Override
    public List<Customer> selectAllCustomer() {
        return this.customerRepository.selectAllCustomer();
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
        return this.customerRepository.deleteCustomer(id);
    }
}
