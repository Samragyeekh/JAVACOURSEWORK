package com.lumiere.dao;

import com.lumiere.model.ProductModel;
import com.lumiere.utils.DBconfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<ProductModel> getAllProducts() throws Exception {
        List<ProductModel> list = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ProductModel p = new ProductModel();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setCategory(rs.getString("category"));
                p.setImageUrl(rs.getString("image_url"));
                list.add(p);
            }
        }
        return list;
    }

    public boolean addProduct(String name, String description, double price, int stock, String category, String imageUrl) throws Exception {
        String sql = "INSERT INTO products (name, description, price, stock, category, image_url) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, stock);
            ps.setString(5, category);
            ps.setString(6, imageUrl);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateProduct(int id, String name, String description, double price, int stock, String category, String imageUrl) throws Exception {
        String sql = "UPDATE products SET name=?, description=?, price=?, stock=?, category=?, image_url=? WHERE id=?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, stock);
            ps.setString(5, category);
            ps.setString(6, imageUrl);
            ps.setInt(7, id);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteProduct(int id) throws Exception {
        String sql = "DELETE FROM products WHERE id=?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    public ProductModel getProductById(int id) throws Exception {
        String sql = "SELECT * FROM products WHERE id=?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ProductModel p = new ProductModel();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setCategory(rs.getString("category"));
                p.setImageUrl(rs.getString("image_url"));
                return p;
            }
        }
        return null;
    }
}