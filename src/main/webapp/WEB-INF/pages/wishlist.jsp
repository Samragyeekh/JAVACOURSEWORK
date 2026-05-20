<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wishlist - Lumière</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishlist.css">
</head>
<body>

    <%@ include file="header.jsp" %>

    <div class="page-title">
        <h1>Your Wishlist</h1>
        <p>Items you love, saved for later</p>
    </div>

    <c:if test="${not empty requestScope.error}">
        <div style="color:red; text-align:center; margin:10px;">
            ${requestScope.error}
        </div>
    </c:if>

    <div class="wishlist-container">
        <c:choose>
            <c:when test="${empty wishlistItems}">
                <div class="empty-wishlist">
                    <p>Your wishlist is empty.</p>
                    <a href="${pageContext.request.contextPath}/products">Explore Products</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="wishlist-grid">
                    <c:forEach var="item" items="${wishlistItems}">
                        <div class="product-card">
                            <img src="${pageContext.request.contextPath}/images/${item.imageUrl}"
                                 alt="${item.name}"
                                 onerror="this.style.background='#f0e0d6'">
                            <div class="card-body">
                                <h3>${item.name}</h3>
                                <div class="price">$<fmt:formatNumber value="${item.price}" pattern="#,##0.00"/></div>
                                <div class="card-actions">
                                    <form method="post" action="${pageContext.request.contextPath}/cart">
                                        <input type="hidden" name="action" value="add">
                                        <input type="hidden" name="productId" value="${item.id}">
                                        <input type="hidden" name="quantity" value="1">
                                        <button type="submit" class="btn-cart">Add to Cart</button>
                                    </form>
                                    <form method="post" action="${pageContext.request.contextPath}/wishlist">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="productId" value="${item.id}">
                                        <button type="submit" class="btn-remove">Remove</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>