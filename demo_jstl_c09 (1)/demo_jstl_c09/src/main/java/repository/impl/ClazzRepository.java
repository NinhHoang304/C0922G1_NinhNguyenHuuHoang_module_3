package repository.impl;

import model.Clazz;
import repository.BaseRepository;
import repository.IClazzRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClazzRepository implements IClazzRepository {
    @Override
    public List<Clazz> findByAll() {
        List<Clazz> clazzList = new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from clazz;");
            ResultSet resultSet =preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Clazz clazz = new Clazz(id,name);
                clazzList.add(clazz);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return clazzList;
    }
}
