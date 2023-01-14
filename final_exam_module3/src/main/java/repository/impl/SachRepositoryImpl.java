package repository.impl;

import model.Sach;
import repository.ISachRepository;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class SachRepositoryImpl implements ISachRepository {
    private final String SELECT_ALL_SACH = "select * from sach;";
    @Override
    public List<Sach> selectAllBook() {
        List<Sach> sachList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SACH);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String maSach = resultSet.getString("ma_sach");
                String tenSach = resultSet.getString("ten_sach");
                String tacGia = resultSet.getString("tac_gia");
                String moTa = resultSet.getString("mo_ta");
                int soLuong = resultSet.getInt("so_luong");
                sachList.add(new Sach(maSach, tenSach, tacGia, moTa, soLuong));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return sachList;
    }

    @Override
    public Sach selectBookById(int id) {
        return null;
    }

}
