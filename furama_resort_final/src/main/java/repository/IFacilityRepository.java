package repository;

import model.Facility;
import model.FacilityType;
import model.RentType;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> selectAllFacility();

    List<FacilityType> selectAllFacilityType();

    List<RentType> selectAllRentType();

    Facility selectFacilityById(int id);

    boolean insertFacility(Facility facility);

    boolean updateFacility(Facility facility);

    boolean deleteFacility(int id);
}
