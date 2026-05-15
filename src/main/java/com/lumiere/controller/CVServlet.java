package com.lumiere.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;  // ← Must have this import
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cv")  // ← Must have the slash
public class CVServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String jspPath = null;
        
        if ("ellie".equals(name)) {
            jspPath = "/WEB-INF/pages/ellie-cv.jsp";  // ← Direct path since JSP is in root
        } else if ("smriti".equals(name)) {
            jspPath = "/WEB-INF/pages/smriti-cv.jsp";
        } else if ("samragyee".equals(name)) {
            jspPath = "/WEB-INF/pages/samragyee-cv.jsp";
        } else if ("abhishek".equals(name)) {
            jspPath = "/WEB-INF/pages/abhishek-cv.jsp";
        } else {
            response.sendError(404, "CV not found");
            return;
        }
        
        request.getRequestDispatcher(jspPath).forward(request, response);
    }
}