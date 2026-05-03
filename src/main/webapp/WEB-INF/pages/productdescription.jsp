<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // In real implementation, fetch product by ID from DB using request.getParameter("id")
    // String id = request.getParameter("id");
    // Product p = ProductDAO.getProductById(Integer.parseInt(id));

    // Hardcoded for now
    String name        = "Rose Blush";
    String image       = "images/blush.png";
    String stars       = "&#9733;&#9733;&#9733;&#9733;&#9734;";
    String price       = "Rs. 1,200";
    String description = "A silky-smooth blush that gives your cheeks a natural, rosy flush. "
                       + "Lightweight and buildable, it blends effortlessly for a fresh, "
                       + "healthy glow that lasts all day. Perfect for all skin tones.";
    String category    = "Face Makeup";
    String skinType    = "All skin types";
    String availability = "In Stock";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Detail - Lumière</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;600&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productdescription.css">
</head>
<body>

    <a href="products.jsp" class="back-btn">
        <i class="fas fa-arrow-left"></i> Back to Products
    </a>

    <div class="detail-container">
        <div class="detail-image">
            <img src="<%= image %>" alt="<%= name %>">
        </div>
        <div class="detail-info">
            <h1><%= name %></h1>
            <p class="stars"><%= stars %></p>
            <p class="price"><%= price %></p>
            <hr>
            <p class="description"><%= description %></p>
            <div>
                <p class="label">Category</p>
                <p class="value"><%= category %></p>
            </div>
            <div>
                <p class="label">Skin Type</p>
                <p class="value"><%= skinType %></p>
            </div>
            <div>
                <p class="label">Availability</p>
                <p class="value"><%= availability %></p>
            </div>
            <div class="btn-row">
                <button class="btn-cart">Add to Cart</button>
                <input type="checkbox" class="wish-toggle" id="wish-detail">
                <label class="btn-wish" for="wish-detail">
                    <i class="fas fa-heart"></i>
                </label>
            </div>
        </div>
    </div>

</body>
</html>