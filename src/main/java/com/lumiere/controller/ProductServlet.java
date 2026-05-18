package com.lumiere.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Maps web request URLs to this specific controller component
@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Inner class representing a product entity instance within Java memory space
    public static class Product {
        private int id;
        private String name, image, alt, stars, price;

        // Initializes a new product data container with essential display attributes
        public Product(int id, String name, String image, String alt, String stars, String price) {
            this.id = id; this.name = name; this.image = image;
            this.alt = alt; this.stars = stars; this.price = price;
        }

        // Standard accessor methods required for JSP Expression Language properties resolution
        public int getId() { return id; }
        public String getName() { return name; }
        public String getImage() { return image; }
        public String getAlt() { return alt; }
        public String getStars() { return stars; }
        public String getPrice() { return price; }
    }

    // Handles incoming GET requests to display the paginated product collection
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Simulates an underlying database storage table list compilation
        List<Product> products = new ArrayList<>();
        // ITEMS COLLECTION FOR PAGE ONE DISPLAY WINDOW
        products.add(new Product(1, "Rose Blush",        "images/blush.png",       "Rose Blush",        "★★★★☆", "Rs. 1,200"));
        products.add(new Product(2, "Glow Serum",        "images/Serum.png",        "Glow Serum",        "★★★★★", "Rs. 2,500"));
        products.add(new Product(3, "Matte Lipstick",    "images/lipstick.png",     "Matte Lipstick",    "★★★☆☆", "Rs. 850"));
        products.add(new Product(4, "Moisturiser SPF",   "images/moisturizer.png",  "Moisturiser SPF",   "★★★★☆", "Rs. 1,800"));
        products.add(new Product(5, "Eyeshadow Palette", "images/eyeshadow.png",    "Eyeshadow Palette", "★★★★★", "Rs. 3,200"));
        products.add(new Product(6, "Face Toner",        "images/toner.png",        "Face Toner",        "★★★★☆", "Rs. 950"));
        products.add(new Product(7, "Lip Gloss",         "images/lipgloss.png",     "Lip Gloss",         "★★★★☆", "Rs. 650"));
        products.add(new Product(8, "Night Cream",       "images/nightcream.png",   "Night Cream",       "★★★★★", "Rs. 2,100"));

        // ITEMS COLLECTION FOR PAGE TWO DISPLAY WINDOW
        products.add(new Product(9, "Clay Mask",         "images/claymask.png",     "Clay Mask",         "★★★★☆", "Rs. 1,400"));
        products.add(new Product(10, "Cleansing Balm",   "images/balm.png",         "Cleansing Balm",    "★★★★★", "Rs. 1,950"));
        products.add(new Product(11, "Setting Powder",   "images/powder.png",       "Setting Powder",    "★★★★☆", "Rs. 1,100"));
        products.add(new Product(12, "Eyeliner Pen",     "images/eyeliner.png",     "Eyeliner Pen",      "★★★☆☆", "Rs. 750"));
        products.add(new Product(13, "Body Lotion",      "images/lotion.png",       "Body Lotion",       "★★★★☆", "Rs. 1,250"));
        products.add(new Product(14, "Face Scrub",       "images/scrub.png",        "Face Scrub",        "★★★★☆", "Rs. 900"));
        products.add(new Product(15, "Sunscreen Gel",    "images/sunscreen.png",    "Sunscreen Gel",     "★★★★★", "Rs. 2,200"));
        products.add(new Product(16, "Mascara Vol",      "images/mascara.png",      "Mascara Vol",       "★★★★☆", "Rs. 990"));

        // ITEMS COLLECTION FOR PAGE THREE DISPLAY WINDOW
        products.add(new Product(17, "Lip Tint",         "images/liptint.png",      "Lip Tint",          "★★★★☆", "Rs. 800"));
        products.add(new Product(18, "Face Oil",         "images/faceoil.png",      "Face Oil",          "★★★★★", "Rs. 2,800"));
        products.add(new Product(19, "Concealer",        "images/concealer.png",    "Concealer",         "★★★★☆", "Rs. 1,350"));
        products.add(new Product(20, "Setting Spray",    "images/spray.png",        "Setting Spray",     "★★★★☆", "Rs. 1,600"));
        products.add(new Product(21, "Lip Liner",        "images/lipliner.png",     "Lip Liner",         "★★★☆☆", "Rs. 550"));
        products.add(new Product(22, "Eye Cream",        "images/eyecream.png",     "Eye Cream",         "★★★★☆", "Rs. 1,850"));
        products.add(new Product(23, "Sheet Mask",       "images/sheetmask.png",    "Sheet Mask",        "★★★★★", "Rs. 350"));
        products.add(new Product(24, "Primer Base",      "images/primer.png",       "Primer Base",       "★★★★☆", "Rs. 1,700"));

        // Server-side calculation boundaries for managing data pagination pages
        int pageSize = 8;
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        
        // Parses incoming request page parameters and falls back safely on data discrepancies
        if (pageParam != null && !pageParam.trim().isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }

        // Calculates total pages and clamps current page inside logical bounds
        int totalProducts = products.size();
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        if (currentPage < 1) currentPage = 1;
        if (currentPage > totalPages) currentPage = totalPages;

        // Pinpoints segment partition array boundaries for sub-selection matching
        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalProducts);

        // Extracts exactly one screen size slice payload from the global product list array
        List<Product> paginatedList = products.subList(startIndex, endIndex);

        // Binds calculated parameters inside context container attributes
        request.setAttribute("productList", paginatedList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Hands off request execution pipeline processing directly over to the layout viewer context
        request.getRequestDispatcher("/WEB-INF/pages/product.jsp").forward(request, response);
    }

    // Handles incoming POST data submissions whenever cart update interactions trigger
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Extract selected checkout data attributes from frontend form submit configurations
        String productId = request.getParameter("productId");
        String quantity = request.getParameter("quantity");
        
        // Assembles systemic validation text strings tracking cart operations
        String confirmationMessage = "Successfully added " + quantity + " unit(s) of this cosmetic item to your shopping bag queue.";
        
        // Sets up validation signal attributes matching target frontend container flags
        request.setAttribute("showPopupMessage", confirmationMessage);
        
        // Reruns foundational retrieval pipelines ensuring data consistency across re-renders
        doGet(request, response);
    }
}
