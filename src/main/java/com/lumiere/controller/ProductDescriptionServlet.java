package com.lumiere.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/productdescription")
public class ProductDescriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Data layout blueprint container matching product attributes
    public static class ProductItem {
        private int id;
        private String name, image, alt, stars, price, volume, description;

        public ProductItem(int id, String name, String image, String alt, String stars, String price, String volume, String description) {
            this.id = id; this.name = name; this.image = image; this.alt = alt;
            this.stars = stars; this.price = price; this.volume = volume; this.description = description;
        }

        public int getId() { return id; }
        public String getName() { return name; }
        public String getImage() { return image; }
        public String getAlt() { return alt; }
        public String getStars() { return stars; }
        public String getPrice() { return price; }
        public String getVolume() { return volume; }
        public String getDescription() { return description; }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<ProductItem> allItems = new ArrayList<>();
        // Mock inventory item records containing comprehensive descriptive text lines
        allItems.add(new ProductItem(1, "Rose Blush", "images/blush.png", "Rose Blush", "★★★★☆", "Rs. 1,200", "0.15 oz", "A lightweight liquid formula that blends effortlessly for a healthy, natural looking flush of color on your skin. Built with micro-milled mineral pigments to avoid clotting."));
        allItems.add(new ProductItem(2, "Glow Serum", "images/Serum.png", "Glow Serum", "★★★★★", "Rs. 2,500", "1.01 oz", "Formulated to instantly quench skin surface layer tissues. Delivers intense 24-hour hydration while adding an effortless dewy luster to your cheekbones."));
        allItems.add(new ProductItem(3, "Matte Lipstick", "images/lipstick.png", "Matte Lipstick", "★★★☆☆", "Rs. 850", "0.12 oz", "A smooth, non-drying matte formulation that sets quickly without settling into fine lip lines. Offers long-lasting hydration and comfortable daily wear."));
        allItems.add(new ProductItem(4, "Moisturiser SPF", "images/moisturizer.png", "Moisturiser SPF", "★★★★☆", "Rs. 1,800", "1.70 oz", "A fast-absorbing cream designed to defend skin cells against radiation damage while providing vital essential lipid moisture matrix benefits."));
        allItems.add(new ProductItem(5, "Eyeshadow Palette", "images/eyeshadow.png", "Eyeshadow Palette", "★★★★★", "Rs. 3,200", "0.45 oz", "Contains foundational luxury neutral tones optimized for all skin tones. Features high-payoff velvet matte and shimmery reflective pressed shadow pans."));
        allItems.add(new ProductItem(6, "Face Toner", "images/toner.png", "Face Toner", "★★★★☆", "Rs. 950", "5.00 oz", "Removes stubborn excess oils and trace impurities while balancing pH values. Enriched with skin-soothing botanical extracts."));
        allItems.add(new ProductItem(7, "Lip Gloss", "images/lipgloss.png", "Lip Gloss", "★★★★☆", "Rs. 650", "0.16 oz", "A high-shine finish that delivers a cushiony, comfortable feel without any sticky residue. Leaves a hint of buildable custom tint."));
        allItems.add(new ProductItem(8, "Night Cream", "images/nightcream.png", "Night Cream", "★★★★★", "Rs. 2,100", "1.69 oz", "Works throughout your nightly rest phase to revitalize tired surface cells. Formulated with rich botanical moisturizers."));
        allItems.add(new ProductItem(9, "Clay Mask", "images/claymask.png", "Clay Mask", "★★★★☆", "Rs. 1,400", "2.00 oz", "Deeply detoxifies skin layers."));
        allItems.add(new ProductItem(10, "Cleansing Balm", "images/balm.png", "Cleansing Balm", "★★★★★", "Rs. 1,950", "3.20 oz", "Melts away long-wear pigments instantly."));
        allItems.add(new ProductItem(11, "Setting Powder", "images/powder.png", "Setting Powder", "★★★★☆", "Rs. 1,100", "0.70 oz", "Locks makeup layout for up to 16 hours."));
        allItems.add(new ProductItem(12, "Eyeliner Pen", "images/eyeliner.png", "Eyeliner Pen", "★★★☆☆", "Rs. 750", "0.03 oz", "Ultra-precise tip structure."));

        // Capture requested target reference identity integer from incoming browser context
        int targetId = 1;
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.trim().isEmpty()) {
            try {
                targetId = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
                targetId = 1;
            }
        }

        // Search engine lookup routine for the matched catalog record.
        ProductItem selectedProduct = null;
        for (ProductItem item : allItems) {
            if (item.getId() == targetId) {
                selectedProduct = item;
                break;
            }
        }
        if (selectedProduct == null) {
            selectedProduct = allItems.get(0);
        }

        // CAROUSEL PAGINATION IN THE BOTTOM BAR
        int recPage = 1;
        String recPageParam = request.getParameter("recPage");
        if (recPageParam != null && !recPageParam.trim().isEmpty()) {
            try { 
                recPage = Integer.parseInt(recPageParam); 
            } catch (NumberFormatException e) { 
                recPage = 1; 
            }
        }

        // Build alternative list subset (Excluding active viewing item)
        List<ProductItem> availableRecs = new ArrayList<>();
        for (ProductItem item : allItems) {
            if (item.getId() != selectedProduct.getId()) {
                availableRecs.add(item);
            }
        }

        int pageSize = 4; // Exactly 4 display items inside the slider row
        int totalRecPages = (int) Math.ceil((double) availableRecs.size() / pageSize);
        if (recPage < 1) recPage = 1;
        if (recPage > totalRecPages) recPage = totalRecPages;

        int startIdx = (recPage - 1) * pageSize;
        int endIdx = Math.min(startIdx + pageSize, availableRecs.size());
        List<ProductItem> pageRecommendations = availableRecs.subList(startIdx, endIdx);

        // Forward payload references upstream
        request.setAttribute("product", selectedProduct);
        request.setAttribute("recommendations", pageRecommendations);
        request.setAttribute("currentRecPage", recPage);
        request.setAttribute("totalRecPages", totalRecPages);

        request.getRequestDispatcher("/WEB-INF/pages/productdescription.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String productId = request.getParameter("productId");
        String quantity = request.getParameter("quantity");
        
        String confirmationMessage = "Successfully registered your selection item payload on the server layer.";
        request.setAttribute("showPopupMessage", confirmationMessage);
        
        doGet(request, response);
    }
}
