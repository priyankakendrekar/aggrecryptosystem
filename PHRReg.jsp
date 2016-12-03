<%-- 
    Document   : PHRReg
    Created on : 8 Dec, 2015, 7:30:10 PM
    Author     : Napster
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.math.BigInteger"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Keyboard 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20120915

-->


  <%!
     BigInteger p,q,n1,r1,d1,pk12,sk12,m1,a;
     BufferedReader br;
    StringBuilder sb;
    String jk;
     
    %>
<% 
    sk12= BigInteger.ONE;
    int primesize=128;
    p = new BigInteger( primesize, 10, new Random() ) ;
    do
		{
			q = new BigInteger( primesize,10, new Random() ) ;
		}
		while( q.compareTo(p ) == 0 ) ;
    	n1 = p.multiply( q ) ;
        r1 = p.subtract( BigInteger.valueOf( 1 ) ) ;
		r1 = r1.multiply( q.subtract( BigInteger.valueOf( 1 ) ) ) ;
                jk=r1.toString();
       System.out.print("JK:"+jk);
    StringBuilder pk = new StringBuilder("");
    SecureRandom r = new SecureRandom();
    String publickey1;
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    char []dateAndTime = (dateFormat.format(date)).toCharArray();
    int seedNum = 0;
    int keyLen = 128;
    int i1,i2;
    int temp;
     do
    {
    pk12=BigInteger.ZERO;
    publickey1=" ";
    pk=new StringBuilder("");
    for(i1=0; i1<dateAndTime.length; ++i1)
    if(dateAndTime[i1]>='0'&& dateAndTime[i1]<='9')
    seedNum = 10*seedNum + dateAndTime[i1] - '0';
    r.setSeed(seedNum);
    byte []k = new byte[32];
    r.nextBytes(k);
    for(i1=0;i1<31;++i1) {
    temp = (int)k[i1];
    temp%=128;
    if(temp<0)
    temp+=128;
    k[i1] = (byte)temp;
    pk.append(temp);
    pk.append("-");
    }
    temp = (int)k[i1];
    temp%=128;
    if(temp<0)
    temp+=128;
    k[i1] = (byte)temp;
    pk.append(temp);
    publickey1 =pk.toString();
 
   
     String m[]=publickey1.split("-");
    StringBuffer b= new StringBuffer();
    for(int k1=0;k1<m.length;k1++)
    {
        b.append(m[k1]);
    }
   pk12=new BigInteger(b.toString());
  }
    while( (pk12.compareTo(r1) != 1)||(pk12.gcd(r1).compareTo(BigInteger.valueOf(1)) != 0));
   
                sk12=pk12.modInverse(r1);
                
		/* while(true){
                    
		m1=sk12.add(r1);
		
		if(m1.remainder(pk12).compareTo(BigInteger.ZERO)==0 )
			break;
		sk12=m1;
                }
                sk12=m1.divide(pk12);*/
               
               
                
    
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
                                    <li><a href="index.jsp">Home</a></li>
                                    <li><a href="PHRLogin.jsp">PHR Login</a></li>
                                    <li class="first current_page_item"><a href="#">PHR Register</a></li>
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
                                        <span style="font-size: 22px;">PHR Registration:</span>
                                        <%if (request.getParameter("msg") != null) {
                                                out.println(request.getParameter("msg"));
                                            }%>
                                        <form method="post" action="PHRRegister">
                                            <table width="90%">
                                                <tr style="height: 40px;"><td>User id:</td><td><input type="text" size="30" style="height: 25px;" id="_name" name="_name"/></td></tr>
                                                <tr style="height: 40px;"><td>Password:</td><td><input type="text" size="30" style="height: 25px;" id="_password" name="_password"/></td></tr>
                                                <tr style="height: 40px;"><td>Address:</td><td><input type="text" size="30" style="height: 25px;" id="add" name="add" />
                                                    </td></tr>
                                                <tr style="height: 40px;"><td>Age:</td><td><input type="text" size="30" style="height: 25px;" id="_age" name="_age"/></td></tr>
                                                <tr style="height: 40px;"><td>Phone:</td><td><input type="text" size="30" style="height: 25px;" id="_phone" name="_phone"/></td></tr>
                                                <tr style="height: 40px;"><td>Email-Id:</td><td><input type="text" size="30" style="height: 25px;" id="_emailid" name="_emailid"/></td></tr>  
                                                
                                               <tr><td></td><td><input type="hidden" id="publicKey" name="publicKey" size="50" value="<%= pk12 %>"/></td></tr>
                                               <tr><td></td><td><input type="hidden" id="nil" name="nil" size="50" value="<%= jk %>"/></td></tr>
                                              
                                                <tr><td></td><td><input type="hidden" id="secrete" name="secrete" size="50" value="<%= sk12 %>"/></td></tr>
                                                <tr style="height: 40px;"><td></td><td><input type="submit" value="Submit" style="height: 25px;width: 90px;"/></td></tr>
                                                
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
                   <!-- </div>
                    <div id="footer">
                        <p></p>
                    </div>
                    <!-- end #footer -->
                </body>
                </html>

  