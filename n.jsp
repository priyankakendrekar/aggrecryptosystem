<%-- 
    Document   : n
    Created on : 5 Mar, 2016, 6:05:08 PM
    Author     : Napster
--%>
<%!
    String h[];
    %>
    <%
        h=request.getParameterValues("kb5");
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World! <%= h[0] %>></h1>
    </body>
</html>
