<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">

<!-- Font Awesome Icons -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<header class="main-header">
    <div class="top-bar">
        <div class="brand-area">
            <i class="fa-solid fa-bars menu-icon"></i>
            <h1>LUMIÈRE</h1>
        </div>

        <nav class="nav-links">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/products">Products</a>
            <a href="${pageContext.request.contextPath}/about">About Us</a>
            <a href="${pageContext.request.contextPath}/contact">Contact Us</a>
        </nav>

        <div class="user-icon">
            <i class="fa-solid fa-user"></i>
        </div>
    </div>

    <div class="search-bar-section">
        <button class="icon-btn">
            <i class="fa-solid fa-filter"></i>
        </button>

        <div class="search-box">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" placeholder="Search for products...">
        </div>

        <div class="right-icons">
            <button class="icon-btn">
                <i class="fa-solid fa-cart-shopping"></i>
            </button>

            <button class="icon-btn">
                <i class="fa-solid fa-heart"></i>
            </button>
        </div>
    </div>
</header>
