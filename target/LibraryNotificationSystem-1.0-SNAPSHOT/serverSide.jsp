<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<title>Server-side</title> 
<link rel="stylesheet" type="text/css" href="CSS/style.css"> 
<script>
document.addEventListener("DOMContentLoaded", function () {
    var socket = new WebSocket("ws://localhost:8080/LNS/notifications");

    socket.onopen = function () {
        console.log("WebSocket connection established.");
    };

    socket.onmessage = function (event) {
        alert("New notification: " + event.data);
        localStorage.setItem("lastNotification", event.data);
    };

    // Let the form submit normally
    document.getElementById("notificationForm").onsubmit = function () {
        console.log("Form submitted. Servlet will handle broadcast.");
    };
});
</script>

    </head> 
    <body> 
        <div class="container"> 
            <h1>Library Notification System</h1> 
 
            <% 
                HttpSession sessionObj = request.getSession(false); 
                    if (sessionObj == null || sessionObj.getAttribute("username") == null) { 
                    response.sendRedirect("login.jsp?error=Please login first"); 
                    return; 
                } 
                 
            %>  
        
            <p style="margin-bottom: 12px">Write a notification to send to the library users</p> 
            <!-- Form to input the message --> 
            <form id="notificationForm" action="connect" method="POST"> 
                <textarea id="message" class="message" name="message"  
                          placeholder="Enter your message here..."  
                          rows="15" cols="50" required></textarea><br/> 
                           
                <input id="button" type="submit" value="Send Notification"/> 
 
            </form> 
        </div> 
    </body> 
</html> 
