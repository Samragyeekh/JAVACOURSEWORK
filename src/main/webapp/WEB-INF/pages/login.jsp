<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Lumière</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <div class="image-side">
        <p>LUMIÈRE</p>
    </div>

    <div class="form-side">
        <h2>Welcome Back</h2>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <p style="color:red; text-align:center; font-size:13px;"><%= error %></p>
        <% } %>

        <form action="login" method="post">
            <div class="field">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="field">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit">Login</button>
        </form>

        <div class="links">
            <a href="forgotpassword.jsp">Forgot Password?</a>
            &nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="register.jsp">Don't have an account? Register</a>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>