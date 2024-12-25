package com.dao;
import java.util.*;
import com.model.Train;
import com.utility.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class TrainDAO {
    public Train getTrainDetails(long trainNumber) {
        Train train = null;
        try {
            Connection con = DBConnection.getCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM train6 WHERE tr_no = ?");
            ps.setLong(1, trainNumber);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                train = new Train();
                train.setTrainName(rs.getString("tr_name"));
                train.setTrainNumber(rs.getLong("tr_no"));
                train.setFromStation(rs.getString("from_Stn"));
                train.setToStation(rs.getString("to_Stn"));
                train.setAvailableSeats(rs.getLong("available"));
                train.setFare(rs.getLong("fare"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return train;
    }
    public boolean addTrain(Train train) {
        boolean isAdded = false;
        try (Connection con = DBConnection.getCon()) {
            String query = "INSERT INTO train6 (tr_no, tr_name, from_Stn, to_Stn, available, fare) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setLong(1, train.getTrainNumber());
            ps.setString(2, train.getTrainName());
            ps.setString(3, train.getFromStation());
            ps.setString(4, train.getToStation());
            ps.setLong(5, train.getAvailableSeats());
            ps.setLong(6, train.getFare());

            int rowsAffected = ps.executeUpdate();
            isAdded = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdded;
    }
    public boolean cancelTrain(long trainNumber) {
        boolean isCancelled = false;
        try (Connection con = DBConnection.getCon()) {
            String query = "DELETE FROM train6 WHERE tr_no = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setLong(1, trainNumber);

            int rowsAffected = ps.executeUpdate();
            isCancelled = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isCancelled;
    }
    

    public boolean updateAvailableSeats(long trainNumber, long newAvailableSeats) {
        try {
            Connection con = DBConnection.getCon();
            PreparedStatement ps = con.prepareStatement("UPDATE train6 SET available = ? WHERE tr_no = ?");
            ps.setLong(1, newAvailableSeats);
            ps.setLong(2, trainNumber);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<String> getStations() {
        List<String> stations = new ArrayList<>();
        try (Connection con = DBConnection.getCon()) {
            PreparedStatement ps = con.prepareStatement("SELECT DISTINCT from_stn, to_stn FROM train6");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String fromStation = rs.getString("from_stn");
                String toStation = rs.getString("to_stn");
                
                // Add both stations if they're not already added
                if (!stations.contains(fromStation)) {
                    stations.add(fromStation);
                }
                if (!stations.contains(toStation)) {
                    stations.add(toStation);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stations;
    }

    // Fetch train details based on from and to stations
    
    public List<Train> getAllTrains() {
        List<Train> trainList = new ArrayList<>();
        try (Connection con = DBConnection.getCon()) {
            String query = "SELECT * FROM train6";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Train train = new Train();
                train.setTrainNumber(rs.getInt("tr_no"));
                train.setTrainName(rs.getString("tr_name"));
                train.setFromStation(rs.getString("from_stn"));
                train.setToStation(rs.getString("to_stn"));
                train.setAvailableSeats(rs.getInt("available"));
                train.setFare(rs.getInt("fare"));
                trainList.add(train);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return trainList;
    }

    public List<Train> getTrainsByStations(String fromStation, String toStation) {
        List<Train> trainList = new ArrayList<>();
        try (Connection con = DBConnection.getCon()) {
            String query = "SELECT * FROM train6 WHERE from_stn = ? AND to_stn = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, fromStation);
            ps.setString(2, toStation);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Train train = new Train();
                train.setTrainNumber(rs.getInt("tr_no"));
                train.setTrainName(rs.getString("tr_name"));
                train.setFromStation(rs.getString("from_stn"));
                train.setToStation(rs.getString("to_stn"));
                train.setAvailableSeats(rs.getInt("available"));
                train.setFare(rs.getInt("fare"));
                trainList.add(train);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return trainList;
    }

}