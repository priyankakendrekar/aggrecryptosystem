/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Napster
 */
import static it.unisa.dia.gas.plaf.jpbc.util.math.BigIntegerUtils.sqrt;
import java.math.BigInteger;
import java.security.spec.ECPoint;

class plotdata
{

	public static ECPoint ConvertToPoint(String S)
	{
	    BigInteger neg = new BigInteger("-1");
	    BigInteger one = BigInteger.ONE;
	    BigInteger adder = BigInteger.ONE;
	    BigInteger two = new BigInteger("2");
	    BigInteger M,MK,Y,s = null, n = BigInteger.ONE,x,x2,x3 = null,B,B2,B3,g,g2,g3;
	    BigInteger X = null;
	    BigInteger k = new BigInteger("20");
	    BigInteger P  = new BigInteger("751"); //Prime number (P)
	    BigInteger a  = new BigInteger("1"); //Curve Parameter a
	    BigInteger b  = new BigInteger("0"); //Curve Parameter b
	    int e = 1;
	    int m = 0;
	    int r;
                                  
	    if (S==""){
	        M = new BigInteger("");
	        MK = M.multiply(k);
	        X = MK.add(adder); // x = m.k + i
	        Y = (X.multiply(X).multiply(X)).add(a.multiply(X)).add(b); // y = (x^3 + ax + b)

	        BigInteger C = (P.subtract(one)).divide(two);

	        while((Y.mod(one) != BigInteger.ZERO) && (P.gcd(Y) != one) && Y.modPow(C, P) != one){
	            adder = adder.add(one);
	            X = MK.add(adder);   
	            Y = (X.multiply(X).multiply(X).multiply(X)).add(a.multiply(X)).add(b);
	        }   
	        s = (P.subtract(one)).divide(two.pow(e));
	        while (s.mod(two)== BigInteger.ZERO){
	            e = e+1;
	            s = (P.subtract(one)).divide(two.pow(e));
	        }
	        while (((n.modPow(C, P)) != neg.mod(P)) || (sqrt(n).mod(one)== BigInteger.ZERO)){
	            n = n.add(one);
	        }
	        x = Y.modPow((s.add(one).divide(two)), P);
	        B = Y.modPow(s, P);
	        g = n.modPow(s, P);
	        r = e;

	        while (B.modPow(two.pow(m), P) != BigInteger.ONE){
	            m = m+1;
	        }
	        if (m>0){
	            x2 = x.multiply(g.pow(2^(r-m-1)));
	            x3 = x2.mod(P);
	            B2 = B.multiply(g.pow(2^(r-m)));
	            B3 = B2.mod(P);
	            g2 = g.pow(2^(r-m));
	            g3 = g.mod(P);
	            r = m;
	        }
	        else if (m==0){
	            x3 = x;
	            B3 = B;
	            g3 = g;
	            r = e;
	        }
	    }
	       //This is when the program crashes
	   ECPoint T = new ECPoint(X,x3); 
	   return T;
	}
	
}


