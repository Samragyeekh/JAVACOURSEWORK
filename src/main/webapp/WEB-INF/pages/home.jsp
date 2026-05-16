<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Lumière Cosmetics</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300;1,400&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>

<%@ include file="header.jsp" %>

<section class="hero">
    <div class="hero-img-placeholder">
        <img src="${pageContext.request.contextPath}/images/hero.png" alt="Lumiere Cosmetics" class="hero-img">
    </div>
    <div class="hero-content">
        <h1 class="hero-title">Illuminate Your<br><em>Beauty</em></h1>
        <a href="products" class="btn-shop">Shop now</a>
    </div>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>