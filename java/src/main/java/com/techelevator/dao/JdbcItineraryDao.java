package com.techelevator.dao;

import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryDto;
import com.techelevator.model.Landmark;
import com.techelevator.model.LandmarkIdDto;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.validation.beanvalidation.SpringValidatorAdapter;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcItineraryDao implements ItineraryDao {
    JdbcTemplate jdbcTemplate = new JdbcTemplate();

    public JdbcItineraryDao(JdbcTemplate jdbcTemplate) {this.jdbcTemplate = jdbcTemplate;}

    @Override
    public int getNextId() {
        return 0;
    }

    @Override
    public List<Itinerary> getUserItineraries(int userId) {
        final List<Itinerary> itineraries = new ArrayList<>();
        final String sql = "SELECT itinerary_id, user_id, name, date FROM itineraries WHERE user_id = ? ORDER BY itinerary_id;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            itineraries.add(mapRowToItinerary(results));
        }
        return itineraries;
    }

    @Override
    public Itinerary get(int itineraryId, int userId) {
        String sql = "SELECT itinerary_id, user_id, name, date FROM itineraries WHERE itinerary_id = ? AND user_id = ?;";
        String landmarksSql = "SELECT landmarks.landmark_id, name, category, description, phone, address, thumbs_up, thumbs_down, approved, hero_img, latitude, longitude, map_link, sequence_number\n" +
                "FROM landmarks\n" +
                "JOIN itinerary_details ON landmarks.landmark_id = itinerary_details.landmark_id \n" +
                "WHERE itin_id = ?\n" +
                "ORDER BY sequence_number ASC;";
        final SqlRowSet results = jdbcTemplate.queryForRowSet(sql, itineraryId, userId);
        if (!results.next()) {
            return null;
        }
        Itinerary itinerary = this.mapRowToItinerary(results);

        SqlRowSet landmarksRs = this.jdbcTemplate.queryForRowSet(landmarksSql, itineraryId);
        List<Landmark> landmarks = new ArrayList<>();
        while (landmarksRs.next()) {
            Landmark landmark = new Landmark();
            landmark.setId(landmarksRs.getInt("landmark_id"));
            landmark.setName(landmarksRs.getString("name"));
            landmark.setCategory(landmarksRs.getString("category"));
            landmark.setDescription(landmarksRs.getString("description"));
            landmark.setPhone(landmarksRs.getString("phone"));
            landmark.setAddress(landmarksRs.getString("address"));
            landmark.setThumbsUp(landmarksRs.getInt("thumbs_up"));
            landmark.setThumbsDown(landmarksRs.getInt("thumbs_down"));
            landmark.setApproved(landmarksRs.getBoolean("approved"));
            landmark.setHeroImg(landmarksRs.getString("hero_img"));
            landmark.setLatitude(landmarksRs.getBigDecimal("latitude"));
            landmark.setLongitude(landmarksRs.getBigDecimal("longitude"));
            landmark.setMapLink(landmarksRs.getString("map_link"));

            landmarks.add(landmark);
        }
        itinerary.setLandmarks(landmarks);
        return itinerary;
    }

    @Override
    public void createItinerary(ItineraryDto itinerary, int userId) {
        String sql = "INSERT INTO itineraries (user_id, name, date) VALUES (?, ?, ?);";
        jdbcTemplate.update(sql, userId, itinerary.getName(), itinerary.getDate());
    }

    @Override
    public void delete(int itineraryId, int userId) {
        String sql = "SELECT user_id from itineraries WHERE itinerary_id = ?";
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, itineraryId);
        int id = -1;
        if (rs.next()) {
            id = rs.getInt("user_id");
        }

        if (id == userId) {
            String sql1 = "DELETE FROM itinerary_details WHERE itin_id = ?;";
            jdbcTemplate.update(sql1, itineraryId);

            String sql2 = "DELETE FROM itineraries WHERE itinerary_id = ? AND user_id = ?;";
            jdbcTemplate.update(sql2, itineraryId, userId);
        }
    }

    @Override
    public void updateItinerary(int itineraryId, Itinerary itinerary, int userId) {
        String updateSql = "UPDATE itineraries SET name = ?, date = ? WHERE itinerary_id = ? AND user_id = ?;";
        jdbcTemplate.update(updateSql, itinerary.getName(), itinerary.getDate(), itineraryId, userId);

        String sql = "DELETE FROM itinerary_details WHERE itin_id = ?;";
        jdbcTemplate.update(sql, itineraryId);

        if (itinerary.getLandmarks().size() > 0) {
            int sequenceNumber = 1;
            StringBuilder values = new StringBuilder("");
            for (Landmark l : itinerary.getLandmarks()) {
                values.append(String.format("(%d, %d, %d),", itineraryId, l.getId(), sequenceNumber));
                sequenceNumber++;
                System.out.println(sequenceNumber);
            }
        values.deleteCharAt(values.length()-1);
           String insertSql = String.format("INSERT INTO itinerary_details (itin_id, landmark_id, sequence_number) VALUES %s;", values.toString());
           jdbcTemplate.update(insertSql);
           System.out.println(insertSql);
        }
    }


    public Itinerary mapRowToItinerary(SqlRowSet result) {
        Itinerary itinerary = new Itinerary();
        itinerary.setId(result.getInt("itinerary_id"));
        itinerary.setUserId(result.getInt("user_id"));
        itinerary.setName(result.getString("name"));
        if (result.getDate("date").toLocalDate() != null) {
            itinerary.setDate(result.getDate("date").toLocalDate());
        }
        return itinerary;
    }
}
