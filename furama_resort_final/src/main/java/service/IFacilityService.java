package service;

import model.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> selectAllFacility();

    Facility selectFacilityById(int id);

    boolean insertFacility(Facility facility);

    boolean updateFacility(Facility facility);

    boolean deleteFacility(int id);
}
