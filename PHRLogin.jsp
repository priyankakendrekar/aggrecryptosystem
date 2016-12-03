i<%-- 
    Document   : PHRLogin
    Created on : 8 Dec, 2015, 6:08:10 PM
    Author     : Napster
--%>



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
                                    <li><a href="index.jsp">Home</a></li>
                                    <li class="first current_page_item"><a href="PHRLogin.jsp">PHR Login</a></li>
                                    <li><a href="ActuaryLogin.jsp">Actuary Login</a></li>
                                    <li><a href="DocLogin.jsp">Doctor Login</a></li>                                    
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
                                        <span style="font-size: 22px;">PHR Login</span>
                                        <form name="" action="PHRLog" method="post">
                                            <table width="100%">
                                                <tr style="height: 40px;"><td>User id:</td><td><input type="text" size="30" style="height: 25px;" id="name_" name="name_"/></td></tr>
                                                <tr style="height: 40px;"><td>Password:</td><td><input type="password" size="30" style="height: 25px;" id="password" name="password"/></td></tr>                                

                                               
                                                    <td></td><td><input type="submit" value="Login" style="height: 25px;width: 90px;"/></td></tr>

                                            </table>
                                        </form>
                                        <p>New User? <a href="PHRReg.jsp">Register</a></p>
                                    </div>
                                </div>
                                <div style="clear: both;">&nbsp;</div>
                            </div>
                            <!-- end #content -->
                            <!-- end #sidebar -->
                            <div style="clear: both;">&nbsp;</div>
                        </div>
                        <!-- end #page --> 
                   <!-- </div>
                    <div id="footer">
                        <p</p>
                    </div>
                    <!-- end #footer -->
                </body>
                </html>
                                      
