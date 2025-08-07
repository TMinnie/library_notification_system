<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registration Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/style.css">
        <script>
            // Validate form before submission
            function validateForm() {
                var username = document.forms["registerForm"]["username"].value;
                var password = document.forms["registerForm"]["password"].value;
                if (username == "") {
                    alert("Username must be filled out");
                    return false;
                }
                if (password.length < 6) {
                    alert("Password must be at least 6 characters long");
                    return false;
                }
                return true;  // If validation passes, submit the form
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Library Notification System</h1>
            <h2>Register</h2>
            <form action="register" name="registerForm" method="POST" onsubmit="return validateForm()">
                <input type="text" name="username" placeholder="Username" required/><br/>
                <input type="password" name="password" placeholder="Password" required/><br/>
                
                <%-- Display error message if it exists --%>
                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                <% if (errorMessage != null) {%>
                <div class="error-message"><%= errorMessage%></div>
                <% }%>
                
                <button id="button"type="submit">Register</button>
            </form>
            <a href="login.jsp" class="switch-link">Already have an account? Login here</a>
        </div>
    </body>
</html>
