<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lumiere.model.ProductModel" %>
<%@ page import="com.lumiere.model.UserModel" %>
<%@ page import="java.util.List" %>
<%
    UserModel user = (UserModel) session.getAttribute("user");
    List<ProductModel> products = (List<ProductModel>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - Lumière</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
</head>
<body>

<%@ include file="header.jsp" %>

<p class="page-title">ALL PRODUCTS</p>

<div class="products-grid">
    <% if (products != null && !products.isEmpty()) {
        for (ProductModel p : products) { %>
    <div class="card">
        <a href="${pageContext.request.contextPath}/productdescription?id=<%= p.getId() %>">
            <img src="${pageContext.request.contextPath}/<%= p.getImageUrl() %>" alt="<%= p.getName() %>" onerror="this.src='${pageContext.request.contextPath}/images/placeholder.png'">
        </a>
        <div class="card-info">
            <p class="name"><%= p.getName() %></p>
            <p class="price">Rs. <%= String.format("%.0f", p.getPrice()) %></p>
            <div class="card-actions">
                <% if (user != null) { %>
                    <form action="${pageContext.request.contextPath}/cart" method="post" style="display:inline">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="<%= p.getId() %>">
                        <button type="submit" class="btn-cart">Add to Cart</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/wishlist" method="post" style="display:inline">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="<%= p.getId() %>">
                        <button type="submit" class="btn-wish"><i class="fas fa-heart"></i></button>
                    </form>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/login" class="btn-cart">Login to Buy</a>
                <% } %>
            </div>
        </div>
    </div>
    <% } } else { %>
        <p style="text-align:center; padding:40px;">No products found.</p>
    <% } %>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>