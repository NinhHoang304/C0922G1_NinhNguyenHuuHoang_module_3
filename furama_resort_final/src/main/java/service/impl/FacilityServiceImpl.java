package service.impl;

import model.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepositoryImpl;
import service.IFacilityService;

import java.util.List;

public class FacilityServiceImpl implements IFacilityService {
    private final IFacilityRepository facilityRepository = new FacilityRepositoryImpl();

    @Override
    public List<Facility> selectAllFacility() {
        return this.facilityRepository.selectAllFacility();
    }

    @Override
    public Facility selectFacilityById(int id) {
        return null;
    }

    @Override
    public boolean insertFacility(Facility facility) {
        return false;
    }

    @Override
    public boolean updateFacility(Facility facility) {
        return false;
    }

    @Override
    public boolean deleteFacility(int id) {
        return false;
    }
}
