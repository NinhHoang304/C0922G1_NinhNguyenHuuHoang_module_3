package service.impl;

import model.Student;
import model.Student1;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.List;

public class StudentService  implements IStudentService {
    private IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student1> findAll() {

        return studentRepository.findAll();
    }

    @Override
    public List<Student1> search(String searchName, String searchClassId) {
        return studentRepository.search(searchName,searchClassId);
    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public boolean save(Student1 student) {
        // cần kiểm tra dữ liệu (validate dữ liêu)

        // nếu ok thì luuw vào db
        return studentRepository.save(student);
    }

    @Override
    public boolean delete(int id) {
        return studentRepository.delete(id);
    }
}
