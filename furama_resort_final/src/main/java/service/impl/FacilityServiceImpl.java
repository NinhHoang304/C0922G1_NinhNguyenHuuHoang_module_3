package service.impl;

import model.Facility;
import model.FacilityType;
import model.RentType;
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
    public List<FacilityType> selectAllFacilityType() {
        return this.facilityRepository.selectAllFacilityType();
    }

    @Override
    public List<RentType> selectAllRentType() {
        return this.facilityRepository.selectAllRentType();
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
        return this.facilityRepository.deleteFacility(id);
    }
}
