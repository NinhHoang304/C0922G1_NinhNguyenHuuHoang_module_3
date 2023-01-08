package service;

import model.Employee;

import java.util.List;

public interface IEmployeeService {

    List<Employee> selectAllEmployee();

    Employee selectEmployeeById(int id);

    boolean insert (Employee employee);

    boolean update (Employee employee);

    boolean delete (int id);
}
