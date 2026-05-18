<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} - Lumière</title>
    <link rel="stylesheet" href="https://cloudflare.com">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productdescription.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="desc-wrapper">
    
    <!-- PURE CSS GALLERY RADIO ENGINE -->
    <input type="radio" id="img-slot-1" name="gallery-select" class="gallery-radio-trigger" checked>
    <input type="radio" id="img-slot-2" name="gallery-select" class="gallery-radio-trigger">
    <input type="radio" id="img-slot-3" name="gallery-select" class="gallery-radio-trigger">
    <input type="radio" id="img-slot-4" name="gallery-select" class="gallery-radio-trigger">

    <!-- PURE CSS SHADE DOT SELECTION ENGINE -->
    <input type="radio" id="shade-1" name="shade-select" class="shade-radio-trigger" checked>
    <input type="radio" id="shade-2" name="shade-select" class="shade-radio-trigger">
    <input type="radio" id="shade-3" name="shade-select" class="shade-radio-trigger">
    <input type="radio" id="shade-4" name="shade-select" class="shade-radio-trigger">

    <!-- PURE CSS QUANTITY STEPPER ENGINE -->
    <input type="radio" id="desc-qty-1" name="desc-qty-group" class="desc-qty-radio d-qty-r-1" checked>
    <input type="radio" id="desc-qty-2" name="desc-qty-group" class="desc-qty-radio d-qty-r-2">
    <input type="radio" id="desc-qty-3" name="desc-qty-group" class="desc-qty-radio d-qty-r-3">
    <input type="radio" id="desc-qty-4" name="desc-qty-group" class="desc-qty-radio d-qty-r-4">

    <!-- TOP ACTIVE MODULE SECTION -->
    <div class="main-details-section">
        <div class="gallery-column">
            <div class="thumbnails-strip">
                <label for="img-slot-1" class="thumb-box t-box-1"><img src="${product.img1}" alt="View 1"></label>
                <label for="img-slot-2" class="thumb-box t-box-2"><img src="${product.img2}" alt="View 2"></label>
                <label for="img-slot-3" class="thumb-box t-box-3"><img src="${product.img3}" alt="View 3"></label>
                <label for="img-slot-4" class="thumb-box t-box-4"><img src="${product.img4}" alt="View 4"></label>
            </div>
            <div class="main-display-frame">
                <img src="${product.img1}" class="main-view-img view-img-1" alt="${product.alt}">
                <img src="${product.img2}" class="main-view-img view-img-2" alt="${product.alt}">
                <img src="${product.img3}" class="main-view-img view-img-3" alt="${product.alt}">
                <img src="${product.img4}" class="main-view-img view-img-4" alt="${product.alt}">
            </div>
        </div>

        <div class="info-column">
            <p class="breadcrumbs">home / luxury essentials</p>
            <h1 class="item-heading">${product.name}</h1>
            <p class="meta-line">${product.volume} | hydrating luxury blend</p>
            <p class="rating-stars">${product.stars}</p>

            <!-- Fixation 3: Dynamic Options Labels -->
            <div class="option-label">${product.optionLabel}: 
                <span class="shade-txt text-1">${product.optionName1}</span>
                <span class="shade-txt text-2">${product.optionName2}</span>
                <span class="shade-txt text-3">${product.optionName3}</span>
                <span class="shade-txt text-4">${product.optionName4}</span>
            </div>

            <!-- Fixation 3: Dynamic Swatch Colors -->
            <div class="swatches-row">
                <label for="shade-1" class="swatch-dot dot-1" style="background-color: ${product.optionStyle1};"></label>
                <label for="shade-2" class="swatch-dot dot-2" style="background-color: ${product.optionStyle2};"></label>
                <label for="shade-3" class="swatch-dot dot-3" style="background-color: ${product.optionStyle3};"></label>
                <label for="shade-4" class="swatch-dot dot-4" style="background-color: ${product.optionStyle4};"></label>
            </div>

            <div class="purchase-actions-row">
                <div class="qty-stepper-container">
                    <div class="minus-btn-stack">
                        <label class="step-lbl l-down-disabled"><i class="fas fa-minus"></i></label>
                        <label for="desc-qty-1" class="step-lbl l-down-to-1"><i class="fas fa-minus"></i></label>
                        <label for="desc-qty-2" class="step-lbl l-down-to-2"><i class="fas fa-minus"></i></label>
                        <label for="desc-qty-3" class="step-lbl l-down-to-3"><i class="fas fa-minus"></i></label>
                    </div>
                    <div class="digits-view-stack">
                        <span class="count-digit digit-1">1</span>
                        <span class="count-digit digit-2">2</span>
                        <span class="count-digit digit-3">3</span>
                        <span class="count-digit digit-4">4</span>
                    </div>
                    <div class="plus-btn-stack">
                        <label for="desc-qty-2" class="step-lbl l-up-to-2"><i class="fas fa-plus"></i></label>
                        <label for="desc-qty-3" class="step-lbl l-up-to-3"><i class="fas fa-plus"></i></label>
                        <label for="desc-qty-4" class="step-lbl l-up-to-4"><i class="fas fa-plus"></i></label>
                        <label class="step-lbl l-up-disabled"><i class="fas fa-plus"></i></label>
                    </div>
                </div>

                <!-- Fixation 1: Main Product Price Scaling via JSTL Slicing String Math -->
                <form action="products" method="POST" class="cart-form-container">
                    <input type="hidden" name="productId" value="${product.id}">
                    <button type="submit" class="cart-submit-btn card-p-1">add to cart - ${product.price}</button>
                    <button type="submit" class="cart-submit-btn card-p-2">
                        add to cart - Rs. ${(fn:replace(fn:substring(product.price, 4, fn:length(product.price)), ',', '')) * 2}
                    </button>
                    <button type="submit" class="cart-submit-btn card-p-3">
                        add to cart - Rs. ${(fn:replace(fn:substring(product.price, 4, fn:length(product.price)), ',', '')) * 3}
                    </button>
                    <button type="submit" class="cart-submit-btn card-p-4">
                        add to cart - Rs. ${(fn:replace(fn:substring(product.price, 4, fn:length(product.price)), ',', '')) * 4}
                    </button>
                </form>
            </div>

            <!-- INFOGRAPHIC BLOCKS -->
            <div class="accordion-item">
                <input type="checkbox" id="toggle-details" class="accordion-toggle-input" checked>
                <label for="toggle-details" class="accordion-header">details <i class="fas icon-state"></i></label>
                <div class="accordion-panel">${product.description}</div>
            </div>
            <div class="accordion-item">
                <input type="checkbox" id="toggle-ingredients" class="accordion-toggle-input">
                <label for="toggle-ingredients" class="accordion-header">ingredients <i class="fas icon-state"></i></label>
                <div class="accordion-panel">Enriched with Organic Coconut Water Extract, Vegetable Glycerin, Hyaluronic Acid, Rosewater Distillate, and Botanical Mineral Colorants.</div>
            </div>

            <!-- Fixation 2: Fixed Sparkles and Added 5th Limited Edition Circular Badge -->
            <div class="badges-flex-container">
                <div class="badge-unit"><div class="badge-ring"><i class="fas fa-leaf"></i></div><p class="badge-caption">vegan</p></div>
                <div class="badge-unit"><div class="badge-ring"><i class="fas fa-paw"></i></div><p class="badge-caption">cruelty free</p></div>
                <div class="badge-unit"><div class="badge-ring"><i class="fas fa-star"></i></div><p class="badge-caption">clean</p></div>
                <div class="badge-unit"><div class="badge-ring"><i class="fas fa-prescription-bottle-medical"></i></div><p class="badge-caption">paraben free</p></div>
                <div class="badge-unit"><div class="badge-ring"><i class="fas fa-clock"></i></div><p class="badge-caption">limited-edition</p></div>
            </div>
        </div>
    </div>

    <!-- Fixation 4: Unique Custom Editorial Quotes and Usage Guides -->
    <div class="editorial-banner-grid">
        <div class="promo-editorial-card">
            <span class="brand-tag-note">from lumiere</span>
            <h2 class="editorial-quote-text">${product.editorialQuote}</h2>
            <img src="${product.img5}" alt="Lifestyle Frame">
        </div>
        <div class="instructional-use-card">
            <h3 class="use-guide-heading">how to use</h3>
            <div class="use-images-split">
                <img src="${product.img6}" alt="Use 1">
                <img src="${product.img7}" alt="Use 2">
            </div>
            <p class="use-instruction-paragraph">${product.useInstruction}</p>
        </div>
    </div>

    <!-- Fixation 4: Unique Custom Why We Love It Features Matrices -->
    <div class="editorial-banner-grid">
        <div class="why-love-card">
            <h3 class="use-guide-heading" style="margin-bottom:24px;">why we love it</h3>
            <p class="love-feature-title">${product.fTitle1}</p>
            <p class="love-feature-body">${product.fBody1}</p>
            <p class="love-feature-title">${product.fTitle2}</p>
            <p class="love-feature-body">${product.fBody2}</p>
            <p class="love-feature-title">${product.fTitle3}</p>
            <p class="love-feature-body">${product.fBody3}</p>
        </div>
        <div class="why-love-visual"><img src="${product.img8}" alt="Family Frame"></div>
    </div>

    <!-- Fixation 5: Clean Recommendations Container (Removed Pagination Slider Page Dots) -->
    <div class="recommendations-carousel-header">
        <h2>YOU MAY ALSO LIKE</h2>
    </div>

    <!-- Fixation 5: Clickable Recommendation Grid Items containing Hover Drawer Actions -->
    <div class="recommendations-flex-row">
        <c:forEach var="rec" items="${recommendations}">
            <div class="rec-item-card">
                <input type="radio" name="rec-qty-group-${rec.id}" id="rec-qty-${rec.id}-1" class="rec-radio rec-r-1" checked>
                <input type="radio" name="rec-qty-group-${rec.id}" id="rec-qty-${rec.id}-2" class="rec-radio rec-r-2">
                <input type="radio" name="rec-qty-group-${rec.id}" id="rec-qty-${rec.id}-3" class="rec-radio rec-r-3">

                <div class="rec-image-holder">
                    <span class="rec-badge-tag">new collection</span>
                    <!-- Clickable Redirect Link Trigger Anchor -->
                    <a href="productdescription?id=${rec.id}"><img src="${rec.image}" alt="${rec.alt}"></a>
                </div>
                <div class="rec-card-meta">
                    <p class="rec-stars">${rec.stars}</p>
                    <p class="rec-title">${rec.name}</p>
                    <p class="rec-price">${rec.price}</p>
                </div>

                <!-- SLIDE UP ACTIVE HOVER MENU OVERLAY DRAWER WITH PRICE MULTIPLICATION ENGINE -->
                <div class="rec-card-overlay">
                    <div class="rec-qty-container">
                        <div class="rec-btn-stack">
                            <label class="rec-lbl r-down-dis"><i class="fas fa-minus"></i></label>
                            <label for="rec-qty-${rec.id}-1" class="rec-lbl r-down-to-1"><i class="fas fa-minus"></i></label>
                            <label for="rec-qty-${rec.id}-2" class="rec-lbl r-down-to-2"><i class="fas fa-minus"></i></label>
                        </div>
                        <div class="rec-digits-stack">
                            <span class="rec-digit r-dig-1">1</span>
                            <span class="rec-digit r-dig-2">2</span>
                            <span class="rec-digit r-dig-3">3</span>
                        </div>
                        <div class="rec-btn-stack">
                            <label for="rec-qty-${rec.id}-2" class="rec-lbl r-up-to-2"><i class="fas fa-plus"></i></label>
                            <label for="rec-qty-${rec.id}-3" class="rec-lbl r-up-to-3"><i class="fas fa-plus"></i></label>
                            <label class="rec-lbl r-up-dis"><i class="fas fa-plus"></i></label>
                        </div>
                    </div>
                    <form action="products" method="POST" style="flex:1; display:flex;">
                        <input type="hidden" name="productId" value="${rec.id}">
                        <button type="submit" class="rec-cart-btn r-tag-1">add to cart - ${rec.price}</button>
                        <button type="submit" class="rec-cart-btn r-tag-2">
                            add to cart - Rs. ${(fn:replace(fn:substring(rec.price, 4, fn:length(rec.price)), ',', '')) * 2}
                        </button>
                        <button type="submit" class="rec-cart-btn r-tag-3">
                            add to cart - Rs. ${(fn:replace(fn:substring(rec.price, 4, fn:length(rec.price)), ',', '')) * 3}
                        </button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

</div>

<%@ include file="footer.jsp" %>

</body>
</html>
