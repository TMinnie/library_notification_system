package com.library; 
 
import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet; 
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse; 
import jakarta.servlet.http.HttpSession; 
import java.io.IOException; 
 
@WebServlet("/register") 
public class RegistrationServlet extends HttpServlet { 
 
    @Override 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException { 
        String username = request.getParameter("username"); 
        String password = request.getParameter("password"); 
 
        // Check if the username already exists 
        if (LoginServlet.users.containsKey(username)) { 
            // Set an error message as a request attribute 
            request.setAttribute("errorMessage", "Username already exists."); 
            request.getRequestDispatcher("registration.jsp").forward(request, response); 
        } else { 
            // Register the new user 
            LoginServlet.users.put(username, password); 
            // Automatically log the user in after registration and create session 
            HttpSession session = request.getSession(); 
            session.setAttribute("username", username); 
            // Redirect to the home page after registration 
            response.sendRedirect("home.jsp"); 
        } 
    } 
}