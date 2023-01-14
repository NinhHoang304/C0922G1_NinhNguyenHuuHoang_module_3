package repository;

import model.Sach;

import java.util.List;

public interface ISachRepository {

    List<Sach> selectAllBook();

    Sach selectBookById(int id);
}
