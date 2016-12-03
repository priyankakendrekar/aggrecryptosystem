<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%!
    String val[];
    String val1[];
    int n;
    %>
   
    <%
        val=request.getParameterValues("kb11");
        val1=request.getParameterValues("kb12");
        n=val.length;
        for(int i=0;i<n;i++)
        {
            try
            {
            String h=val[i];
            String h1=val1[0];
            String j=request.getParameter("userid");
            String sql = "insert into request values('"+session.getAttribute("userid")+"','"+h1+"','"+h+"'"+",'false')";
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
<jsp:forward page="ActuaryHome.jsp" />