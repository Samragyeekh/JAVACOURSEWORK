<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Ellie Shrestha – CV</title>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600&family=Jost:wght@300;400;500&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ellie-cv.css">
</head>
<body>

  <div class="cv">

    <!-- Header -->
    <div class="cv-header">
      <h1>Ellie Shrestha</h1>
      <p class="title">Marketing Manager</p>
      <div class="contact-row">
        <span>ellie@email.com</span>
        <span>+977 9800000000</span>
        <span>Kathmandu, Nepal</span>
      </div>
    </div>

    <!-- Summary -->
    <div class="section">
      <h2>Profile</h2>
      <p>A results-driven marketing professional with a passion for beauty, branding, and digital strategy. Experienced in building brand identity, running social media campaigns, and connecting products with their target audience.</p>
    </div>

    <!-- Education -->
    <div class="section">
      <h2>Education</h2>
      <div class="entry">
        <div class="entry-header">
          <span class="entry-title">BSc (Hons) Computing</span>
          <span class="entry-date">2023 – Present</span>
        </div>
        <div class="entry-sub">Islington College, Kathmandu</div>
      </div>
      <div class="entry">
        <div class="entry-header">
          <span class="entry-title">+2 Science</span>
          <span class="entry-date">2021 – 2023</span>
        </div>
        <div class="entry-sub">Your School Name, Kathmandu</div>
      </div>
    </div>

    <!-- Experience -->
    <div class="section">
      <h2>Experience</h2>
      <div class="entry">
        <div class="entry-header">
          <span class="entry-title">Marketing Manager – Lumière Cosmetics</span>
          <span class="entry-date">2024 – Present</span>
        </div>
        <div class="entry-sub">Co-founded and manages marketing strategy for a cosmetics brand</div>
        <ul>
          <li>Developed and executed social media campaigns across Instagram and TikTok</li>
          <li>Built brand identity and visual guidelines</li>
          <li>Increased brand engagement by 40% through targeted content strategy</li>
        </ul>
      </div>
    </div>

    <!-- Skills -->
    <div class="section">
      <h2>Skills</h2>
      <div class="skills">
        <span>Social Media Marketing</span>
        <span>Brand Strategy</span>
        <span>Content Creation</span>
        <span>Java Web Development</span>
        <span>HTML & CSS</span>
        <span>MySQL</span>
        <span>Adobe Photoshop</span>
        <span>Microsoft Office</span>
      </div>
    </div>

    <!-- Languages -->
    <div class="section">
      <h2>Languages</h2>
      <div class="skills">
        <span>Nepali – Native</span>
        <span>English – Fluent</span>
        <span>Hindi – Conversational</span>
      </div>
    </div>

  </div>

</body>
</html>