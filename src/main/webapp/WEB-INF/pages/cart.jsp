<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart - Lumière</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>

    <%@ include file="header.jsp" %>

    <div class="page-title">
        <h1>Your Cart</h1>
        <p>Review your selected items before checkout</p>
    </div>

    <div class="cart-container">
        <c:choose>
            <c:when test="${empty cartItems}">
                <div class="empty-cart">
                    <p>Your cart is empty.</p>
                    <a href="${pageContext.request.contextPath}/products">Shop Now</a>
                </div>
            </c:when>
            <c:otherwise>
                <table class="cart-table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td>
                                    <div class="product-cell">
                                        <img src="${pageContext.request.contextPath}/images/${item.imageUrl}"
                                             alt="${item.name}"
                                             onerror="this.style.background='#f0e0d6'">
                                        <span>${item.name}</span>
                                    </div>
                                </td>
                                <td>$<fmt:formatNumber value="${item.price}" pattern="#,##0.00"/></td>
                                <td>${item.quantity}</td>
                                <td>$<fmt:formatNumber value="${item.price * item.quantity}" pattern="#,##0.00"/></td>
                                <td>
                                    <form method="post" action="${pageContext.request.contextPath}/cart">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="productId" value="${item.id}">
                                        <button type="submit" class="remove-btn">Remove</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="cart-summary">
                    <div class="cart-total">Total: $<fmt:formatNumber value="${total}" pattern="#,##0.00"/></div>
                    <div class="cart-actions">
                        <form method="post" action="${pageContext.request.contextPath}/cart">
                            <input type="hidden" name="action" value="clear">
                            <button type="submit" class="btn-clear">Clear Cart</button>
                        </form>
                        <a href="${pageContext.request.contextPath}/checkout" class="btn-checkout">Checkout</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>