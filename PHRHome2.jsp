<%-- 
    Document   : PHRHome2
    Created on : 6 Mar, 2016, 11:32:24 AM
    Author     : Napster
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.TreeSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<%!
    String name;
    String file[];
   Date d=new Date();
   long start;
    %>
    <%
        file=request.getParameterValues("kb11");
        System.out.println("file nameeeee:"+file[0]);
        
        %>
 <%
     
     start = d.getTime();
     System.out.println("start time is"+start);
     for(int i=0;i<file.length;i++)
             {
                String sql1 = "update request set flag='true' where filename='"+file[i]+"' and phr='"+session.getAttribute("userid")+"' and actuary='"+session.getAttribute("acc")+"'";  
                                                                System.out.println(";;;;;;;;;;;;;;;" + sql1);
                                                                PreparedStatement pst11223= null;
                                                                Connection conn11223= null;
                                                                 try {
                                                                    conn11223= DbConnector.getConnection();
                                                                    pst11223 = conn11223.prepareStatement(sql1);
                                                                    pst11223.executeUpdate();
                                                                    
                                                                 
                                                                } catch (Exception e) {
                                                                }
             
                                                                    
             }
                                         
      
%>

         <%
                                                                String sql = "select sec_key from user where userid='"+session.getAttribute("userid")+"'";
                                                                System.out.println(";;;;;;;;;;;;;;;" + sql);
                                                                PreparedStatement pst = null;
                                                                Connection conn = null;
                                                                 try {
                                                                    conn = DbConnector.getConnection();
                                                                    pst = conn.prepareStatement(sql);
                                                                    ResultSet rs = pst.executeQuery();
                                                                    
                                                                    System.out.println("RS val is:"+rs);
                                                                    while (rs.next()) {
                                                                             name=rs.getString("sec_key");
                                                         
                                                            
                                                        
                                                            
                                                            }
                                                                } catch (Exception e) {
                                                                }
                                                                 
      
%>


         <%
             for(int i=0;i<file.length;i++)
             {
                String sql12 = "insert into actgrant values('"+session.getAttribute("acc")+"','"+session.getAttribute("userid")+"','"+file[i]+"','"+name+"')";  
                                                                System.out.println(";;;;;;;;;;;;;;;" + sql12);
                                                                PreparedStatement pst11 = null;
                                                                Connection conn11 = null;
                                                                 try {
                                                                    conn11 = DbConnector.getConnection();
                                                                    pst11 = conn.prepareStatement(sql12);
                                                                    
                                                                    int s=pst11.executeUpdate();
                                                                    System.out.println("haahaaaahaaaaa:"+s);
                                                                 
                                                                } catch (Exception e) {
                                                                }
                                                                
             }
      
%>
   <%
             for(int i=0;i<file.length;i++)
             {
                String sql1 = "delete from request where actuary='"+session.getAttribute("acc")+"' and flag='true'";  
                                                                System.out.println(";;;;;;;;;;;;;;;" + sql1);
                                                                PreparedStatement pst1122 = null;
                                                                Connection conn1122 = null;
                                                                 try {
                                                                    conn1122 = DbConnector.getConnection();
                                                                    pst1122 = conn1122.prepareStatement(sql1);
                                                                    pst1122.executeUpdate();
                                                                    
                                                                 
                                                                } catch (Exception e) {
                                                                }
             }
      
%>


<%!
    String phr, ac, flag;
    TreeSet<String> t=new TreeSet<String>();
    %>
<%!
    String val[];
    %>
    <%
        val=request.getParameterValues("kb5");
         long end  = d.getTime();
         System.out.println("start time is"+end);
         System.out.println("time required for aggregate key generation is: "+ (end-start));
             
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
                                       
                                        <form action="mail.jsp" method="post" >
                                            
                                                            
                                                                
                                                
                                                      <table><tr><td>Key</td><td><input type="text" id="key_" name="key_" value="<%= name %>"/></td></tr></table>
                                                      <table><tr><td>Mail to </td><td><input type="text" id="mail" name="mail" /></td></tr></table>
                                              <input type="submit" value="Generate Aggregate key" ></input>
                                              
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

