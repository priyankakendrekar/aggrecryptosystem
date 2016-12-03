
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="com.util.Utilities"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    String arr[],arr1[];
    String h,h1;
    int len,len1;
    StringBuffer sb=new StringBuffer();
     StringBuffer sb1=new StringBuffer();
    %>
<%

    arr=request.getParameterValues("kb11");
    arr1=request.getParameterValues("kb15");
    HttpSession session1 = request.getSession();
                session1.setAttribute("phrname", arr1[0]);
    if(arr1==null)
        sb1.append(" ");
    else
    {
        len1=arr1.length;
         for(int i=0;i<len1;i++)
    {
        String path="D:/images/"+arr1[i]+"//"+arr[i];
        String path1="C:/Users/Dell/Desktop/All/"+arr[i];
        File f1=new File(path);
        File f2=new File(path1);
        
        FileUtils.copyFile(f1, f2);
        sb.append(arr[i]);
    }
         h=new String(sb);
    }
   
    %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Key-Aggregate Cryptosystem for Scalable Data Sharing in Cloud Storage</title>
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css'>
            
            </head>
           <link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
                <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
                
                <body>
                    <div id="wrapper">
                        <div id="header-wrapper">
                            <div id="header" class="container">
                                <div id="logo">
                                    <h1><a href="#">PHR SYSTEM</a></h1>
                                </div>
                                <div id="menu">
                                    <ul>
                                        <li class="first current_page_item"><a href="#">Actuary Home</a></li>                       
                                        <li><a href="index.jsp">LogOut</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div id="banner">
                                <div class="content"><img src="images/img02.jpg" width="1000" height="300" alt="" /></div>
                            </div>
                        </div>
                        <!-- end #header -->

                        <div id="page">
                            <div id="content">
                                <div class="post">
                                    <h2 class="title"><a href="#"> </a></h2>
                                   
                                    <div style="clear: both;">&nbsp;</div>
                                    <div class="entry">
                                        <span style="font-size: 22px;">Welcome Actuary</span>
                                        <%if (request.getParameter("msg") != null) {
                                                out.println(request.getParameter("msg"));
                                            }%>
                                            <form name="form" method="post" action="ah.jsp">
                                               
                                                 
                                                
                                                 
                                            </form>
                                                 <form method="post" action="decrypt.jsp">
                                                      <select name="kb1"  multiple="multiple">
                                                    <option value="-1">-Select-</option>

                                                            <%
                                                                String sql = "select * from upload";
                                                                System.out.println(";;;;;;;;;;;;;;;" + sql);
                                                                PreparedStatement pst = null;
                                                                Connection conn = null;
                                                                try {
                                                                    conn = DbConnector.getConnection();
                                                                    pst = conn.prepareStatement(sql);
                                                                    ResultSet rs = pst.executeQuery();
                                                                    while (rs.next()) {%>
                                                            <option value="<%=rs.getString("filename")%>"><%=rs.getString("filename")%></option>
                                                            <%}
                                                                } catch (Exception e) {
                                                                }%>
                                            
                                                </select>
                                                                <tr><td>Enter Aggregate Key</td><td><input type="text" id="key_val" name="key_val" /></td></tr>
                                                     <tr><td></td><td><input type="submit" value="Decrypt"/></td></tr>
                                                 </form>
                                                      
                                        <form method="post" action="content.jsp">
                                            <table width="90%">
                                                
                                                
                                                <tr><td></td><td><input type="hidden" id="r" name="r"/></td></tr>
                                                
                                            </table>
                                        </form>	
                                              
                                    </div>
                                </div>
                                <div style="clear: both;">&nbsp;</div>
                            </div>
                            <!-- end #content -->
                            <!-- end #sidebar -->
                            <div style="clear: both;">&nbsp;</div>
                        </div>
                        <!-- end #page --> 
                    </div>
                    <div id="footer">
                        <p>Priyanka </p>
                    </div>
                    <!-- end #footer -->
              
                </body>
                </html>
                                                              
                                                 