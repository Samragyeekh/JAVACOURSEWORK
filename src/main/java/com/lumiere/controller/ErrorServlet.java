package com.lumiere.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ErrorServlet")
public class ErrorServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleError(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleError(request, response);
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Integer statusCode = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
        if (statusCode == null) statusCode = 500;

        request.setAttribute("jakarta.servlet.error.status_code", statusCode);
        request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
    }
}