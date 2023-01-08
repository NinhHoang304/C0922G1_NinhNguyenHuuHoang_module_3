package repository;

import model.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> selectAllFacility();

    Facility selectFacilityById(int id);

    boolean insertFacility(Facility facility);

    boolean updateFacility(Facility facility);

    boolean deleteFacility(int id);
}
