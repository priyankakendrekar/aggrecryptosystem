<%-- 
    Document   : update
    Created on : 4 Mar, 2016, 9:50:37 AM
    Author     : Napster
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<%!
    String id,ac;
    String k[];
    String n[];
    %>
    <%
        k=request.getParameterValues("kb11");
        //id=request.getParameter("id");
        ac=session.getAttribute("acc").toString();
        %>
        
        <%
           
          
          for(int i=0;i<k.length;i++)
          {
                try
            {
            String sql = "update request set flag='true' where actuary='"+ac+"' and filename='"+k[i]+"'";
            System.out.println(";;;;;;;;;;;;;;;" + sql);
            PreparedStatement pst = null;
            Connection conn = null;
            conn = DbConnector.getConnection();
            pst = conn.prepareStatement(sql);
            pst.executeUpdate();
            }
            catch(Exception e){}
          }
          
            %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<jsp:forward page="PHRHome.jsp" />