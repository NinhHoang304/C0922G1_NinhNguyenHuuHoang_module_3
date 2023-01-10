package service.impl;

import model.Customer;
import model.CustomerType;
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
        return this.customerRepository.selectCustomerById(id);
    }

    @Override
    public boolean insertCustomer(Customer customer) {
        return this.customerRepository.insertCustomer(customer);
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return this.customerRepository.updateCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) {
        return this.customerRepository.deleteCustomer(id);
    }

    @Override
    public List<CustomerType> selectAllCustomerType() {
        return this.customerRepository.selectAllCustomerType();
    }

    @Override
    public List<Customer> searchCustomer(String name, String customerType) {
        return this.customerRepository.searchCustomer(name, customerType);
    }
}
