<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Contact Us – Lumière Cosmetics</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600&family=Lato:wght@300;400;500&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="page">

    <div class="left"></div>

    <div class="right">
        <h1>Contact Us</h1>

        <!-- Error message -->
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <!-- Success message -->
        <c:if test="${not empty success}">
            <p class="success">${success}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/contact" method="POST">
            <div class="field">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Your full name" value="${param.name}"/>
            </div>
            <div class="field">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="your@email.com" value="${param.email}"/>
            </div>
            <div class="field">
                <label for="message">Message:</label>
                <input type="text" id="message" name="message" placeholder="Your message" value="${param.message}"/>
            </div>
            <div class="field">
                <label>Contact:</label>
                <div class="static-field">lumierecosmetics@gmail.com</div>
            </div>
            <div class="field">
                <label>Based in:</label>
                <div class="static-field">Kathmandu, Nepal</div>
            </div>
            <div class="bottom">
                <button type="submit">Contact us</button>
                <div class="socials">
                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#"><i class="fa-brands fa-youtube"></i></a>
                    <a href="#"><i class="fa-brands fa-tiktok"></i></a>
                    <a href="#"><i class="fa-brands fa-pinterest"></i></a>
                </div>
            </div>
        </form>
    </div>

</div>

<%@ include file="/WEB-INF/pages/footer.jsp" %>

</body>
</html>