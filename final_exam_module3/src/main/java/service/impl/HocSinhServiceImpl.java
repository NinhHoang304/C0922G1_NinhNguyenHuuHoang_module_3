package service.impl;

import model.HocSinh;
import repository.IHocSinhRepository;
import repository.impl.HocSinhRepositoryImpl;
import service.IHocSinhService;

import java.util.List;

public class HocSinhServiceImpl implements IHocSinhService {
    private final IHocSinhRepository hocSinhRepository = new HocSinhRepositoryImpl();
    @Override
    public List<HocSinh> selectAllHocSinh() {
        return this.hocSinhRepository.selectAllHocSinh();
    }
}
