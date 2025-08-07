<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
        <script>
            function logout() {
                window.location.href = "LogoutServlet";
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Library Notification System</h1>

            <%
                HttpSession sessionObj = request.getSession(false);
                // Retrieve the username from the session
                String username = (sessionObj != null) ? (String) sessionObj.getAttribute("username") : null;
                if (sessionObj == null || sessionObj.getAttribute("username") == null) {
                    response.sendRedirect("login.jsp?error=Please login first");
                    return;
                }
                
            %> 

            <!-- Display a message with the logged-in user's name -->
            <h2>Welcome, <%= username%>!</h2>

            <button id="button" onclick="window.location.href = 'notification.jsp'">View Notifications</button>
            <br/> <button id="button" onclick="logout()">Logout</button> 


        </div>
    </body>
</html>
