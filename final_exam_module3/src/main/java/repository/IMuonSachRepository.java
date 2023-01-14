package repository;

import model.TheMuonSach;

import java.util.List;

public interface IMuonSachRepository {
    List<TheMuonSach> selectAllTheMuonSach();

    boolean themMoiTheMuonSach(TheMuonSach theMuonSach);
}
