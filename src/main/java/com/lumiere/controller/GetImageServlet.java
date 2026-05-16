package com.lumiere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.File;
import java.nio.file.Files;

/**
 * Servlet implementation class GetImage
 */
@WebServlet("/getimage")
public class GetImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "webapp_uploads";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name"); 
        
        if (name == null || name.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing name parameter");
            return;
        }

        File folder = new File(UPLOAD_DIR);
        if (!folder.exists() || !folder.isDirectory()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Storage directory not found");
            return;
        }

        // 1. Search for the unique file
        // Since 'name' is unique, we look for the first file that starts with "name."
        File[] matches = folder.listFiles((dir, fileName) -> fileName.startsWith(name + "."));

        // 2. Validate the match
        if (matches != null && matches.length > 0) {
            File imageFile = matches[0]; // The unique image for this user

            // 3. Determine MIME type and Set Headers
            String contentType = getServletContext().getMimeType(imageFile.getName());
            if (contentType == null) contentType = "image/jpeg"; // Fallback
            
            response.setContentType(contentType);
            response.setContentLength((int) imageFile.length());

            // 4. Stream the data
            Files.copy(imageFile.toPath(), response.getOutputStream());
        } else {
            // If no file matches the unique name, return 404
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found for user: " + name);
        }
    }
}