<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="service.*, service.impl.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>https://www.online-shop.com</title>
    </head>
    <body>
        <div align="center">
            <h2>
                <%
                    UserService userService = new UserServiceImpl();
                    String login = request.getParameter("login");
                    String password = request.getParameter("password");

                    out.println(userService.invalidUser(login, password));
                %>
            </h2>
            <h2>Please, try again <a href="http://localhost:8081/register">here</a></h2>
        </div>
    </body>
</html>