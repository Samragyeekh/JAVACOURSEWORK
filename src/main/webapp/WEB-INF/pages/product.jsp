<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%
    class Product {
        public String name, image, alt, stars, price;
        public int id;
        public Product(int id, String name, String image, String alt, String stars, String price) {
            this.id = id; this.name = name; this.image = image;
            this.alt = alt; this.stars = stars; this.price = price;
        }
    }

    List<Product> products = new ArrayList<>();
    products.add(new Product(1, "Rose Blush",        "images/blush.png",       "Rose Blush",        "&#9733;&#9733;&#9733;&#9733;&#9734;", "Rs. 1,200"));
    products.add(new Product(2, "Glow Serum",        "images/Serum.png",        "Glow Serum",        "&#9733;&#9733;&#9733;&#9733;&#9733;", "Rs. 2,500"));
    products.add(new Product(3, "Matte Lipstick",    "images/lipstick.png",     "Matte Lipstick",    "&#9733;&#9733;&#9733;&#9734;&#9734;", "Rs. 850"));
    products.add(new Product(4, "Moisturiser SPF",   "images/moisturizer.png",  "Moisturiser SPF",   "&#9733;&#9733;&#9733;&#9733;&#9734;", "Rs. 1,800"));
    products.add(new Product(5, "Eyeshadow Palette", "images/eyeshadow.png",    "Eyeshadow Palette", "&#9733;&#9733;&#9733;&#9733;&#9733;", "Rs. 3,200"));
    products.add(new Product(6, "Face Toner",        "images/toner.png",        "Face Toner",        "&#9733;&#9733;&#9733;&#9733;&#9734;", "Rs. 950"));
    products.add(new Product(7, "Lip Gloss",         "images/lipgloss.png",     "Lip Gloss",         "&#9733;&#9733;&#9733;&#9733;&#9734;", "Rs. 650"));
    products.add(new Product(8, "Night Cream",       "images/nightcream.png",   "Night Cream",       "&#9733;&#9733;&#9733;&#9733;&#9733;", "Rs. 2,100"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - Lumière</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;600&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
</head>
<body>

<%@ include file="header.jsp" %>

<p class="page-title">ALL PRODUCTS</p>

<div class="products-grid">
    <% for (Product p : products) { %>
    <div class="card">
        <a href="product-detail.jsp?id=<%= p.id %>">
            <img src="<%= p.image %>" alt="<%= p.alt %>">
        </a>
        <div class="card-info">
            <p class="name"><%= p.name %></p>
            <p class="stars"><%= p.stars %></p>
            <p class="price"><%= p.price %></p>
            <div class="card-actions">
                <button class="btn-cart">Add to Cart</button>
                <input type="checkbox" class="wish-toggle" id="wish<%= p.id %>">
                <label class="btn-wish" for="wish<%= p.id %>">
                    <i class="fas fa-heart"></i>
                </label>
            </div>
        </div>
    </div>
    <% } %>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>