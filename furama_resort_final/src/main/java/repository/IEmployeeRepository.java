package repository;

import model.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> selectAllEmployee();

    Employee selectEmployeeById(int id);

    boolean insert (Employee employee);

    boolean update (Employee employee);

    boolean delete (int id);
}
