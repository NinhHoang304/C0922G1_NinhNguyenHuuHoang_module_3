package service.impl;

import model.Clazz;
import repository.IClazzRepository;
import repository.impl.ClazzRepository;
import service.IClazzService;

import java.util.List;

public class ClazzService implements IClazzService {
    IClazzRepository clazzRepository = new ClazzRepository();
    @Override
    public List<Clazz> findByAll() {
        return clazzRepository.findByAll();
    }
}
