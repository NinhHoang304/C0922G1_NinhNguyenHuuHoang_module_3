package repository;

import model.HocSinh;

import java.util.List;

public interface IHocSinhRepository {
    List<HocSinh> selectAllHocSinh();
}
