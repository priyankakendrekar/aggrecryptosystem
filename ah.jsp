<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%!
    String uuid,m,n;
    int nil;
    
    %>
    <%
       
        %>
         <%
                                                                    nil=Integer.parseInt(request.getParameter("key_"));
                                                                    System.out.println("jjhjhdjhjdh"+nil);
                                                                    String g=getpublickey1();
                                                                     getsec(g);
                                                                    %>
        
                                                                     <%!
            String getpublickey1()
            {
                    Connection con = null;
                    PreparedStatement pstm = null;
        
        
          try {
              
            con=DbConnector.getConnection();
            
            
               String sql1 ="select userid from upload where id="+nil;
            pstm=con.prepareStatement(sql1);
            
          System.out.println("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
           
           pstm=con.prepareStatement(sql1);
           ResultSet r=pstm.executeQuery(sql1);
           while(r.next())
           {
            uuid=r.getString(1);
           }
            
        } catch(Exception e){
               
            e.printStackTrace();
        }
       
          return uuid;
          
            }
            void getsec(String h)
            {
                    Connection con = null;
                    PreparedStatement pstm = null;
        
        
          try {
              
            con=DbConnector.getConnection();
            
             
               String sql1 ="select sec_key,r from user where userid='"+h+"'";
               System.out.println(sql1);
            pstm=con.prepareStatement(sql1);
            
 
           
           pstm=con.prepareStatement(sql1);
           ResultSet r=pstm.executeQuery(sql1);
           while(r.next())
           {
            m=r.getString(1);
            n=r.getString(2);
           }
           
        } catch(Exception e){
               
            e.printStackTrace();
        }
       
         
          
            }
            %>
<%
		 
		Cookie c1=new Cookie("priyu",m);
		c1.setMaxAge(300);
		response.addCookie(c1);
		
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
                                                <select name="kb" id="kb" onclick="show();" multiple>
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
                                                            <option value="<%=rs.getString(1)%>"><%=rs.getString("filename")%></option>
                                                            <%}
                                                                } catch (Exception e) {
                                                                }%>
                                            
                                                </select>
                                                 <tr><td>Key</td><td><input type="text" id="key_" name="key_" value="<%= m %>"/></td></tr>
                                                 <tr><td></td><td><input type="submit" value="Generate Aggregate Key"/></td></tr>
                                                
                                            </form>
                                                 <form method="post" action="download.jsp">
                                                      <tr><td></td><td><input type="submit" value="Download file"/></td></tr>
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
                                                               