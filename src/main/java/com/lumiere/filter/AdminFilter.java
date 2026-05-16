package com.lumiere.filter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.lumiere.model.UserModel;
import java.io.IOException;

public class AdminFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("user") != null) {
            UserModel user = (UserModel) session.getAttribute("user");
            if ("admin".equals(user.getRole())) {
                chain.doFilter(request, response); // admin goes through
            } else {
                res.sendRedirect(req.getContextPath() + "/home"); // normal user kicked out
            }
        } else {
            res.sendRedirect(req.getContextPath() + "/login"); // not logged in at all
        }
    }
}