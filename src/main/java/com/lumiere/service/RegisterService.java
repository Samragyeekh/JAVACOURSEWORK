package com.lumiere.service;

import com.lumiere.dao.UserDAO;

public class RegisterService {
    private UserDAO userDAO = new UserDAO();

    public boolean usernameExists(String username) throws Exception {
        return userDAO.usernameExists(username);
    }

    public boolean emailExists(String email) throws Exception {
        return userDAO.emailExists(email);
    }

    public boolean register(String firstName, String lastName, String username,
            String email, String password, String phone, String dob, String gender) throws Exception {
        return userDAO.registerUser(firstName, lastName, username,
                email, password, phone, dob, gender);
    }
}