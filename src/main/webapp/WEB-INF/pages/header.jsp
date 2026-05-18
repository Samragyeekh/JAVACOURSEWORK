<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <span class="welcome-text">Hi, ${sessionScope.user.firstName}!</span>
                <c:if test="${sessionScope.user.role == 'admin'}">
                    <a href="${pageContext.request.contextPath}/dashboard" title="Dashboard"><i class="fas fa-tachometer-alt"></i></a>
                </c:if>
                <a href="${pageContext.request.contextPath}/profile" title="Profile"><i class="fas fa-user-circle"></i></a>
                <a href="${pageContext.request.contextPath}/logout" title="Logout"><i class="fas fa-sign-out-alt"></i></a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/login" title="Login"><i class="fas fa-user"></i></a>
            </c:otherwise>
        </c:choose>
        <a href="${pageContext.request.contextPath}/cart" title="Cart"><i class="fas fa-shopping-cart"></i></a>
        <a href="${pageContext.request.contextPath}/wishlist" title="Wishlist"><i class="fas fa-heart"></i></a>
    </div>
</header>