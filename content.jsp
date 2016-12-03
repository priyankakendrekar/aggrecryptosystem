<%@page import="com.util.Utilities"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.*" %>
<%@page import="com.action.Downloadfile" %>
<%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>PHR</title>
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css'>
            <link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
                <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
                </head>
                <body>
                    <div id="wrapper">
                        <div id="header-wrapper">
                            <div id="header" class="container">
                                <div id="logo">
                                    <h1><a href="#">PHR </a></h1>
                                </div>
                                <div id="menu">
                                    <ul>
                                        <li class="first current_page_item"><a href="ActuaryHome.jsp">Back </a></li>                       
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
                                    <h2 class="title"><a href="#"></a></h2>

                                    <div style="clear: both;">&nbsp;</div>
                                    <div class="entry">
                                        <span style="font-size: 22px;">Data:</span>
                                        <%if (request.getParameter("msg") != null) {
                                                out.println(request.getParameter("msg"));
                                            }%>
                                        <form method="post" action="content.jsp">
                                            <table width="90%">
                                                <tr style="height: 40px;">
                                                    <td>

                                                        <%
                                                            String sql = "",c="no";
                                                            if(request.getParameter("confirm")!=null){c=request.getParameter("confirm");}else{c="no";}
                                                            boolean flag = false;
                                                            if (request.getParameter("keys").trim() != "" && request.getParameter("keys").trim() != "") {
                                                                sql = "select * from upload where id='" + request.getParameter("keys") + "' and key_='" + request.getParameter("key_") + "'";
                                                                flag = true;
                                                            } else {
                                                                sql = "select * from upload where id='" + request.getParameter("keys") + "'";

                                                            }
                                                            System.out.println(";;;;;;;;;;;;;;;" + sql);
                                                            System.out.println("Confirm it (yes/no) "+c);
                                                            PreparedStatement pst = null;
                                                            Connection conn = null;
                                                            try {
                                                                conn = DbConnector.getConnection();
                                                                pst = conn.prepareStatement(sql);
                                                                ResultSet rs = pst.executeQuery();
                                                                if (rs.next()) {
                                                                    if (flag == true) {
                                                                        System.out.println("false????");
                                                                        if(c.equalsIgnoreCase("yes")){
                                                                        Downloadfile n = new Downloadfile();


                                                                        if (n.getFile(rs.getInt("id"))) {
                                                                            JOptionPane.showMessageDialog(null, "Your file download in C:");
                                                                            response.sendRedirect("DocHome.jsp");
                                                                        } else {
                                                                            JOptionPane.showMessageDialog(null, "Download Failed");
                                                                        }
                                                                                   }
                                                                          else{
                                                                        //out.println(Utilities.decryptString(rs.getString(3), rs.getString(4)));
                                                                              }
                                                                    } else {
                                                                        out.println(rs.getString(3));
                                                                    }
                                                                } else {
                                                                    out.println("In valid Key");
                                                                }
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            }%>
                                                    </td></tr>
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
                   <!-- <div id="footer">
                        <p>Copyright (c) 2012. All rights reserved.</p>
                    </div>
                    <!-- end #footer -->
                </body>
                </html>
