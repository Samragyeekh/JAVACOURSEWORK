<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
    <h1>Welcome, ${sessionScope.user.firstName}!</h1>
    <p>Role: ${sessionScope.user.role}</p>

    <c:if test="${not empty requestScope.success}">
        <p class="success">${requestScope.success}</p>
    </c:if>
    <c:if test="${not empty requestScope.error}">
        <p class="error">${requestScope.error}</p>
    </c:if>

    <h2>Manage Products</h2>

    <c:choose>
        <c:when test="${not empty requestScope.editProduct}">
            <h3>Edit Product</h3>
            <form action="${pageContext.request.contextPath}/dashboard" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="${requestScope.editProduct.id}">
                <input type="text" name="name" value="${requestScope.editProduct.name}" placeholder="Product Name" required>
                <input type="text" name="description" value="${requestScope.editProduct.description}" placeholder="Description" required>
                <input type="number" name="price" value="${requestScope.editProduct.price}" placeholder="Price" step="0.01" required>
                <input type="number" name="stock" value="${requestScope.editProduct.stock}" placeholder="Stock" required>
                <input type="text" name="category" value="${requestScope.editProduct.category}" placeholder="Category">
                <input type="text" name="imageUrl" value="${requestScope.editProduct.imageUrl}" placeholder="Image URL">
                <button type="submit">Update Product</button>
                <a href="${pageContext.request.contextPath}/dashboard">Cancel</a>
            </form>
        </c:when>
        <c:otherwise>
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
        </c:otherwise>
    </c:choose>

    <table>
        <tr>
            <th>ID</th><th>Name</th><th>Price</th><th>Stock</th><th>Category</th><th>Actions</th>
        </tr>
        <c:forEach var="p" items="${requestScope.products}">
        <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td>Rs. ${p.price}</td>
            <td>${p.stock}</td>
            <td>${p.category}</td>
            <td>
                <a href="${pageContext.request.contextPath}/dashboard?action=edit&id=${p.id}">Edit</a>
                <a href="${pageContext.request.contextPath}/dashboard?action=delete&id=${p.id}"
                   onclick="return confirm('Delete this product?')">Delete</a>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>

<%@ include file="/WEB-INF/pages/footer.jsp" %>

</body>
</html>