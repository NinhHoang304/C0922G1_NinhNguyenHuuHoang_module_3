package repository.impl;

import model.HocSinh;
import model.TheMuonSach;
import repository.BaseRepository;
import repository.IHocSinhRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HocSinhRepositoryImpl implements IHocSinhRepository {
    private final String SELECT_ALL_HOCSINH = "select * from hoc_sinh;";
    @Override
    public List<HocSinh> selectAllHocSinh() {
        List<HocSinh> hocSinhList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_HOCSINH);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String maHocSinh = resultSet.getString("ma_hoc_sinh");
                String hoTen = resultSet.getString("ho_ten");
                String lop = resultSet.getString("lop");
                hocSinhList.add(new HocSinh(maHocSinh, hoTen, lop));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return hocSinhList;
    }
}
