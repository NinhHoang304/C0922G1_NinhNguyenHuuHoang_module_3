package service;

import model.Sach;

import java.util.List;

public interface ISachService {

    List<Sach> selectAllBook();

    Sach selectBookById(int id);

}
