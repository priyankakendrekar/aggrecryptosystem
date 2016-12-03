<%-- 
    Document   : PHRHome2
    Created on : 6 Mar, 2016, 11:32:24 AM
    Author     : Napster
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbConnector"%>
<%@page import="mail.SendEmail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.TreeSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    String key;
    String mail;
   
    %>
    <%
        key=request.getParameter("key_");
        
        mail=request.getParameter("mail");
        try
        {
        SendEmail.generateAndSendEmail(mail,key);
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
            
        %>
 

        <jsp:forward page="PHRHome.jsp" />

   




