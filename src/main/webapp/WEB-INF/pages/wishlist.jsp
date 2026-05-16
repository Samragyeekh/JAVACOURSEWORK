<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lumiere.model.ProductModel" %>
<%@ page import="com.lumiere.model.UserModel" %>
<%@ page import="java.util.List" %>
<%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
    List<ProductModel> wishlistItems = (List<ProductModel>) request.getAttribute("wishlistItems");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Wishlist - Lumière</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishlist.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="wishlist-container">
    <h1>Your Wishlist</h1>

    <% if (wishlistItems == null || wishlistItems.isEmpty()) { %>
        <div class="empty-wishlist">
            <i class="fas fa-heart"></i>
            <p>Your wishlist is empty.</p>
            <a href="${pageContext.request.contextPath}/products" class="btn-shop">Browse Products</a>
        </div>
    <% } else { %>
        <div class="wishlist-grid">
            <% for (ProductModel p : wishlistItems) { %>
            <div class="wish-card">
                <img src="${pageContext.request.contextPath}/<%= p.getImageUrl() %>" alt="<%= p.getName() %>" onerror="this.src='${pageContext.request.contextPath}/images/placeholder.png'">
                <div class="wish-info">
                    <p class="name"><%= p.getName() %></p>
                    <p class="price">Rs. <%= String.format("%.0f", p.getPrice()) %></p>
                    <div class="wish-actions">
                        <form action="${pageContext.request.contextPath}/cart" method="post" style="display:inline">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productId" value="<%= p.getId() %>">
                            <button type="submit" class="btn-cart">Add to Cart</button>
                        </form>
                        <form action="${pageContext.request.contextPath}/wishlist" method="post" style="display:inline">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="productId" value="<%= p.getId() %>">
                            <button type="submit" class="btn-remove"><i class="fas fa-trash"></i></button>
                        </form>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    <% } %>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>