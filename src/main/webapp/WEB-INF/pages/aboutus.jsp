<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>About Us – Lumière Cosmetics</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300&family=Jost:wght@300;400;500&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css">
</head>
<body>

<%@ include file="/WEB-INF/pages/header.jsp" %>

<div class="team-list">
    <h1>Our Team</h1>

    <div class="team-card">
        <div class="team-info">
            <a href="#" class="name-link"><h3>Smriti Chand</h3></a>
            <div class="role">Creative Director</div>
            <p>Smriti leads the brand's visual identity and product aesthetics, shaping the overall creative direction. She ensures every design reflects the brand's vision while maintaining consistency across all platforms.</p>
        </div>
        <img class="team-photo" src="${pageContext.request.contextPath}/images/WhatsApp Image 2026-03-28 at 7.13.15 PM.jpeg" alt="Smriti Chand"/>
    </div>

    <div class="team-card">
        <img class="team-photo" src="${pageContext.request.contextPath}/images/WhatsApp Image 2026-03-28 at 7.09.53 PM.jpeg" alt="Samragyee Khanal"/>
        <div class="team-info">
            <a href="#" class="name-link"><h3>Samragyee Khanal</h3></a>
            <div class="role">Head of Product Development</div>
            <p>Samragyee is responsible for formulating and developing new products from concept to completion. She oversees research, design coordination, and product refinement to ensure each offering meets high standards of quality.</p>
        </div>
    </div>

    <div class="team-card">
        <div class="team-info">
            <a href="#" class="name-link"><h3>Ellie Shrestha</h3></a>
            <div class="role">Marketing Manager</div>
            <p>Ellie handles advertising campaigns and social media strategy, driving the brand's online presence and engagement. She develops creative marketing initiatives and builds strategies to connect the brand with its target audience.</p>
        </div>
        <img class="team-photo" src="${pageContext.request.contextPath}/images/WhatsApp Image 2026-03-29 at 12.35.33 AM.jpeg" alt="Ellie Shrestha"/>
    </div>

    <div class="team-card">
        <img class="team-photo" src="${pageContext.request.contextPath}/images/abhishek.jpg" alt="Abhishek Mishra"/>
        <div class="team-info">
            <a href="#" class="name-link"><h3>Abhishek Mishra</h3></a>
            <div class="role">Sales and Customer Experience Lead</div>
            <p>Abhishek manages customer experience and partnerships, ensuring smooth interactions and strong client relationships. He oversees sales operations and builds long-term collaborations that support brand growth.</p>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/pages/footer.jsp" %>

</body>
</html>