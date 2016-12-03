<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%!
    String val[];
    %>
    <%
        val=request.getParameterValues("kb1");
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
                                            <form name="form">
                                                
                                             </form>
                                             <form method="post" action="ActuaryHome2.jsp">
                                                 <table> 
                                                     
                                                     <tr> <td> <select name="kb12" id="kb12" onclick="show()" multiple>
                                                   
                                                    <option value="-1">-Select PHR-</option>

                                                            <%
                                                                String sql = "select * from user where role='PHR'";
                                                                System.out.println(";;;;;;;;;;;;;;;" + sql);
                                                                PreparedStatement pst = null;
                                                                Connection conn = null;
                                                                try {
                                                                    conn = DbConnector.getConnection();
                                                                    pst = conn.prepareStatement(sql);
                                                                    ResultSet rs = pst.executeQuery();
                                                                    System.out.println("RS val is:"+rs);
                                                                    while (rs.next()) {%>
                                                                    <option value=<%= rs.getString("userid")%>><%=rs.getString("userid")%></option>
                                                            <%}
                                                                } catch (Exception e) {
                                                                }%>
                                                      </select>
                                                         </td>
                                                      <td>
                                                      <select name="kb11" id="kb11" onclick="show()" multiple>
                                                    <option value="-1">-Request Files-</option>

                                                            <%
                                                                String sql1 = "select filename from upload where userid='"+val[0]+"'";
                                                                System.out.println(";;;;;;;;;;;;;;;" + sql1);
                                                                PreparedStatement pst1 = null;
                                                                Connection conn1 = null;
                                                                try {
                                                                    conn1 = DbConnector.getConnection();
                                                                    pst1 = conn1.prepareStatement(sql1);
                                                                    ResultSet rs1 = pst1.executeQuery();
                                                                    System.out.println("RS val is:"+rs1);
                                                                    while (rs1.next()) {%>
                                                                    <option value=<%= rs1.getString("filename")%>><%=rs1.getString("filename")%></option>
                                                            <%}
                                                                } catch (Exception e) {
                                                                }%>
                                                      </select>
                                                      </td>
                                                      
                                                     </tr>
                                                      <tr> <td> </td>
                                                   <td><input type="hidden" id="key_" name="key_"/></td>
                                                <td><input type="submit" value="Request Files "/></td></tr>
                                                
                                                 
                                            </form>
                                        <form method="post" action="content.jsp">
                                            <table width="90%">
                                                
                                                
                                                <tr><td></td><td><input type="hidden" id="r" name="r"/></td></tr>
                                                
                                            </table>
                                           
                                        </form>	
                                                      <form method="post" action="savedfiles.jsp">
                                                          <td> <select name="kb15" id="kb15" onclick="show()" multiple>
                                                   
                                                    <option value="-1">-Select PHR-</option>

                                                            <%
                                                                String sql15 = "select * from user where role='PHR'";
                                                                System.out.println(";;;;;;;;;;;;;;;" + sql15);
                                                                PreparedStatement pst15 = null;
                                                                Connection conn15 = null;
                                                                try {
                                                                    conn15 = DbConnector.getConnection();
                                                                    pst15 = conn15.prepareStatement(sql15);
                                                                    ResultSet rs15 = pst15.executeQuery();
                                                                    System.out.println("RS val is:"+rs15);
                                                                    while (rs15.next()) {%>
                                                                    <option value=<%= rs15.getString("userid")%>><%=rs15.getString("userid")%></option>
                                                            <%}
                                                                } catch (Exception e) {
                                                                }%>
                                                      </select>
                                                         </td>
                                                           <td>
                                                      <select name="kb11" id="kb11" onclick="show()" multiple>
                                                    <option value="-1">-Granted Files-</option>

                                                            <%
                                                                String sql12 = "select filename from actgrant where actuary='"+session.getAttribute("userid")+"' and phr='"+val[0]+"'";
                                                                System.out.println(";;;;;;;;;;;;;;;" + sql12);
                                                                PreparedStatement pst12 = null;
                                                                Connection conn12 = null;
                                                                try {
                                                                    conn12 = DbConnector.getConnection();
                                                                    pst12 = conn12.prepareStatement(sql12);
                                                                    ResultSet rs1 = pst12.executeQuery();
                                                                    System.out.println("RS val is:"+rs1);
                                                                    while (rs1.next()) {%>
                                                                    <option value=<%= rs1.getString("filename")%>><%=rs1.getString("filename")%></option>
                                                            <%}
                                                                } catch (Exception e) {
                                                                }%>
                                                      </select>
                                                      </td>
                                               <table>
                                                <tr><td></td><td><input type="submit" value="save file"/></td></tr>
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
              <script>
function show()
{
     var InvForm = document.forms.form;
      var SelBranchVal = "";
     var x = 0;
     for (x=0;x<InvForm.kb.length;x++)
         {
            if(InvForm.kb[x].selected)
            {
             //alert(InvForm.kb[x].value);
             SelBranchVal = InvForm.kb[x].value ;
            
            }
         }
         document.getElementById("key_").value = SelBranchVal;
         nil=SelBranchVal.valueOf().trim();
}
</script>
                </body>
                </html>
                                    
                                                                 
                                                                 
                                                                 