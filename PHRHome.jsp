
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.TreeSet"%>
<%-- 
    Document   : PHRHome
    Created on : 8 Dec, 2015, 7:18:05 PM
    Author     : Napster
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%!
    String phr, ac, flag;
    TreeSet<String> t=new TreeSet<String>();
    %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Key-Aggregate Cryptosystem for Scalable Data Sharing in Cloud Storage</title>
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css'>
            <link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
                <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
                </head>
                <body>
                    <div id="wrapper">
                        <div id="header-wrapper">
                            <div id="header" class="container">
                                <div id="logo">
                                    <h1><a href="#">PHR SYSTEM</a></h1>
                                </div>
                                <div id="menu">
                                    <ul>
                                        <li class="first current_page_item"><a href="#">PHR Home</a></li>
                                        <li><a href="index.jsp">Log Out</a></li>
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
                                    <h2 class="title"><a href="#"></a></h2>
                                    
                                    <div style="clear: both;">&nbsp;</div>
                                    <div class="entry">
                                        <%if (request.getParameter("msg") != null) {
                                                                  out.println(request.getParameter("msg"));
                                                              }%>
                                        <h2>Upload File</h2>
                                        <form action="upload.jsp" method="post" enctype="multipart/form-data">
                                            <tr style="height: 40px;"><td>Choose File:</td><td> <input name="file" type="file" id="file"/>    </td></tr>
                                            <tr style="height: 40px;"><td colspan="2"> <input type="submit" value="Upload"/> </td></tr>
                                            <table>

                                            </table>
                                        </form>
                                       
                                        <form action="PHRHome1.jsp" method="post" >
                                            
                                                            
                                                                <select name="kb5" id="kb5" multiple>
                                                    <option value="-1">-Select Actuary-</option>

                                                            <%
                                                                String sql = "select * from request where phr='"+session.getAttribute("userid")+"' and flag='false'";
                                                                System.out.println(";;;;;;;;;;;;;;;" + sql);
                                                                PreparedStatement pst = null;
                                                                Connection conn = null;
                                                                try {
                                                                    conn = DbConnector.getConnection();
                                                                    pst = conn.prepareStatement(sql);
                                                                    ResultSet rs = pst.executeQuery();
                                                                    
                                                                    System.out.println("RS val is:"+rs);
                                                                    while (rs.next()) {
                                                                             phr=rs.getString("filename");
                                                            ac=rs.getString("actuary");
                                                            flag=rs.getString("flag"); 
                                                            t.add(ac);
                                                            
                                                            %>
                                                            
                                                            <%}
                                                                } catch (Exception e) {
                                                                }
                                                           Iterator itr=t.iterator();
                                                               while(itr.hasNext())
                                                              {
                                                                  String h=String.valueOf(itr.next());
                                                            %>
                                                            <option value="<%= h %>"><%= h %></option>
                                                               
                                                                <%
                                                                    }
                                                                    %>
                                              </select>   
                                              <input type="submit" value="Show Files" ></input>
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
              </body>
                </html>

