package com.lumiere.dao;

import com.lumiere.model.ProductModel;
import com.lumiere.utils.DBconfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    public boolean addToCart(int userId, int productId, int quantity) throws Exception {
        String check = "SELECT id, quantity FROM shopping_cart WHERE user_id=? AND product_id=?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(check)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int newQty = rs.getInt("quantity") + quantity;
                String update = "UPDATE shopping_cart SET quantity=? WHERE id=?";
                try (PreparedStatement ps2 = conn.prepareStatement(update)) {
                    ps2.setInt(1, newQty);
                    ps2.setInt(2, rs.getInt("id"));
                    return ps2.executeUpdate() > 0;
                }
            } else {
                String insert = "INSERT INTO shopping_cart (user_id, product_id, quantity) VALUES (?, ?, ?)";
                try (PreparedStatement ps2 = conn.prepareStatement(insert)) {
                    ps2.setInt(1, userId);
                    ps2.setInt(2, productId);
                    ps2.setInt(3, quantity);
                    return ps2.executeUpdate() > 0;
                }
            }
        }
    }

    public List<ProductModel> getCartItems(int userId) throws Exception {
        List<ProductModel> list = new ArrayList<>();
        String sql = "SELECT p.*, c.quantity FROM products p JOIN shopping_cart c ON p.id = c.product_id WHERE c.user_id=?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductModel p = new ProductModel();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setImageUrl(rs.getString("image_url"));
                p.setStock(rs.getInt("quantity"));
                list.add(p);
            }
        }
        return list;
    }

    public boolean removeFromCart(int userId, int productId) throws Exception {
        String sql = "DELETE FROM shopping_cart WHERE user_id=? AND product_id=?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            return ps.executeUpdate() > 0;
        }
    }
}