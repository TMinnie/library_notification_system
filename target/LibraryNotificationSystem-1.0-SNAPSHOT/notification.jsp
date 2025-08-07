<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Notification Page</title> 
        <link rel="stylesheet" type="text/css" href="CSS/style.css"> 
    </head> 
    <body> 
        <div class="container"> 
 
            <% 
                HttpSession sessionObj = request.getSession(false); 
                if (sessionObj == null || sessionObj.getAttribute("username") == null) { 
                    response.sendRedirect("login.jsp?error=Please login first"); 
                    return; 
                } 
            %>  
 
            <h1>Library Notification System</h1> 
            <h2>Latest Notifications</h2> 
 
            <!-- Form to input the message --> 
            <textarea id="message" class="message" name="message"  
                      rows="15" cols="50" readonly=""></textarea><br/> 
            <button id="button" onclick="window.location.href='home.jsp'">Back to Home</button>
        </div> 
    </body> 
 
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        var socket = new WebSocket("ws://localhost:8080/LNS/notifications");

        socket.onopen = function () {
            console.log("Connected to notification server.");
        };

        socket.onmessage = function (event) {
            var notification = event.data;
            document.getElementById("message").value = notification;
            localStorage.setItem("lastNotification", notification);
        };

        // Load last notification on page load
        var lastNotification = localStorage.getItem("lastNotification");
        if (lastNotification) {
            document.getElementById("message").value = lastNotification;
        } else {
            document.getElementById("message").value = "No new notifications.";
        }
    });
    </script>

</html>