<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Lumière</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>

<%@ include file="/WEB-INF/pages/header.jsp" %>

<div class="container">
    <div class="image-side">
        <p>LUMIÈRE</p>
    </div>

    <div class="form-side">
        <h2>Create Account</h2>

        <c:if test="${not empty error}">
            <p style="color:red; text-align:center; font-size:13px;">${error}</p>
        </c:if>

        <form action="register" method="post">
            <div class="field">
                <label for="first_name">First Name</label>
                <input type="text" id="first_name" name="first_name" placeholder="Enter your first name">
            </div>
            <div class="field">
                <label for="last_name">Last Name</label>
                <input type="text" id="last_name" name="last_name" placeholder="Enter your last name">
            </div>
            <div class="field">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username">
            </div>
            <div class="field">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email">
            </div>
            <div class="field">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password">
            </div>
            <div class="field">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" placeholder="Enter your phone number">
            </div>
            <div class="field">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" name="dob">
            </div>
            <div class="field">
                <label for="gender">Gender</label>
                <select id="gender" name="gender">
                    <option value="">Select gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
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

<%@ include file="/WEB-INF/pages/footer.jsp" %>

</body>
</html>