package com.lumiere.controller;

import com.lumiere.dao.WishlistDAO;
import com.lumiere.model.ProductModel;
import com.lumiere.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = { "/wishlist" })
public class WishlistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        try {
            WishlistDAO dao = new WishlistDAO();
            List<ProductModel> wishlistItems = dao.getWishlistItems(user.getId());
            request.setAttribute("wishlistItems", wishlistItems);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/pages/wishlist.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId"));
        try {
            WishlistDAO dao = new WishlistDAO();
            if ("add".equals(action)) {
                dao.addToWishlist(user.getId(), productId);
            } else if ("remove".equals(action)) {
                dao.removeFromWishlist(user.getId(), productId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/wishlist");
    }
}