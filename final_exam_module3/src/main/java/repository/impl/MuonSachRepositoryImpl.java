package repository.impl;

import model.Sach;
import model.TheMuonSach;
import repository.BaseRepository;
import repository.IMuonSachRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MuonSachRepositoryImpl implements IMuonSachRepository {

    private final String SELECT_ALL_MUONSACH = "select * from the_muon_sach;";
    @Override
    public List<TheMuonSach> selectAllTheMuonSach() {
        List<TheMuonSach> theMuonSachList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MUONSACH);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String maMuonSach = resultSet.getString("ma_muon_sach");
                String maSach = resultSet.getString("ma_sach");
                String maHocSinh = resultSet.getString("ma_hoc_sinh");
                boolean trangThai = resultSet.getBoolean("trang_thai");
                String ngayMuon = resultSet.getString("ngay_muon");
                String ngayTra = resultSet.getString("ngay_tra");
                theMuonSachList.add(new TheMuonSach(maMuonSach, maSach, maHocSinh, trangThai, ngayMuon, ngayTra));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return theMuonSachList;
    }

    @Override
    public boolean themMoiTheMuonSach(TheMuonSach theMuonSach) {
        return false;
    }
}
