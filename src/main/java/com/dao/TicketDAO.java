package com.dao;

import com.model.Ticket;
import com.utility.DBConnection;

import java.sql.*;
import java.util.*;
import java.util.Random;

public class TicketDAO {

    // Method to generate a unique PNR
    private String generateUniquePNR(Connection con) throws SQLException {
        Random random = new Random();
        String pnr;
        boolean isUnique;

        do {
            pnr = String.valueOf(10000 + random.nextInt(90000));  // Generate a 5-digit random PNR
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM ticket2 WHERE pnr = ?");
            ps.setString(1, pnr);
            ResultSet rs = ps.executeQuery();
            rs.next();
            isUnique = rs.getInt(1) == 0; // Ensure the PNR is unique
        } while (!isUnique);

        return pnr;
    }

    // Method to book a ticket
    public boolean bookTicket(Ticket ticket) throws SQLException {
        boolean isBooked = false;

        try (Connection con = DBConnection.getCon()) {
            // Fetch train details
            PreparedStatement fetchTrainStmt = con.prepareStatement("SELECT * FROM train6 WHERE tr_no = ?");
            fetchTrainStmt.setLong(1, ticket.getTrainNumber());
            ResultSet rs = fetchTrainStmt.executeQuery();

            if (rs.next()) {
                String trainName = rs.getString("tr_name");
                String fromStation = rs.getString("from_stn");
                String toStation = rs.getString("to_stn");
                int availableSeats = rs.getInt("available");

                if (ticket.getSeatCount() <= availableSeats) {
                    // Update available seats
                    int updatedSeats = availableSeats - ticket.getSeatCount();
                    PreparedStatement updateSeatsStmt = con.prepareStatement("UPDATE train6 SET available = ? WHERE tr_no = ?");
                    updateSeatsStmt.setInt(1, updatedSeats);
                    updateSeatsStmt.setLong(2, ticket.getTrainNumber());
                    updateSeatsStmt.executeUpdate();

                    // Generate PNR
                    String pnr = generateUniquePNR(con);

                    // Insert ticket details
                    PreparedStatement insertTicketStmt = con.prepareStatement(
                        "INSERT INTO ticket2 (pnr, tr_number, tr_name, from_stn, to_stn, seat) VALUES (?, ?, ?, ?, ?, ?)");
                    insertTicketStmt.setString(1, pnr);
                    insertTicketStmt.setLong(2, ticket.getTrainNumber());
                    insertTicketStmt.setString(3, trainName);	
                    insertTicketStmt.setString(4, fromStation);
                    insertTicketStmt.setString(5, toStation);
                    insertTicketStmt.setInt(6, ticket.getSeatCount());

                    int rowsInserted = insertTicketStmt.executeUpdate();
                    if (rowsInserted > 0) {
                        ticket.setPnr(pnr);  // Set the generated PNR
                        isBooked = true;
                    }
                }
            }
        }

        return isBooked;
    }
    public Ticket getTicketByPNR(String pnr) {
        Ticket ticket = null;

        try (Connection con = DBConnection.getCon()) {
            String query = "SELECT * FROM ticket2 WHERE pnr = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, pnr);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ticket = new Ticket();
                ticket.setPnr(rs.getString("pnr"));
                ticket.setTrainNumber(rs.getInt("tr_number"));
                ticket.setTrainName(rs.getString("tr_name"));
                ticket.setFromStation(rs.getString("from_stn"));
                ticket.setToStation(rs.getString("to_stn"));
                ticket.setSeatCount(rs.getInt("seat"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ticket;
    }
    
    public boolean cancelTicket(String pnr) throws Exception {
    	Connection con = DBConnection.getCon();
        boolean isCancelled = false;

        // Check if the ticket exists
        String queryCheck = "SELECT * FROM ticket3 WHERE pnr = ?";
        PreparedStatement psCheck = con.prepareStatement(queryCheck);
        psCheck.setString(1, pnr);
        ResultSet rs = psCheck.executeQuery();

        if (rs.next()) {
            int trainNumber = rs.getInt("tr_number");
            int seatToRelease = rs.getInt("seat");

            // Delete the ticket from ticket2
            String queryDelete = "DELETE FROM ticket3 WHERE pnr = ?";
            PreparedStatement psDelete = con.prepareStatement(queryDelete);
            psDelete.setString(1, pnr);
            psDelete.executeUpdate();

            // Update the available seats in train6
            String queryUpdate = "UPDATE train6 SET available = available + ? WHERE tr_no = ?";
            PreparedStatement psUpdate = con.prepareStatement(queryUpdate);
            psUpdate.setInt(1, seatToRelease);
            psUpdate.setInt(2, trainNumber);
            psUpdate.executeUpdate();

            isCancelled = true;
        }

        return isCancelled;
    }
    
    public boolean bookTicket1(Ticket ticket) {
        boolean isBooked = false;
        
        try (Connection con = DBConnection.getCon()) {
            // Fetch train details
            PreparedStatement fetchTrainStmt = con.prepareStatement("SELECT * FROM train6 WHERE tr_no = ?");
            fetchTrainStmt.setLong(1, ticket.getTrainNumber());
            ResultSet rs = fetchTrainStmt.executeQuery();
            
            if (rs.next()) {
                String trainName = rs.getString("tr_name");
                String fromStation = rs.getString("from_stn");
                String toStation = rs.getString("to_stn");
                int availableSeats = rs.getInt("available");

                if (ticket.getSeatCount() <= availableSeats) {
                    // Update available seats
                    int updatedSeats = availableSeats - ticket.getSeatCount();
                    PreparedStatement updateSeatsStmt = con.prepareStatement("UPDATE train6 SET available = ? WHERE tr_no = ?");
                    updateSeatsStmt.setInt(1, updatedSeats);
                    updateSeatsStmt.setLong(2, ticket.getTrainNumber());
                    updateSeatsStmt.executeUpdate();

                    // Generate PNR
                    String pnr = generateUniquePNR(con);

                    // Insert ticket details into ticket3 table
                    String query = "INSERT INTO ticket3 (pnr, tr_number, tr_name, from_stn, to_stn, seat, uname) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement ps = con.prepareStatement(query)) {
                        ps.setString(1, pnr);
                        ps.setLong(2, ticket.getTrainNumber());
                        ps.setString(3, trainName);
                        ps.setString(4, fromStation);
                        ps.setString(5, toStation);
                        ps.setInt(6, ticket.getSeatCount());
                        ps.setString(7, ticket.getUname());

                        int rowsInserted = ps.executeUpdate();
                        if (rowsInserted > 0) {
                            ticket.setPnr(pnr);  // Set the generated PNR
                            isBooked = true;
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isBooked;
    }

    
    public List<Ticket> getTicketsByUser(String uname) {
        List<Ticket> tickets = new ArrayList<>();
        String query = "SELECT * FROM ticket3 WHERE uname = ?";
        try (Connection con = DBConnection.getCon();
                PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setPnr(rs.getString("pnr"));
                ticket.setTrainNumber(rs.getInt("tr_number"));
                ticket.setTrainName(rs.getString("tr_name"));
                ticket.setFromStation(rs.getString("from_stn"));
                ticket.setToStation(rs.getString("to_stn"));
                ticket.setSeatCount(rs.getInt("seat"));
                tickets.add(ticket);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tickets;
    }
}