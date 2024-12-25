package com.dao;

import java.sql.*;
import com.model.User;
import com.utility.DBConnection;

public class UserDAO {

    public static User authenticateUser(String uname, String pword) {
        User user = null;
        try (Connection con = DBConnection.getCon();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM register WHERE uname = ? AND pword = ?")) {
            
            ps.setString(1, uname);
            ps.setString(2, pword);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                user = extractUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public static boolean updateUser(User user) {
        boolean status = false;
        try (Connection con = DBConnection.getCon();
             PreparedStatement ps = con.prepareStatement(
                "UPDATE register SET pword=?, fname=?, lname=?, addr=?, phno=?, mailid=? WHERE uname=?")) {
            
            ps.setString(1, user.getPWord());
            ps.setString(2, user.getFName());
            ps.setString(3, user.getLName());
            ps.setString(4, user.getAddr());
            ps.setLong(5, user.getPhNo());
            ps.setString(6, user.getMailId());
            ps.setString(7, user.getUName());

            int result = ps.executeUpdate();
            status = result == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public static boolean registerUser(User user) {
        boolean status = false;
        try (Connection con = DBConnection.getCon();
             PreparedStatement ps = con.prepareStatement(
                "INSERT INTO register (uname, pword, fname, lname, addr, phno, mailid) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
            
            ps.setString(1, user.getUName());
            ps.setString(2, user.getPWord());
            ps.setString(3, user.getFName());
            ps.setString(4, user.getLName());
            ps.setString(5, user.getAddr());
            ps.setLong(6, user.getPhNo());
            ps.setString(7, user.getMailId());
            int result = ps.executeUpdate();
            status = result == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public User getUserByUsername(String username) {
        User user = null;
        try (Connection con = DBConnection.getCon();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM register WHERE uname=?")) {
            
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = extractUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    private static User extractUserFromResultSet(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUName(rs.getString("uname"));
        user.setPWord(rs.getString("pword"));
        user.setFName(rs.getString("fname"));
        user.setLName(rs.getString("lname"));
        user.setAddr(rs.getString("addr"));
        user.setPhNo(rs.getLong("phno"));
        user.setMailId(rs.getString("mailid"));
        return user;
    }
}