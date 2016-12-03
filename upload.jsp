<%-- 
    Document   : upload
    Created on : 9 Dec, 2015, 9:44:26 AM
    Author     : Napster
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.security.interfaces.RSAPrivateKey"%>
<%@page import="java.security.interfaces.RSAPublicKey"%>
<%@page import="java.security.spec.RSAPrivateKeySpec"%>
<%@page import="java.security.spec.RSAPrivateKeySpec"%>
<%@page import="java.security.spec.RSAPublicKeySpec"%>
<%@page import="java.security.KeyFactory"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="java.security.Security"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="com.util.Utilities"%>
<%@page import="com.action.kac"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
 <%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>


<%@ page import="java.security.KeyException" %>;


<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>KEY-Aggregate</title>
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css'>
            <link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
                <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
                </head>
    <%!
     BigInteger p,q,n1,r1,d1,pk1,sk1,m1,a;
     BufferedReader br;
    StringBuilder sb=null;
     String fileName;
     int index,y; 
     String name=null;
     BigInteger pubkey ;
     BigInteger skey;
      BigInteger skey1;
     BigInteger pubkey1;
     String username=null;
      String u=null;
    %>
   <%
	Cookie c[]=request.getCookies();
	
	
	if(c!=null)
	{
		for(int i=0;i<c.length;i++)
		{
			String name1=c[i].getName();
			if(name1.equals("username123"))
				name=c[i].getValue();
			

		}

	}
   
%>

<%
	HttpSession session1 = request.getSession();
	
	username=session1.getAttribute("userid").toString();
	
    
%>


<%
   File file ;
   String filePath;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
    String master = "";
   String sec = "";
   String pub = "";
   String strManyDirectories="";
   ServletContext context = pageContext.getServletContext();
  
   

   // Verify the content type
    
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));
      

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
             fileName = fi.getName();
            String extension = "";
           
           insert(fileName);
            try{
		
		strManyDirectories="D:/images/"+username+"/";
                
		// Create one directory
		boolean success =  (new File(strManyDirectories)).mkdirs();
		if (success) {
			System.out.println("Directories: " + strManyDirectories + " created");
		}

		}catch (Exception e){//Catch exception if any
			System.err.println("Error: " + e.getMessage());
		}
            filePath = "D:/images/"+username+"/";
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            sec = Utilities.stringtoByte(fileName + fileName.length());
            pub = Utilities.stringtoByte(username);
            master = Utilities.stringtoByte(pub + sec);
            // Write the file
           
            boolean n=true;
            File gh=new File("D:/dataset/"+fileName);
            //File th=new File(request.getParameter("file"));
          
            
            //KSHCoder.MonitorCipher mc=new KSHCoder.MonitorCipher(cipherm);
           
           // mc.start();       
            session1.setAttribute("ext", extension);
            session1.setAttribute("userid", username);
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath + 
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
         //   fi.write( file ) ;
   
    sk1= BigInteger.ONE;
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

    StringBuilder pk = new StringBuilder("");
    SecureRandom r = new SecureRandom();
    String publickey;
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    char []dateAndTime = (dateFormat.format(date)).toCharArray();
    int seedNum = 0;
    int keyLen = 128;
    int i1,i2;
    int temp;
     do
{
    pk1=BigInteger.ZERO;
    publickey=" ";
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
    // pk.append("-");
    }
    temp = (int)k[i1];
    temp%=128;
    if(temp<0)
    temp+=128;
    k[i1] = (byte)temp;
    pk.append(temp);
    publickey =pk.toString();
 
   
     String m[]=publickey.split("-");
    StringBuffer b= new StringBuffer();
    for(int k1=0;k1<m.length;k1++)
    {
        b.append(m[k1]);
    }
   pk1=new BigInteger(b.toString());
  }
    while( (pk1.compareTo(r1) != 1)||(pk1.gcd(r1).compareTo(BigInteger.valueOf(1)) != 0));
   
                sk1=pk1.modInverse(r1);
                
		/* while(true){
                    
		m1=sk1.add(r1);
		
		if(m1.remainder(pk1).compareTo(BigInteger.ZERO)==0 )
			break;
		sk1=m1;
                }
                sk1=m1.divide(pk1);*/
                y=getindex();
                pubkey1=getpublickey1();
                skey1=getseckey1();
               
                encrypt1("D:/upload/"+fileName);
                 
               
                
    
	%>
	 <body>
                    <div id="wrapper">
                        <div id="header-wrapper">
                            <div id="header" class="container">
                                <div id="logo">
                                    <h1><a href="#">Scalable </a></h1>
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
                                       
                                        <h2>Upload Process</h2>
                                        <form method="post" action="UploadData">
                                            <input type="hidden" id="fileName" name="fileName" value="<%=fileName%>">

                                                <table>
                                                    <tr><td>Public Key:</td><td><input type="text" id="publicKey" name="publicKey" size="50" value="<%= publickey %>"/></td></tr>
                                                   <tr><td>secrete key:</td><td><input type="text" id="secrete" name="publicKey" size="50" value="<%= sk1%>"/></td></tr>
                                                   <tr><td>class index:</td><td><input type="text" id="index" name="publicKey" size="50" value="<%= y%>"/></td></tr>
                                                  
                                                  <input type="hidden" id="master" name="master" size="50"  value="<%= master%>"/></td></tr>
                                                    
                                                     
                                                                
                                                            </textarea></td></tr>
                                                    <tr><td><input type="submit" value="Upload"/></td></tr>
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
                        <p></p>
                    </div>
                    <!-- end #footer -->
                </body>
                </html>

<%
            out.println("Uploaded Filename: " + filePath + 
            fileName + "<br>");
            }
         }
         out.println("</body>");
         out.println("</html>");
      }catch(Exception ex) {
         System.out.println(ex);
         out.println(ex);
      }
   }else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
%>
 <%!
          void insert (String file)
            throws ServletException, IOException {
     
     
         Connection con = null;
        PreparedStatement pstm = null;
        
        int n;
          try {
              System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
            con=DbConnector.getConnection();
            
            String sql="insert into Indexing(filename) values('"+file+"')";
              
            pstm=con.prepareStatement(sql);
            
 
            pstm.executeUpdate();
           con.close();
           pstm.close();
           
           
            
        } catch(Exception e){
               
            e.printStackTrace();
        }
    
    }
            
             public byte[] encrypt123(byte[] message)

    {

        return (new BigInteger(message)).modPow(pubkey1.multiply(new BigInteger(Integer.toString(y))), r1).toByteArray();

    }
            
           
        %>
        <%!
             BigInteger getpublickey1()
            {
                    Connection con = null;
                    PreparedStatement pstm = null;
        
        
          try {
              
            con=DbConnector.getConnection();
            
            
               String sql1 ="select public_key from user where userid='"+name+"'";
            pstm=con.prepareStatement(sql1);
            
 
           
           pstm=con.prepareStatement(sql1);
           ResultSet r=pstm.executeQuery(sql1);
           while(r.next())
           {
            pubkey =new BigInteger(r.getString(1));
           }
            
        } catch(Exception e){
               
            e.printStackTrace();
        }
          System.out.println("pubkey:"+pubkey);
          return pubkey;
          
            }
            %>
             <%!
             BigInteger getseckey1()
            {
                    Connection con = null;
                    PreparedStatement pstm = null;
        
        
          try {
              
            con=DbConnector.getConnection();
            
            
               String sql1 ="select sec_key from user where userid='"+name+"'";
            pstm=con.prepareStatement(sql1);
            
 
           
           pstm=con.prepareStatement(sql1);
           ResultSet r=pstm.executeQuery(sql1);
           while(r.next())
           {
            skey =new BigInteger(r.getString(1));
           }
            
        } catch(Exception e){
               
            e.printStackTrace();
        }
          System.out.println("seckey:"+skey);
          return skey;
          
            }
            %>
        <%!
            int getindex()
            {
                    Connection con = null;
                    PreparedStatement pstm = null;
        
        int n;
          try {
              System.out.println("priiiiiiiiiiiiiiiii>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
            con=DbConnector.getConnection();
            
            
               String sql1 ="select max(index_val)  from Indexing";
            pstm=con.prepareStatement(sql1);
            
 
           
           pstm=con.prepareStatement(sql1);
           ResultSet r=pstm.executeQuery(sql1);
           while(r.next())
           {
            index=r.getInt(1);
           }
            
        } catch(Exception e){
               
            e.printStackTrace();
        }
          return index;
            }
            void encrypt1(String file_name)throws Exception
    {
      
      try 
      {
      
        sb = new StringBuilder();
        Scanner sc=new Scanner(new File(file_name));
        SimpleDateFormat sdf=new SimpleDateFormat("yyMMddhhmmssMs");
        System.out.println("Last Modified Time of file : " + sdf.format(new File(file_name).lastModified()));
         try
                {
                     Connection con=DbConnector.getConnection();
                     String hh="select count(*) from tag_table where  file_name='"+fileName+"' and user='"+username+"'";
                      PreparedStatement pp=con.prepareStatement(hh);
                    ResultSet rs=pp.executeQuery();
                    int result=0;
                    while(rs.next())
                    {
                        result=rs.getInt(1);
                    }
                    System.out.println("Result value is:"+result);
                    if(result>=1)
                    {
                        String sql1 ="update tag_table set tag='"+sdf.format(new File(file_name).lastModified())+"' where file_name='"+fileName+"' and user='"+username+"'";
                        PreparedStatement pp2=con.prepareStatement(sql1);
                        pp2.executeUpdate();
                    }
                    else
                    {
                         String str="insert into tag_table values('"+sdf.format(new File(file_name).lastModified()).toString()+"','"+fileName+"','"+username+"')";
                        PreparedStatement ps=con.prepareStatement(str);
                        ps.executeUpdate();
                    }
                }
                catch(Exception e)
                {
                    System.out.println(e.getMessage());
                }
        while(sc.hasNext())
        {
            String h=sc.nextLine().trim();
            sb.append(h+"\n");
            System.out.println(h);
            //System.out.println("Nilesh Dattatraya Veer");
            
        }
        
        System.out.println(sb.toString());

       
      } 
      catch(Exception e){}
     
       FileOutputStream fos2=new FileOutputStream(new File("D://images//tag.txt"));
       try
                {
                     Connection con=DbConnector.getConnection();
                     String hh="select * from tag_table";
                      PreparedStatement pp=con.prepareStatement(hh);
                    ResultSet rs=pp.executeQuery();
                    StringBuilder result=new StringBuilder();
                    while(rs.next())
                    {
                        result.append(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3));
                        fos2.write(result.toString().getBytes());
                        fos2.write("\n".getBytes());
                        
                    }
                    fos2.write(result.toString().getBytes());
                    //System.out.println("Result value is:"+result);
                    
                }
                catch(Exception e)
                {
                    System.out.println(e.getMessage());
                }
       
        System.out.println("Enter the plain text:");

        

        System.out.println("Encrypting String: " +  sb.toString());

        System.out.println("String in Bytes: "+ bytesToString(sb.toString().getBytes()));
         try {
              System.out.println("priiiiiiiiiiiiiiiii>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
            Connection con1=DbConnector.getConnection();
            int u=0;
            /*String hh="select count(*) from ghol where user='"+name+"'"+" and file_name='"+fileName+"'";
            PreparedStatement pp=con1.prepareStatement(hh);
            ResultSet rs=pp.executeQuery();
            if(rs.getInt(1)==1)
            {
                u=1;
                System.out.println("Nilesh Dattatraya Veer");
            }
            if(u==1)
            {
                 String sql1 ="update ghol set containt='"+sb.toString()+"' where user='"+name+"'"+" and file_name='"+fileName+"'";
                 PreparedStatement pp2=con1.prepareStatement(sql1);
                 pp2.executeUpdate();
            }
            else
            {*/
            String hh="select count(*) from ghol where user='"+name+"'"+" and file_name='"+fileName+"'";
            PreparedStatement pp=con1.prepareStatement(hh);
            ResultSet rs=pp.executeQuery();
            int result=0;
            while(rs.next())
            {
                result=rs.getInt(1);
            }
            System.out.println("Result value is:"+result);
            if(result>=1)
            {
                  String sql1 ="update ghol set containt='"+sb.toString()+"' where user='"+name+"'"+" and file_name='"+fileName+"'";
                 PreparedStatement pp2=con1.prepareStatement(sql1);
                 pp2.executeUpdate();
            }
            else
            {
                 String sql1 ="insert into ghol values('"+name+"','"+fileName+"','"+sb.toString()+"','"+skey1+"')";
            PreparedStatement pstm1 =con1.prepareStatement(sql1);
            
 
           
           pstm1=con1.prepareStatement(sql1);
          pstm1.executeUpdate(sql1);
            }
                
           // }
              
           
            
        } catch(Exception e){
               
            e.printStackTrace();
        }
        // encrypt
       

        byte[] encrypted = encrypt(sb.toString().getBytes());
        kac v=new kac();
        
         u=v.openfile(file_name); 
       
         try
        {
             FileOutputStream fos = new FileOutputStream("D:/images/"+username+"/"+fileName);
	     fos.write(u.getBytes());
	     fos.close();   
        }catch(Exception e){}
        // decrypt
         

      byte[] decrypted = decrypt(encrypted);

      System.out.println("Decrypting Bytes: " + bytesToString(decrypted));

      System.out.println("Decrypted String : " + new String(decrypted));
    }
    private static String bytesToString(byte[] encrypted)

    {

        String test = "";

        for (byte b : encrypted)

        {


            test += Byte.toString(b);

        }

        return test;

    }
 public byte[] encrypt(byte[] message)

    {

        return (new BigInteger(message)).modPow(pubkey1.multiply(new BigInteger(Integer.toString(y))), r1).toByteArray();

    }
 public byte[] decrypt(byte[] message)

  {

        return (new BigInteger(message)).modPow(skey1, r1).toByteArray();

    }
            %>
        