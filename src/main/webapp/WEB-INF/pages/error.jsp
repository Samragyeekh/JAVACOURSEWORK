<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Error — Lumière</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/error.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>

  <div class="error-container">

    <div class="error-code">${requestScope['jakarta.servlet.error.status_code']}</div>

    <h2 class="error-title">Oops! Something Went Wrong</h2>

    <p class="error-message">The page you are looking for does not exist or an error occurred.</p>

    <a href="${pageContext.request.contextPath}/home" class="btn">
      <i class="fas fa-home"></i> Go Back Home
    </a>

  </div>
  

</body>
</html>