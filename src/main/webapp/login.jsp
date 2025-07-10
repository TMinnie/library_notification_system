
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
    </head>
    <body>
        <div class="heading"></div>
        <div class="container">
            <h1>Library Notification System</h1>
            <h2>Login</h2>
            <form action="login" method="POST">
                <input type="text" name="username" placeholder="Username" required><br>
                <input type="password" name="password" placeholder="Password" required><br>
                
                <%-- Display error message if set --%>
                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                <% if (errorMessage != null) {%>
                <div class="error-message"><%= errorMessage%></div>
                <% }%>
                
                
                <button id="button" type="submit" value="Login">Login</button>
            </form>
            <a href="registration.jsp" class="switch-link">Don't have an account? Register here</a>
        </div>
    </body>
</html>


