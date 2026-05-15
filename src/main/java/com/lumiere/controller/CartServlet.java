package com.lumiere.controller;

import com.lumiere.dao.CartDAO;
import com.lumiere.model.ProductModel;
import com.lumiere.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = { "/cart" })
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        try {
            CartDAO dao = new CartDAO();
            List<ProductModel> cartItems = dao.getCartItems(user.getId());
            request.setAttribute("cartItems", cartItems);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
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
            CartDAO dao = new CartDAO();
            if ("add".equals(action)) {
                dao.addToCart(user.getId(), productId, 1);
            } else if ("remove".equals(action)) {
                dao.removeFromCart(user.getId(), productId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}