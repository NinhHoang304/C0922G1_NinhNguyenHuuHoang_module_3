package service.impl;

import model.Sach;
import repository.ISachRepository;
import repository.impl.SachRepositoryImpl;
import service.ISachService;

import java.util.List;

public class SachServiceImpl implements ISachService {
    private final ISachRepository sachRepository = new SachRepositoryImpl();
    @Override
    public List<Sach> selectAllBook() {
        return this.sachRepository.selectAllBook();
    }

    @Override
    public Sach selectBookById(int id) {
        return null;
    }

}
