
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - Lumière</title>
    <!-- External stylesheet dependencies for fonts and icons -->
    <link rel="stylesheet" href="https://googleapis.com">
    <link rel="stylesheet" href="https://cloudflare.com">
    <!-- Component-specific styling for the product catalog layout -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
</head>
<body>

<!-- Dynamic header template reference -->
<%@ include file="header.jsp" %>

<p class="page-title">ALL PRODUCTS</p>

<div class="products-grid">
    <!-- Iterates over the requested list of product objects from the controller -->
    <c:forEach var="p" items="${productList}">
        <div class="card">
            <!-- Wishlist Heart Floating at Top Corner -->
            <input type="checkbox" class="wish-toggle" id="wish${p.id}">
            <label class="btn-wish" for="wish${p.id}">
                <i class="fas fa-heart"></i>
            </label>

            <!-- PURE CSS HIDDEN COUNTER RADIOS (Per Card Unique Scope) -->
            <input type="radio" name="qty-group-${p.id}" id="qty-${p.id}-1" class="qty-radio qty-r-1" checked>
            <input type="radio" name="qty-group-${p.id}" id="qty-${p.id}-2" class="qty-radio qty-r-2">
            <input type="radio" name="qty-group-${p.id}" id="qty-${p.id}-3" class="qty-radio qty-r-3">
            <input type="radio" name="qty-group-${p.id}" id="qty-${p.id}-4" class="qty-radio qty-r-4">

            <!-- Link to the detailed item description view -->
            <a href="productdescription?id=${p.id}">
                <img src="${p.image}" alt="${p.alt}">
            </a>
            
            <div class="card-info">
                <p class="stars">${p.stars}</p>
                <div class="card-row">
                    <div class="text-group">
                        <p class="name">${p.name}</p>
                        <p class="subtitle">coconut water lip stain</p>
                    </div>
                    <p class="price">${p.price}</p>
                </div>
            </div>

            <!-- TACTILE OVERLAY DRAWER -->
            <div class="card-overlay">
                <div class="qty-stepper-container">
                    
                    <!-- Minus Action Labels -->
                    <div class="minus-btn-stack">
                        <label class="step-lbl l-down-disabled"><i class="fas fa-minus"></i></label>
                        <label for="qty-${p.id}-1" class="step-lbl l-down-to-1"><i class="fas fa-minus"></i></label>
                        <label for="qty-${p.id}-2" class="step-lbl l-down-to-2"><i class="fas fa-minus"></i></label>
                        <label for="qty-${p.id}-3" class="step-lbl l-down-to-3"><i class="fas fa-minus"></i></label>
                    </div>

                    <!-- Dynamic Numeric Values Stack -->
                    <div class="digits-view-stack">
                        <span class="count-digit digit-1">1</span>
                        <span class="count-digit digit-2">2</span>
                        <span class="count-digit digit-3">3</span>
                        <span class="count-digit digit-4">4</span>
                    </div>

                    <!-- Plus Action Labels -->
                    <div class="plus-btn-stack">
                        <label for="qty-${p.id}-2" class="step-lbl l-up-to-2"><i class="fas fa-plus"></i></label>
                        <label for="qty-${p.id}-3" class="step-lbl l-up-to-3"><i class="fas fa-plus"></i></label>
                        <label for="qty-${p.id}-4" class="step-lbl l-up-to-4"><i class="fas fa-plus"></i></label>
                        <label class="step-lbl l-up-disabled"><i class="fas fa-plus"></i></label>
                    </div>
                    
                </div>

                <!-- Form handler to post order details to the shopping cart system -->
                <form action="products" method="POST" class="cart-form-container">
                    <input type="hidden" name="productId" value="${p.id}">
                    
                    <!-- Clean, unified price tags using JSTL string parsing math engine operations -->
                    <button type="submit" class="btn-cart price-tag-1">add to cart - ${p.price}</button>
                    
                    <!-- Formats and multiplies price string by stripping currency prefix via substring -->
                    <button type="submit" class="btn-cart price-tag-2">
                        add to cart - Rs. ${(fn:replace(fn:substring(p.price, 4, fn:length(p.price)), ',', '')) * 2}
                    </button>
                    
                    <button type="submit" class="btn-cart price-tag-3">
                        add to cart - Rs. ${(fn:replace(fn:substring(p.price, 4, fn:length(p.price)), ',', '')) * 3}
                    </button>
                    
                    <button type="submit" class="btn-cart price-tag-4">
                        add to cart - Rs. ${(fn:replace(fn:substring(p.price, 4, fn:length(p.price)), ',', '')) * 4}
                    </button>
                </form>
            </div>
        </div>
    </c:forEach>
</div>

<!-- PAGINATION SYSTEM BAR -->
<div class="pagination-container">
    <div class="pagination-bar">
        <!-- Renders previous page navigation link if not on the first page -->
        <c:choose>
            <c:when test="${currentPage > 1}">
                <a href="?page=${currentPage - 1}" class="nav-arrow"><i class="fas fa-chevron-left"></i></a>
            </c:when>
            <c:otherwise>
                <span class="nav-arrow disabled"><i class="fas fa-chevron-left"></i></span>
            </c:otherwise>
        </c:choose>

        <!-- Dynamically builds numerical indexes for total available page count -->
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <span class="page-num active">${i}</span>
                </c:when>
                <c:otherwise>
                    <a href="?page=${i}" class="page-num">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <!-- Renders next page navigation link if not on the final page -->
        <c:choose>
            <c:when test="${currentPage < totalPages}">
                <a href="?page=${currentPage + 1}" class="nav-arrow"><i class="fas fa-chevron-right"></i></a>
            </c:when>
            <c:otherwise>
                <span class="nav-arrow disabled"><i class="fas fa-chevron-right"></i></span>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- BACKEND MODAL POPUP -->
<!-- Intercepts confirmation attribute from context to display successful transaction status -->
<c:if test="${not empty showPopupMessage}">
    <div class="modal-backdrop-overlay">
        <div class="popup-modal-box">
            <div class="modal-icon-ring"><i class="fas fa-check"></i></div>
            <h3>Added to Cart!</h3>
            <p>Your item selection was registered successfully by the backend database module architecture.</p>
            <a href="products?page=${currentPage}" class="modal-close-btn">Continue Shopping</a>
        </div>
    </div>
</c:if>

<!-- Dynamic footer template reference -->
<%@ include file="footer.jsp" %>

</body>
</html>
