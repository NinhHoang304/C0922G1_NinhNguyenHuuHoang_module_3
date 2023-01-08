package repository.impl;

import model.Clazz;
import model.Student;
import model.Student1;
import repository.BaseRepository;
import repository.IStudentRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private final String SELECT_ALL ="select * from student";
    private final String SEARCH ="select s.*, c.name as class_name from student s join clazz c on s.class_id=c.id where s.name like ? and s.class_id like ?;";
    private final String SELECT_ALL_JOIN ="select s.*,c.name as class_name FROM student s join clazz c on s.class_id=c.id";
    private final String DELETE_BY_ID ="call delete_student_by_id(?)";
    private final String INSERT_INTO ="insert into student(name,gender,point,class_id) values(?,?,?,?)";
    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_BY_ID);
            callableStatement.setInt(1,id);
            return callableStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Student1> findAll() {
        List<Student1>  studentList = new ArrayList<>();
        // kêt nối db để lấy ra listStudent rồi return
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_JOIN);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
              int id = resultSet.getInt("id");// id là tên của cột
              String name = resultSet.getString("name");
              boolean gender = resultSet.getBoolean("gender");
              float point = resultSet.getFloat("point");
              int classId = resultSet.getInt("class_id");
              String className = resultSet.getString("class_name");
                Clazz clazz = new Clazz(classId,className);
              Student1 student = new Student1(id,name,gender,point,clazz);
              studentList.add(student);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentList;
    }

    @Override
    public List<Student1> search(String searchName, String searchClassId) {
        List<Student1>  studentList = new ArrayList<>();
        // kêt nối db để lấy ra listStudent rồi return
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,"%"+searchName+"%");
            preparedStatement.setString(2,"%"+searchClassId+"%");

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");// id là tên của cột
                String name = resultSet.getString("name");
                boolean gender = resultSet.getBoolean("gender");
                float point = resultSet.getFloat("point");
                int classId = resultSet.getInt("class_id");
                String className = resultSet.getString("class_name");
                Clazz clazz = new Clazz(classId,className);
                Student1 student = new Student1(id,name,gender,point,clazz);
                studentList.add(student);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentList;
    }

    @Override
    public Student findById(int id) {
        return null;
    }
    @Override
    public boolean save(Student1 student) {
        // kết nối db
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,student.getName());
            preparedStatement.setBoolean(2,student.isGender());
            preparedStatement.setFloat(3,student.getPoint());
            preparedStatement.setInt(4,student.getClazz().getId());
           return preparedStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

}
