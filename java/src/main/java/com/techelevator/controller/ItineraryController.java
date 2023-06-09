package com.techelevator.controller;

import com.techelevator.dao.ItineraryDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryDto;
import com.techelevator.model.LandmarkIdDto;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.security.Principal;
import java.util.List;

@CrossOrigin
@PreAuthorize("hasAnyRole('ADMIN', 'USER')")
@RestController
public class ItineraryController {
    private ItineraryDao itineraryDao;
    private final UserDao userDao;

    public ItineraryController(ItineraryDao itineraryDao, UserDao userDao) {
        this.itineraryDao = itineraryDao;
        this.userDao = userDao;
    }

    /**
     *
     * @param principal
     * @return List<Itinerary> list of the user's itineraries
     */
    @ResponseStatus(HttpStatus.OK)
    @GetMapping(path = "/itinerary")
    public List<Itinerary> getUserItineraries(Principal principal) {
        final int userId = userDao.findIdByUsername(principal.getName());
        return itineraryDao.getUserItineraries(userId);
    }


    @ResponseStatus(HttpStatus.OK)
    @GetMapping(path = "/itinerary/{itineraryId}")
    public Itinerary getItineraryById(@PathVariable int itineraryId, Principal principal) {
        final int userId = userDao.findIdByUsername(principal.getName());
        final Itinerary itinerary = itineraryDao.get(itineraryId, userId);
        if (itinerary == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        return itinerary;
    }

    // Create a new itinerary
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping(path = "/itinerary")
    public void create(@RequestBody ItineraryDto itineraryDto, Principal principal) {
        final int userId = userDao.findIdByUsername(principal.getName());
        itineraryDao.createItinerary(itineraryDto, userId);
    }

    // Save itinerary after changes a destination
    @ResponseStatus(HttpStatus.OK)
    @PutMapping(path = "itinerary/{itineraryId}")
    public void update(@PathVariable int itineraryId, @RequestBody Itinerary itinerary, Principal principal) {
        final int userId = userDao.findIdByUsername(principal.getName());
        itineraryDao.updateItinerary(itineraryId, itinerary, userId);
    }

    // Delete an itinerary
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @DeleteMapping(path = "/itinerary/{itineraryId}")
    public void delete(@PathVariable int itineraryId, Principal principal) {
        final int userId = userDao.findIdByUsername(principal.getName());
        itineraryDao.delete(itineraryId, userId);
    }
}
