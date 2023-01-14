package service;

import model.TheMuonSach;

import java.util.List;

public interface IMuonSachService {
    List<TheMuonSach> selectAllTheMuonSach();

    boolean themMoiTheMuonSach(TheMuonSach theMuonSach);
}
