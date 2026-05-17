package com.lumiere.dao;

import com.lumiere.model.ProductModel;
import com.lumiere.utils.DBconfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WishlistDAO {

    public boolean addToWishlist(int userId, int productId) {
        String check = "SELECT wishlist_id FROM wishlist WHERE user_id=? AND product_id=?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(check)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return true;
            String insert = "INSERT INTO wishlist (user_id, product_id) VALUES (?, ?)";
            try (PreparedStatement ps2 = conn.prepareStatement(insert)) {
                ps2.setInt(1, userId);
                ps2.setInt(2, productId);
                return ps2.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<ProductModel> getWishlistItems(int userId) {
        List<ProductModel> list = new ArrayList<>();
        String sql = "SELECT p.* FROM products p JOIN wishlist w ON p.id = w.product_id WHERE w.user_id=?";
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
                p.setDescription(rs.getString("description"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean removeFromWishlist(int userId, int productId) {
        String sql = "DELETE FROM wishlist WHERE user_id=? AND product_id=?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}