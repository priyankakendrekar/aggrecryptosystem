<%@page import="javax.swing.JFrame"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="com.util.Utilities"%>
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
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
 <%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>


<%@ page import="java.security.KeyException" %>;
    <%!
     BigInteger p,q,n1,r1,d1,pk1,sk1,m1,a;
     BufferedReader br;
    StringBuilder sb;
     String fileName;
     int index,y; 
     String name=null;
     String sval=null;
     BigInteger pubkey ;
     BigInteger skey;
      BigInteger skey1;
     BigInteger pubkey1;
     StringBuffer d=new StringBuffer("");
      String arr[];
      String jjj=null;
    String h;
    int len;
    PrintWriter out;
    JFrame frame=new JFrame();
    StringBuffer sb1=new StringBuffer();
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

    arr=request.getParameterValues("kb1");
    skey1=new BigInteger(request.getParameter("key_val"));
    jjj= request.getParameter("key_val");
    if(arr==null)
        sb1.append(" ");
    else
    {
        len=arr.length;
         for(int i=0;i<len;i++)
    {
        String path="D:/images/"+session.getAttribute("phrname")+"/"+arr[i];
        String path1="C:/Users/Dell/Desktop/All/"+arr[i];
        File f1=new File(path);
        File f2=new File(path1);
        
        FileUtils.copyFile(f1, f2);
        sb1.append(arr[i]);
        decrypt1(path1,arr[i]);
    }
         h=new String(sb);
    }
   
    %>

 <%!
             BigInteger r1()
            {
                    Connection con = null;
                    PreparedStatement pstm = null;
        
        
          try {
              
            con=DbConnector.getConnection();
            
            
               String sql1 ="select r from user where userid='"+name+"'";
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
    void decrypt1(String file_name,String fi)
    {
      
      try 
      {
        br = new BufferedReader(new FileReader(file_name));
        sb = new StringBuilder();
        String line = br.readLine();

        while (line != null) {
            sb.append(line);
            sb.append("\n");
            line = br.readLine();
        }
        br.close();
      } 
      catch(Exception e){}
     

        System.out.println("Enter the plain text:");

        

        System.out.println("Encrypting String: " +  sb.toString());

        System.out.println("String in Bytes: "+ bytesToString(sb.toString().getBytes()));

        // encrypt
        try {
              
            Connection con11=DbConnector.getConnection();
            
            
               String sql1 ="select agg_key,containt from ghol where  file_name='"+arr[0]+"'";
               System.out.println(sql1);
            PreparedStatement pstm1=con11.prepareStatement(sql1);
            
              //pstm1.setString(1, );
           
         //  pstm1=con1.prepareStatement(sql1);
           ResultSet r=pstm1.executeQuery(sql1);
           while(r.next())
           {
               String hhh="Invalid Key";
               String h=r.getString("containt");
               sval=r.getString("agg_key");
               System.out.println("Key val is:"+h);
               if(jjj.equals(sval))
                  d.append(h);
               else
               JOptionPane.showMessageDialog(frame, "Invalid Key");
            System.out.println("prinyanka:");
            System.out.println("agg key"+jjj);
           }
           FileOutputStream fos = new FileOutputStream("D:/images1/"+fi);
	     fos.write(d.toString().getBytes());
	     fos.close();  
        } catch(Exception e){
               
            e.printStackTrace();
        }

          %>
          <%= d.toString() %>
          <%! 
        
         try
        {
               
        }catch(Exception e){}
        // decrypt
         

     // byte[] decrypted = decrypt(encrypted);

//       System.out.println("Decrypting Bytes: " + bytesToString(decrypted));

     // System.out.println("Decrypted String: " + new String(decrypted));
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
 public byte[] decrypt(byte[] message)

  {
    BigInteger b=r1();
    
        return (new BigInteger(message)).modPow(skey1, b).toByteArray();

    }
 %>
           
      