<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Lumière</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <div class="image-side">
        <p>LUMIÈRE</p>
    </div>
    <div class="form-side">
        <h2>Create Account</h2>
        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <p class="error-msg"><%= error %></p>
        <% } %>
        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="field">
                <label>First Name</label>
                <input type="text" name="first_name" placeholder="Enter your first name" required>
            </div>
            <div class="field">
                <label>Last Name</label>
                <input type="text" name="last_name" placeholder="Enter your last name" required>
            </div>
            <div class="field">
                <label>Username</label>
                <input type="text" name="username" placeholder="Choose a username" required>
            </div>
            <div class="field">
                <label>Email</label>
                <input type="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="field">
                <label>Password</label>
                <input type="password" name="password" placeholder="Create a password" required>
            </div>
            <div class="field">
                <label>Phone</label>
                <input type="text" name="phone" placeholder="Enter your phone number">
            </div>
            <div class="field">
                <label>Date of Birth</label>
                <input type="date" name="dob">
            </div>
            <div class="field">
                <label>Gender</label>
                <select name="gender">
                    <option value="">Select gender</option>
                    <option value="Female">Female</option>
                    <option value="Male">Male</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <button type="submit">Register</button>
        </form>
        <div class="links">
            <a href="${pageContext.request.contextPath}/login">Already have an account? Login</a>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>