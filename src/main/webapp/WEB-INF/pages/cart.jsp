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
    List<ProductModel> cartItems = (List<ProductModel>) request.getAttribute("cartItems");
    double total = 0;
    if (cartItems != null) {
        for (ProductModel p : cartItems) {
            total += p.getPrice() * p.getStock();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart - Lumière</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="cart-container">
    <h1>Your Cart</h1>

    <% if (cartItems == null || cartItems.isEmpty()) { %>
        <div class="empty-cart">
            <i class="fas fa-shopping-cart"></i>
            <p>Your cart is empty.</p>
            <a href="${pageContext.request.contextPath}/products" class="btn-shop">Shop Now</a>
        </div>
    <% } else { %>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Qty</th>
                    <th>Subtotal</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <% for (ProductModel p : cartItems) { %>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/<%= p.getImageUrl() %>" alt="<%= p.getName() %>" width="60" onerror="this.src='${pageContext.request.contextPath}/images/placeholder.png'"></td>
                    <td><%= p.getName() %></td>
                    <td>Rs. <%= String.format("%.0f", p.getPrice()) %></td>
                    <td><%= p.getStock() %></td>
                    <td>Rs. <%= String.format("%.0f", p.getPrice() * p.getStock()) %></td>
                    <td>
                        <form action="${pageContext.request.contextPath}/cart" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="productId" value="<%= p.getId() %>">
                            <button type="submit" class="btn-remove"><i class="fas fa-trash"></i></button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <div class="cart-total">
            <h3>Total: Rs. <%= String.format("%.0f", total) %></h3>
            <a href="${pageContext.request.contextPath}/products" class="btn-continue">Continue Shopping</a>
            <a href="#" class="btn-checkout">Checkout</a>
        </div>
    <% } %>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>