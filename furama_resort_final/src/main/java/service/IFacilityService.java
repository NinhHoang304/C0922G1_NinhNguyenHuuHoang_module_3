package service;

import model.Facility;
import model.FacilityType;
import model.RentType;

import java.util.List;

public interface IFacilityService {
    List<Facility> selectAllFacility();

    List<FacilityType> selectAllFacilityType();

    List<RentType> selectAllRentType();

    Facility selectFacilityById(int id);

    boolean insertFacility(Facility facility);

    boolean updateFacility(Facility facility);

    boolean deleteFacility(int id);
}
