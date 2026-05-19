<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>About Us – Lumière Cosmetics</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300&family=Jost:wght@300;400;500&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css">
</head>
<body>

<%@ include file="/WEB-INF/pages/header.jsp" %>

<div class="team-list">

    <h1>Our Team</h1>

    <div class="intro">
        <p>We are a passionate team of four behind Lumière Cosmetics, united by a shared love for beauty, creativity, and quality. Each of us brings a unique expertise that drives the brand forward from creative vision and product development to marketing strategy and customer experience. Together, we are committed to crafting cosmetics that celebrate individuality and illuminate confidence.</p>
        <br/>
        <p>At Lumière, we believe beauty is not one size fits all. Our products are thoughtfully formulated for all skin types whether oily, dry, combination, or sensitive because everyone deserves to feel radiant in their own skin. From lightweight foundations that let your natural glow shine through, to richly pigmented lip colours that make a statement, every product in our collection is designed to enhance what makes you uniquely you.</p>
        <br/>
        <p>Beauty is not about perfection it is about expression. Fancy your beauty, own your story, and let Lumière light the way.</p>
    </div>

    <div class="team-card">
        <div class="team-info">
            <a href="${pageContext.request.contextPath}/cv?name=samragyee" class="name-link">
                <h3>Samragyee Khanal</h3>
            </a>
            <div class="role">Head of Product Development</div>
            <p>Samragyee is responsible for formulating and developing new products from concept to completion. She oversees research, design coordination, and product refinement to ensure each offering meets high standards of quality.</p>
        </div>
        <img class="team-photo" src="${pageContext.request.contextPath}/images/WhatsApp Image 2026-03-28 at 7.09.53 PM.jpeg" alt="Samragyee Khanal" style="object-position: top;"/>
    </div>

    <div class="team-card">
        <img class="team-photo" src="${pageContext.request.contextPath}/images/WhatsApp Image 2026-03-28 at 7.13.15 PM.jpeg" alt="Smriti Chand" style="object-position: top;"/>
        <div class="team-info">
            <a href="${pageContext.request.contextPath}/cv?name=smriti" class="name-link">
                <h3>Smriti Chand</h3>
            </a>
            <div class="role">Creative Director</div>
            <p>Smriti leads the brand's visual identity and product aesthetics, shaping the overall creative direction. She ensures every design reflects the brand's vision while maintaining consistency across all platforms.</p>
        </div>
    </div>

    <div class="team-card">
        <div class="team-info">
            <a href="${pageContext.request.contextPath}/cv?name=ellie" class="name-link">
                <h3>Ellie Shrestha</h3>
            </a>
            <div class="role">Marketing Manager</div>
            <p>Ellie handles advertising campaigns and social media strategy, driving the brand's online presence and engagement. She develops creative marketing initiatives and builds strategies to connect the brand with its target audience.</p>
        </div>
        <img class="team-photo" src="${pageContext.request.contextPath}/images/ellie.jpeg" alt="Ellie Shrestha" style="object-position: top;"/>
    </div>

    <div class="team-card">
        <div class="team-info">
            <a href="${pageContext.request.contextPath}/cv?name=abhishek" class="name-link">
                <h3>Abhishek Mishra</h3>
            </a>
            <div class="role">Sales and Customer Experience Lead</div>
            <p>Abhishek manages customer experience and partnerships, ensuring smooth interactions and strong client relationships. He oversees sales operations and builds long-term collaborations that support brand growth.</p>
        </div>
    </div>

</div>

<%@ include file="/WEB-INF/pages/footer.jsp" %>

</body>
</html>