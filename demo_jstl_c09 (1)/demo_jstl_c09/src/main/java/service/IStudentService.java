package service;

import model.Student;
import model.Student1;

import java.util.List;

public interface IStudentService {
    List<Student1> findAll();
    List<Student1> search(String searchName, String searchClassId);
    Student findById(int id);
    boolean save(Student1 student);
    boolean delete(int id);
}
