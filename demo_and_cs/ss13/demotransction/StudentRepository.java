package repository.impl;

import model.Student;
import repository.BaseRepository;
import repository.IStudentRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private final String SELECT_ALL ="select *from student";
    private final String SEARCH ="select * from student where name like ? and account like ? and class_id like ?";
    private final String DELETE_BY_ID ="call delete_by_id(?);";
    private final String INSERT_INTO =" insert into student(`name`,birthday, gender,email,`point`,class_id,`account`)" +
            " values (?,?,?,?,?,?,?)";
    @Override
    public List<Student> findAll() {
        List<Student> studentList = new ArrayList<>();
        // kết nối dabase
        Connection connection = BaseRepository.getConnectDB();
        // tạo câu truy vấn
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet =preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id"); // colummLable : tên  thuocj tính của bảng
                String name  = resultSet.getString("name");
                Boolean gender = resultSet.getBoolean("gender");
                String birthday = resultSet.getString("birthday");
                int point = resultSet.getInt("point");
                String account = resultSet.getString("account");
                int classId = resultSet.getInt("class_id");
                String email = resultSet.getString("email");
                Student student = new Student(id,name,gender,birthday,point,account,classId,email);
                studentList.add(student);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        // trả về 1 list
        return studentList;
    }

    @Override
    public List<Student> search(String searchName, String searchAccount, String searchClassId) {
        List<Student> studentList = new ArrayList<>();
        // kết nối dabase
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,"%"+searchName+"%");
            preparedStatement.setString(2,"%"+searchAccount+"%");
            preparedStatement.setString(3,"%"+searchClassId+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id"); // colummLable : tên  thuocj tính của bảng
                String name  = resultSet.getString("name");
                Boolean gender = resultSet.getBoolean("gender");
                String birthday = resultSet.getString("birthday");
                int point = resultSet.getInt("point");
                String account = resultSet.getString("account");
                int classId = resultSet.getInt("class_id");
                String email = resultSet.getString("email");
                Student student = new Student(id,name,gender,birthday,point,account,classId,email);
                studentList.add(student);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return studentList;
    }

    @Override
    public boolean add(Student student) {
        // kết nối db
        //`name`,birthday, gender,email,`point`,class_id,`account`
        Connection connection = BaseRepository.getConnectDB();
        try {
            // kiểu dữ liệu theo database
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,student.getName());
            preparedStatement.setDate(2, Date.valueOf(student.getBirthday()));
            preparedStatement.setBoolean(3,student.isGender());
            preparedStatement.setString(4, student.getEmail());
            preparedStatement.setInt(5, student.getPoint());
            preparedStatement.setInt(6, student.getClassId());
            preparedStatement.setString(7, student.getEmail());
            // câu excuteUpdate trả về số lượng lượng cột bị ảnh hưởng?
            int check =preparedStatement.executeUpdate();
            return (check==1);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public String transaction() {
        String msg = "OK, transaction successfully!";
        Connection connection = BaseRepository.getConnectDB();
        Savepoint savepoint1=null;
        Savepoint savepoint2=null;
        try {
            connection.setAutoCommit(false);
            // thêm mới 1 type_of_class
            PreparedStatement pSInsertTypeOfClass =
                    connection.prepareStatement(
                            "insert into class_type (id, `name`)\n" +
                                    "values (?, ?)");
            pSInsertTypeOfClass.setString(1, "5");
            pSInsertTypeOfClass.setString(2, "Other5");

            int rowAffect = pSInsertTypeOfClass.executeUpdate();

            savepoint1= connection.setSavepoint();
            // thêm mới 1 class
            PreparedStatement pSInsertClass =
                    connection.prepareStatement(
                            "insert into class (`name`, class_type_id)\n" +
                                    "values (?, ?)");
            pSInsertClass.setString(1, "C10");
            pSInsertClass.setString(2, "1");

            rowAffect += pSInsertClass.executeUpdate();

            savepoint2= connection.setSavepoint();

            // thêm mới 1 học viên
            if (rowAffect == 2) {
                PreparedStatement pSInsertStudent
                        = connection.prepareStatement(
                        "insert into student(`name`, birthday, email, class_id) " +
                                "values (?, ?, ?, ?)");
                pSInsertStudent.setString(1, "Nguyen thành cônng1000 ");
                pSInsertStudent.setString(2, "2021-09-28");
                pSInsertStudent.setString(3, "thatbai100@gmail.com");
                pSInsertStudent.setString(4, "1000");

                rowAffect += pSInsertStudent.executeUpdate();
            }
            // kiểm tra nếu cả 3 hoạt động thêm mới thành công thì mới commit
            if (rowAffect == 3) {
                connection.commit();
            } else {
                msg = "rollback try";
                connection.rollback();
            }

        } catch (SQLException e) {
            try {
                msg = "rollback";
                connection.rollback(savepoint1);
                connection.commit();

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }


        return msg;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_BY_ID);
            callableStatement.setInt(1,id);
            return callableStatement.executeUpdate()>=1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public boolean login(String username, String pass) {
        String query = "select * from jame where `account` ="+"'"+username+"'"+" and password ="+pass;
        Connection connection = BaseRepository.getConnectDB();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()){
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
