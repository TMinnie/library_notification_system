package com.library; 
 
import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet; 
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse; 
import jakarta.servlet.http.HttpSession; 
import java.io.IOException; 
import java.util.HashMap; 
 
@WebServlet("/login") 
public class LoginServlet extends HttpServlet { 
    // HashMap stores usersnames and passswords 
    public static final HashMap<String, String> users = new HashMap<>(); 
 
    @Override 
    public void init() { 
        // Pre-populating with dummy users 
        users.put("admin", "admin123"); 
        users.put("member", "member123"); 
    } 
 
    @Override 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException { 
        String username = request.getParameter("username"); 
        String password = request.getParameter("password"); 
 
        if (users.containsKey(username) && users.get(username).equals(password)) { 
            // Successful login, create a session 
            HttpSession session = request.getSession(); 
            session.setAttribute("username", username); 
            response.sendRedirect("home.jsp");  // Redirect to home 
        } else { 
            // Invalid login, send an error message to the JSP 
            request.setAttribute("errorMessage", "Invalid username or password"); 
            request.getRequestDispatcher("login.jsp").forward(request, response); 
        } 
    } 
} 