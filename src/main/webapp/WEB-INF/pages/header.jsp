<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- Top Navigation -->
<header class="pages">
    <button><i class="fas fa-bars"></i></button>

    <div class="logo">LUMIÈRE</div>

    <ul>
       <li><a href="${pageContext.request.contextPath}/home">HOME</a></li>
<li><a href="${pageContext.request.contextPath}/products">PRODUCTS</a></li>
<li><a href="${pageContext.request.contextPath}/about">ABOUT US</a></li>
<li><a href="${pageContext.request.contextPath}/ContactServlet">CONTACT US</a></li>
    </ul>

    <a href="login.jsp" style="color: #ffffff; font-size: 18px;"><i class="fas fa-user"></i></a>
</header>

<!-- Action Bar -->
<header class="action">

    <div class="filter">
        <i class="fas fa-filter"></i>
    </div>

    <div class="searchbar">
        <i class="fas fa-search"></i>
        <input type="text" placeholder="Search for products...">
    </div>

    <div class="icons">
        <a href="cart.jsp"><i class="fas fa-shopping-cart"></i></a>
        <a href="wishlist.jsp"><i class="fas fa-heart"></i></a>
    </div>

</header>