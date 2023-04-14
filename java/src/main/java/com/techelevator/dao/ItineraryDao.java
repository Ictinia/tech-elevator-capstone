package com.techelevator.dao;

import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryDto;

import java.time.LocalDate;
import java.util.List;

public interface ItineraryDao {
    int getNextId ();
    List<Itinerary> getUserItineraries (int userId);
    Itinerary get (int id);
    void create (ItineraryDto itinerary);
    void update (int id, ItineraryDto itineraryDto);
    void delete (int id);
}