<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.*, service.*, service.impl.*, utils.*, java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>https://www.online-shop.com</title>
    </head>
    <body>
        <h2 align="center">Hello <%= (String) session.getAttribute("login") %>!</h2>
        <div align="center">
            <%
                GoodService goodService = new GoodServiceImpl();

                String chosenGoods = (String) session.getAttribute("chosenGoods");

                out.println("<h2><pre>" + goodService.getChoice(chosenGoods) + "</pre></h2>");
            %>
        </div>
        <form action="goods" method="post" align="center">
            <select name="goodName" id="goodName">
                <%
                    List<Good> goods = goodService.getAll();

                    out.println(goodService.getStringOfOptionsForDroppingMenuFromGoodList(goods));
                %>
            </select>
                <br/><br/>
            <input name="submit" type="submit" value="Add Good">
            <input name="submit" type="submit" value="Submit">
                <br/><br/>
            <input name="submit" type="submit" value="Remove Good">
            <input name="submit" type="submit" value="Log out">
        </form>
    </body>
</html>
