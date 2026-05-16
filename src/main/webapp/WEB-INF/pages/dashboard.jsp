<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lumiere.model.UserModel" %>
<%@ page import="com.lumiere.model.ProductModel" %>
<%@ page import="java.util.List" %>
<%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
    ProductModel editProduct = (ProductModel) request.getAttribute("editProduct");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard – Lumière</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>
<body>

<%@ include file="/WEB-INF/pages/header.jsp" %>

<div class="dashboard-container">
    <h1>Welcome, <%= user.getFirstName() %>!</h1>
    <p>Role: <%= user.getRole() %></p>

    <% String success = (String) request.getAttribute("success"); %>
    <% String error = (String) request.getAttribute("error"); %>
    <% if (success != null) { %><p class="success"><%= success %></p><% } %>
    <% if (error != null) { %><p class="error"><%= error %></p><% } %>

    <h2>Manage Products</h2>

    <% if (editProduct != null) { %>
    <h3>Edit Product</h3>
    <form action="${pageContext.request.contextPath}/dashboard" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= editProduct.getId() %>">
        <input type="text" name="name" value="<%= editProduct.getName() %>" placeholder="Product Name" required>
        <input type="text" name="description" value="<%= editProduct.getDescription() %>" placeholder="Description" required>
        <input type="number" name="price" value="<%= editProduct.getPrice() %>" placeholder="Price" step="0.01" required>
        <input type="number" name="stock" value="<%= editProduct.getStock() %>" placeholder="Stock" required>
        <input type="text" name="category" value="<%= editProduct.getCategory() %>" placeholder="Category">
        <input type="text" name="imageUrl" value="<%= editProduct.getImageUrl() %>" placeholder="Image URL">
        <button type="submit">Update Product</button>
        <a href="${pageContext.request.contextPath}/dashboard">Cancel</a>
    </form>
    <% } else { %>
    <form action="${pageContext.request.contextPath}/dashboard" method="post">
        <input type="hidden" name="action" value="add">
        <input type="text" name="name" placeholder="Product Name" required>
        <input type="text" name="description" placeholder="Description" required>
        <input type="number" name="price" placeholder="Price" step="0.01" required>
        <input type="number" name="stock" placeholder="Stock" required>
        <input type="text" name="category" placeholder="Category">
        <input type="text" name="imageUrl" placeholder="Image URL">
        <button type="submit">Add Product</button>
    </form>
    <% } %>

    <table>
        <tr>
            <th>ID</th><th>Name</th><th>Price</th><th>Stock</th><th>Category</th><th>Actions</th>
        </tr>
        <%
            List<ProductModel> products = (List<ProductModel>) request.getAttribute("products");
            if (products != null) {
                for (ProductModel p : products) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td>Rs. <%= p.getPrice() %></td>
            <td><%= p.getStock() %></td>
            <td><%= p.getCategory() %></td>
            <td>
                <a href="${pageContext.request.contextPath}/dashboard?action=edit&id=<%= p.getId() %>">Edit</a>
                <a href="${pageContext.request.contextPath}/dashboard?action=delete&id=<%= p.getId() %>"
                   onclick="return confirm('Delete this product?')">Delete</a>
            </td>
        </tr>
        <% } } %>
    </table>
</div>

<%@ include file="/WEB-INF/pages/footer.jsp" %>

</body>
</html>