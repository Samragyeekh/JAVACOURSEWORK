package com.lumiere.controller;

import com.lumiere.dao.WishlistDAO;
import com.lumiere.model.ProductModel;
import com.lumiere.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = { "/wishlist" })
public class WishlistServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private WishlistDAO wishlistDAO = new WishlistDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        UserModel user = (UserModel) session.getAttribute("user");
        List<ProductModel> wishlistItems = wishlistDAO.getWishlistItems(user.getId());

        request.setAttribute("wishlistItems", wishlistItems);
        request.getRequestDispatcher("/WEB-INF/pages/wishlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        UserModel user = (UserModel) session.getAttribute("user");
        String action = request.getParameter("action");
        String productIdParam = request.getParameter("productId");

        if (productIdParam == null || productIdParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/wishlist");
            return;
        }

        int productId = Integer.parseInt(productIdParam);

        if ("add".equals(action)) {
            wishlistDAO.addToWishlist(user.getId(), productId);
        } else if ("remove".equals(action)) {
            wishlistDAO.removeFromWishlist(user.getId(), productId);
        }

        response.sendRedirect(request.getContextPath() + "/wishlist");
    }
}