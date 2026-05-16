package com.lumiere.dao;

import com.lumiere.model.UserModel;
import com.lumiere.utils.DBconfig;
import com.lumiere.utils.PasswordUtil;
import java.sql.*;

public class UserDAO {

    public boolean registerUser(String firstName, String lastName, String username,
            String email, String password, String phone, String dob, String gender) throws Exception {
        String sql = "INSERT INTO users (first_name, last_name, username, email, password, phone, dob, gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, username);
            ps.setString(4, email);
            ps.setString(5, PasswordUtil.hashPassword(password));
            ps.setString(6, phone);
            ps.setString(7, dob);
            ps.setString(8, gender);
            return ps.executeUpdate() > 0;
        }
    }

    public UserModel getUserByUsername(String username) throws Exception {
        String sql = "SELECT * FROM users WHERE username = ?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserModel user = new UserModel();
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setDob(rs.getString("dob"));
                user.setGender(rs.getString("gender"));
                user.setRole(rs.getString("role"));
                return user;
            }
        }
        return null;
    }

    public boolean usernameExists(String username) throws Exception {
        String sql = "SELECT id FROM users WHERE username = ?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
    }

    public boolean emailExists(String email) throws Exception {
        String sql = "SELECT id FROM users WHERE email = ?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
    }
}