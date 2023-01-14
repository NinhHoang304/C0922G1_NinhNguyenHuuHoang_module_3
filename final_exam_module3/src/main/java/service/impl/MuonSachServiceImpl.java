package service.impl;

import model.TheMuonSach;
import repository.IMuonSachRepository;
import repository.impl.MuonSachRepositoryImpl;
import service.IMuonSachService;

import java.util.List;

public class MuonSachServiceImpl implements IMuonSachService {
    private final IMuonSachRepository muonSachRepository = new MuonSachRepositoryImpl();
    @Override
    public List<TheMuonSach> selectAllTheMuonSach() {
        return this.muonSachRepository.selectAllTheMuonSach();
    }

    @Override
    public boolean themMoiTheMuonSach(TheMuonSach theMuonSach) {
        return this.themMoiTheMuonSach(theMuonSach);
    }
}
