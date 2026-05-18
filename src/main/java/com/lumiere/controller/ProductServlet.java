package com.lumiere.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// This maps your web request URL to this controller
@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Blueprint for the Product object inside pure Java
    public static class Product {
        private int id;
        private String name, image, alt, stars, price;

        public Product(int id, String name, String image, String alt, String stars, String price) {
            this.id = id; this.name = name; this.image = image;
            this.alt = alt; this.stars = stars; this.price = price;
        }

        // Getters required for JSP Expression Language (EL) access
        public int getId() { return id; }
        public String getName() { return name; }
        public String getImage() { return image; }
        public String getAlt() { return alt; }
        public String getStars() { return stars; }
        public String getPrice() { return price; }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Product> products = new ArrayList<>();
        // PAGE 1 ITEMS
        products.add(new Product(1, "Rose Blush",        "images/blush.png",       "Rose Blush",        "★★★★☆", "Rs. 1,200"));
        products.add(new Product(2, "Glow Serum",        "images/Serum.png",        "Glow Serum",        "★★★★★", "Rs. 2,500"));
        products.add(new Product(3, "Matte Lipstick",    "images/lipstick.png",     "Matte Lipstick",    "★★★☆☆", "Rs. 850"));
        products.add(new Product(4, "Moisturiser SPF",   "images/moisturizer.png",  "Moisturiser SPF",   "★★★★☆", "Rs. 1,800"));
        products.add(new Product(5, "Eyeshadow Palette", "images/eyeshadow.png",    "Eyeshadow Palette", "★★★★★", "Rs. 3,200"));
        products.add(new Product(6, "Face Toner",        "images/toner.png",        "Face Toner",        "★★★★☆", "Rs. 950"));
        products.add(new Product(7, "Lip Gloss",         "images/lipgloss.png",     "Lip Gloss",         "★★★★☆", "Rs. 650"));
        products.add(new Product(8, "Night Cream",       "images/nightcream.png",   "Night Cream",       "★★★★★", "Rs. 2,100"));

        // PAGE 2 ITEMS
        products.add(new Product(9, "Clay Mask",         "images/claymask.png",     "Clay Mask",         "★★★★☆", "Rs. 1,400"));
        products.add(new Product(10, "Cleansing Balm",   "images/balm.png",         "Cleansing Balm",    "★★★★★", "Rs. 1,950"));
        products.add(new Product(11, "Setting Powder",   "images/powder.png",       "Setting Powder",    "★★★★☆", "Rs. 1,100"));
        products.add(new Product(12, "Eyeliner Pen",     "images/eyeliner.png",     "Eyeliner Pen",      "★★★☆☆", "Rs. 750"));
        products.add(new Product(13, "Body Lotion",      "images/lotion.png",       "Body Lotion",       "★★★★☆", "Rs. 1,250"));
        products.add(new Product(14, "Face Scrub",       "images/scrub.png",        "Face Scrub",        "★★★★☆", "Rs. 900"));
        products.add(new Product(15, "Sunscreen Gel",    "images/sunscreen.png",    "Sunscreen Gel",     "★★★★★", "Rs. 2,200"));
        products.add(new Product(16, "Mascara Vol",      "images/mascara.png",      "Mascara Vol",       "★★★★☆", "Rs. 990"));

        // PAGE 3 ITEMS
        products.add(new Product(17, "Lip Tint",         "images/liptint.png",      "Lip Tint",          "★★★★☆", "Rs. 800"));
        products.add(new Product(18, "Face Oil",         "images/faceoil.png",      "Face Oil",          "★★★★★", "Rs. 2,800"));
        products.add(new Product(19, "Concealer",        "images/concealer.png",    "Concealer",         "★★★★☆", "Rs. 1,350"));
        products.add(new Product(20, "Setting Spray",    "images/spray.png",        "Setting Spray",     "★★★★☆", "Rs. 1,600"));
        products.add(new Product(21, "Lip Liner",        "images/lipliner.png",     "Lip Liner",         "★★★☆☆", "Rs. 550"));
        products.add(new Product(22, "Eye Cream",        "images/eyecream.png",     "Eye Cream",         "★★★★☆", "Rs. 1,850"));
        products.add(new Product(23, "Sheet Mask",       "images/sheetmask.png",    "Sheet Mask",        "★★★★★", "Rs. 350"));
        products.add(new Product(24, "Primer Base",      "images/primer.png",       "Primer Base",       "★★★★☆", "Rs. 1,700"));

        // PAGINATION SERVER LOGIC
        int pageSize = 8;
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.trim().isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }

        int totalProducts = products.size();
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        if (currentPage < 1) currentPage = 1;
        if (currentPage > totalPages) currentPage = totalPages;

        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalProducts);

        // Slice data array for current page view window
        List<Product> paginatedList = products.subList(startIndex, endIndex);

        // Forward variables downstream as request attributes
        request.setAttribute("productList", paginatedList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Forward control processing directly to the layout view
        request.getRequestDispatcher("/WEB-INF/pages/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Extract selected checkout data attributes from frontend submit actions
        String productId = request.getParameter("productId");
        String quantity = request.getParameter("quantity");
        
        // Create an item lookup context map message line
        String confirmationMessage = "Successfully added " + quantity + " unit(s) of this cosmetic item to your shopping bag queue.";
        
        // Pass the popup control signals upstream as state storage attributes
        request.setAttribute("showPopupMessage", confirmationMessage);
        
        // Rerun the data display fetch processing loop so screen templates render natively
        doGet(request, response);
    }
}
