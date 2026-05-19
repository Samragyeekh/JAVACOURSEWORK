<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lumiere.model.UserModel" %>
<%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - Lumière</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;1,300;1,400&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: #F5EDE4; font-family: 'Jost', sans-serif; min-height: 100vh; }
        .profile-container {
            max-width: 600px;
            margin: 60px auto;
            background: white;
            border-radius: 16px;
            padding: 40px;
            border: 1px solid #E8D5C8;
        }
        .profile-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 32px;
            font-weight: 300;
            color: #3A2A20;
            margin-bottom: 30px;
        }
        .profile-photo-section {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 30px;
        }
        .profile-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: #EDD8C8;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        .profile-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .profile-avatar i {
            font-size: 36px;
            color: #A0522D;
        }
        .btn-change-photo {
            padding: 8px 16px;
            background: #A0522D;
            color: white;
            border: none;
            border-radius: 6px;
            font-family: 'Jost', sans-serif;
            font-size: 13px;
            cursor: pointer;
        }
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 16px;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
            margin-bottom: 16px;
        }
        .form-group label {
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #8a6a5a;
        }
        .form-group input, .form-group select {
            padding: 10px 14px;
            border: 1px solid #E8D5C8;
            border-radius: 6px;
            font-family: 'Jost', sans-serif;
            font-size: 14px;
            color: #3A2A20;
            background: #FDFAF8;
        }
        .form-group input:focus, .form-group select:focus {
            outline: none;
            border-color: #A0522D;
        }
        .form-group input[readonly] {
            background: #F5EDE4;
            color: #8a6a5a;
        }
        .btn-save {
            width: 100%;
            padding: 14px;
            background: #3A2A20;
            color: #F5EDE4;
            border: none;
            border-radius: 6px;
            font-family: 'Jost', sans-serif;
            font-size: 13px;
            letter-spacing: 2px;
            text-transform: uppercase;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s;
        }
        .btn-save:hover { background: #A0522D; }
        .alert-success {
            background: #d4edda;
            color: #155724;
            padding: 12px 16px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-size: 14px;
        }
        .alert-error {
            background: #f8d7da;
            color: #721c24;
            padding: 12px 16px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="profile-container">
    <h1 class="profile-title">My Profile</h1>

    <% if (request.getAttribute("success") != null) { %>
        <div class="alert-success"><%= request.getAttribute("success") %></div>
    <% } %>
    <% if (request.getAttribute("error") != null) { %>
        <div class="alert-error"><%= request.getAttribute("error") %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">
        <div class="profile-photo-section">
            <div class="profile-avatar">
                <% if (user.getProfileImage() != null && !user.getProfileImage().isEmpty()) { %>
                    <img src="${pageContext.request.contextPath}/<%= user.getProfileImage() %>" alt="Profile">
                <% } else { %>
                    <i class="fas fa-user"></i>
                <% } %>
            </div>
            <button type="button" class="btn-change-photo" onclick="document.getElementById('profileImage').click()">
                <i class="fas fa-camera"></i> Change Photo
            </button>
            <input type="file" id="profileImage" name="profileImage" accept="image/*" style="display:none" onchange="this.form.submit()">
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>First Name</label>
                <input type="text" name="firstName" value="<%= user.getFirstName() != null ? user.getFirstName() : "" %>">
            </div>
            <div class="form-group">
                <label>Last Name</label>
                <input type="text" name="lastName" value="<%= user.getLastName() != null ? user.getLastName() : "" %>">
            </div>
        </div>

        <div class="form-group">
            <label>Username</label>
            <input type="text" value="<%= user.getUsername() != null ? user.getUsername() : "" %>" readonly>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" value="<%= user.getEmail() != null ? user.getEmail() : "" %>">
        </div>

        <div class="form-group">
            <label>Phone</label>
            <input type="text" name="phone" value="<%= user.getPhone() != null ? user.getPhone() : "" %>">
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Date of Birth</label>
                <input type="date" name="dob" value="<%= user.getDob() != null ? user.getDob() : "" %>">
            </div>
            <div class="form-group">
                <label>Gender</label>
                <select name="gender">
                    <option value="">Select</option>
                    <option value="Female" <%= "Female".equals(user.getGender()) ? "selected" : "" %>>Female</option>
                    <option value="Male" <%= "Male".equals(user.getGender()) ? "selected" : "" %>>Male</option>
                    <option value="Other" <%= "Other".equals(user.getGender()) ? "selected" : "" %>>Other</option>
                </select>
            </div>
        </div>

        <button type="submit" class="btn-save">Save Changes</button>
    </form>
</div>

</body>
</html>