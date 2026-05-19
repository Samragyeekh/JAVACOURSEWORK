package com.lumiere.controller;

import com.lumiere.dao.CartDAO;
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

@WebServlet(asyncSupported = true, urlPatterns = { "/cart" })
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO = new CartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        UserModel user = (UserModel) session.getAttribute("user");
        List<ProductModel> cartItems = cartDAO.getCartItems(user.getId());

        double total = 0;
        for (ProductModel item : cartItems) {
            total += item.getPrice() * item.getQuantity();
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("total", total);
        request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
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
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        int productId = Integer.parseInt(productIdParam);

        if ("add".equals(action)) {
            int quantity = 1;
            String qtyParam = request.getParameter("quantity");
            if (qtyParam != null && !qtyParam.isEmpty()) {
                quantity = Integer.parseInt(qtyParam);
            }
            cartDAO.addToCart(user.getId(), productId, quantity);
        } else if ("remove".equals(action)) {
            cartDAO.removeFromCart(user.getId(), productId);
        } else if ("clear".equals(action)) {
            cartDAO.clearCart(user.getId());
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }
}