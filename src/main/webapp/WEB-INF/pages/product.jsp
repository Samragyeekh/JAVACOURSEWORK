<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - Lumière</title>
    <link rel="stylesheet" href="https://googleapis.com">
    <link rel="stylesheet" href="https://cloudflare.com">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">
</head>
<body>

<%@ include file="header.jsp" %>

<p class="page-title">ALL PRODUCTS</p>

<div class="products-grid">
    <c:forEach var="p" items="${productList}">
        <div class="card">
            <!-- Wishlist Heart Floating at Top Corner with Her Backend Action Router -->
            <form action="${pageContext.request.contextPath}/wishlist" method="POST" style="margin: 0; padding: 0;">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="productId" value="${p.id}">
                
                <input type="checkbox" class="wish-toggle" id="wish${p.id}">
                <label class="btn-wish" for="wish${p.id}">
                    <button type="submit" style="background: none; border: none; color: inherit; padding: 0; cursor: pointer;">
                        <i class="fas fa-heart"></i>
                    </button>
                </label>
            </form>

            <!-- Hidden CSS Radio Controls for Each Card -->
            <input type="radio" name="qty-group-${p.id}" id="qty-${p.id}-1" class="qty-radio qty-r-1" checked>
            <input type="radio" name="qty-group-${p.id}" id="qty-${p.id}-2" class="qty-radio qty-r-2">
            <input type="radio" name="qty-group-${p.id}" id="qty-${p.id}-3" class="qty-radio qty-r-3">
            <input type="radio" name="qty-group-${p.id}" id="qty-${p.id}-4" class="qty-radio qty-r-4">

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

            <!--  Overlay Drawer for Quick Actions -->
            <div class="card-overlay">
                <div class="qty-stepper-container">
                    
                    <!-- Action Labels -->
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

                <!-- Clean, unified price tags using Cart Actions & Exact Dynamic Quantities -->
                <div class="cart-form-container">
                    
                    <!-- Quantity 1 Form -->
                    <form action="${pageContext.request.contextPath}/cart" method="POST" style="display:inline; width:100%;">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="${p.id}">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit" class="btn-cart price-tag-1">add to cart - ${p.price}</button>
                    </form>
                    
                    <!-- Quantity 2 Form -->
                    <form action="${pageContext.request.contextPath}/cart" method="POST" style="display:inline; width:100%;">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="${p.id}">
                        <input type="hidden" name="quantity" value="2">
                        <button type="submit" class="btn-cart price-tag-2">
                            add to cart - Rs. ${(fn:replace(fn:substring(p.price, 4, fn:length(p.price)), ',', '')) * 2}
                        </button>
                    </form>
                    
                    <!-- Quantity 3 Form -->
                    <form action="${pageContext.request.contextPath}/cart" method="POST" style="display:inline; width:100%;">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="${p.id}">
                        <input type="hidden" name="quantity" value="3">
                        <button type="submit" class="btn-cart price-tag-3">
                            add to cart - Rs. ${(fn:replace(fn:substring(p.price, 4, fn:length(p.price)), ',', '')) * 3}
                        </button>
                    </form>
                    
                    <!-- Quantity 4 Form -->
                    <form action="${pageContext.request.contextPath}/cart" method="POST" style="display:inline; width:100%;">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="${p.id}">
                        <input type="hidden" name="quantity" value="4">
                        <button type="submit" class="btn-cart price-tag-4">
                            add to cart - Rs. ${(fn:replace(fn:substring(p.price, 4, fn:length(p.price)), ',', '')) * 4}
                        </button>
                    </form>

                </div>
            </div>
        </div>
    </c:forEach>
</div>

<!-- Pagination Navigation Bar -->
<div class="pagination-container">
    <div class="pagination-bar">
        <c:choose>
            <c:when test="${currentPage > 1}">
                <a href="?page=${currentPage - 1}" class="nav-arrow"><i class="fas fa-chevron-left"></i></a>
            </c:when>
            <c:otherwise>
                <span class="nav-arrow disabled"><i class="fas fa-chevron-left"></i></span>
            </c:otherwise>
        </c:choose>

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

<%@ include file="footer.jsp" %>

</body>
</html>
