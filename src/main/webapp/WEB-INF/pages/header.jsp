<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lumiere.model.UserModel" %>
<%
    UserModel headerUser = (UserModel) session.getAttribute("user");
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<header class="pages">
    <div class="logo">LUMIÈRE</div>

    <ul>
        <li><a href="${pageContext.request.contextPath}/home">HOME</a></li>
        <li><a href="${pageContext.request.contextPath}/products">PRODUCTS</a></li>
        <li><a href="${pageContext.request.contextPath}/about">ABOUT US</a></li>
        <li><a href="${pageContext.request.contextPath}/contact">CONTACT US</a></li>
    </ul>

    <div class="header-icons">
        <% if (headerUser != null) { %>
            <span class="welcome-text">Hi, <%= headerUser.getFirstName() %>!</span>
            <% if ("admin".equals(headerUser.getRole())) { %>
                <a href="${pageContext.request.contextPath}/dashboard" title="Dashboard"><i class="fas fa-tachometer-alt"></i></a>
            <% } %>
            <a href="${pageContext.request.contextPath}/logout" title="Logout"><i class="fas fa-sign-out-alt"></i></a>
        <% } else { %>
            <a href="${pageContext.request.contextPath}/login" title="Login"><i class="fas fa-user"></i></a>
        <% } %>
        <a href="${pageContext.request.contextPath}/cart" title="Cart"><i class="fas fa-shopping-cart"></i></a>
        <a href="${pageContext.request.contextPath}/wishlist" title="Wishlist"><i class="fas fa-heart"></i></a>
    </div>
</header>