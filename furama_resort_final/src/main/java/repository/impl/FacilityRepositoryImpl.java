package repository.impl;

import model.Facility;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepositoryImpl implements IFacilityRepository {

    private static final String SELECT_ALL_FACILITY = "select * from facility;";
    private static final String DELETE_FACILITY = "delete from facility where id = ?;";
    @Override
    public List<Facility> selectAllFacility() {
        // tạo array list lưu giữ liệu trả về từ database
        List<Facility> facilityList = new ArrayList<>();
        // kết nối tới database
        Connection connection = BaseRepository.getConnectDB();
        try {
            // PreparedStatement dùng để thực hiện câu truy vấn SQL
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY);
            // ResultSet duy trì một con trỏ, trỏ đến một hàng của một bảng. Ban đầu, con trỏ, trỏ đến hàng đầu tiên.
            // executeQuery() thực hiện truy vấn chọn. Nó trả về một thể hiện của ResultSet.
            ResultSet resultSet = preparedStatement.executeQuery();
            // resultSet.next() dùng để di chuyển con trỏ xuống dòng và lấy giữ liệu bằng resultSet.get
            while (resultSet.next()){
               int id = resultSet.getInt("id");
               String name = resultSet.getString("name");
               int area = resultSet.getInt("area");
               double cost = resultSet.getDouble("cost");
               int maxPeople = resultSet.getInt("max_people");
               int rentTypeId = resultSet.getInt("rent_type_id");
               int facilityTypeId = resultSet.getInt("facility_type_id");
               String standardRoom = resultSet.getString("standard_room");
               String description = resultSet.getString("description_other_convenience");
               double poolArea = resultSet.getDouble("pool_area");
               int numberOfFloors = resultSet.getInt("number_of_floors");
               String facilityFree = resultSet.getString("facility_free");
               // tạo đối tượng mới lưu vào array list sau mỗi vòng lặp
                facilityList.add(new Facility(id, name, area, cost, maxPeople, rentTypeId,
                        facilityTypeId, standardRoom, description, poolArea, numberOfFloors, facilityFree));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return facilityList;
    }

    @Override
    public Facility selectFacilityById(int id) {
        return null;
    }

    @Override
    public boolean insertFacility(Facility facility) {
        return false;
    }

    @Override
    public boolean updateFacility(Facility facility) {
        return false;
    }

    @Override
    public boolean deleteFacility(int id) {
        boolean rowDeleted;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FACILITY);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDeleted;
    }
}
