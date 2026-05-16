package com.lumiere.service;

import com.lumiere.dao.UserDAO;
import com.lumiere.model.UserModel;
import com.lumiere.utils.PasswordUtil;

public class LoginService {
    private UserDAO userDAO = new UserDAO();

    public UserModel login(String username, String password) throws Exception {
        UserModel user = userDAO.getUserByUsername(username);
        if (user == null) return null;
        if (PasswordUtil.checkPassword(password, user.getPassword())) return user;
        return null;
    }
}