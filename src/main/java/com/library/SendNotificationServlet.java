package com.library; 
 
import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet; 
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse; 
import jakarta.servlet.http.HttpSession; 
import java.io.IOException; 
 
@WebServlet("/connect") 
public class SendNotificationServlet extends HttpServlet { 
 
    @Override 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException { 
 
        String message = request.getParameter("message"); 
        // Broadcast the message to all WebSocket sessions 
        NotificationEndpoint.broadcast(message); 
 
        // Redirect after sending the message 
        response.sendRedirect("serverSide.jsp"); 
    } 
}