/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import it.unisa.dia.gas.jpbc.Field;
import it.unisa.dia.gas.jpbc.Pairing;
import it.unisa.dia.gas.jpbc.PairingParameters;
import it.unisa.dia.gas.plaf.jpbc.pairing.PairingFactory;
import it.unisa.dia.gas.plaf.jpbc.pairing.a.TypeACurveGenerator;
import it.unisa.dia.gas.plaf.jpbc.pbc.curve.PBCCurveGenerator;
import java.io.BufferedReader;

/**
 *
 * @author Napster
 */
public class aggregatekey {
     int rBits = 160;
     int qBits = 512;
     static byte m[];
     PBCCurveGenerator curveGenerator1 = null;

    TypeACurveGenerator curveGenerator = new TypeACurveGenerator(rBits, qBits);
    PairingParameters param= curveGenerator.generate();
    BufferedReader br;
    
//PairingParameters params =  PairingFactory.getInstance().loadParameters("C://Users/Dell/Desktop/a.properties");

  // PairingFactory.getInstance().setUsePBCWhenPossible(true);

Pairing pairing = PairingFactory.getPairing("C://Users/Dell/Desktop/a.properties");
    Field G1=pairing.getG1();
    Field G2 = pairing.getG2();

    private void generateMasterKey(string strkey) {
int index[]={} ;
int  len=5;
int xor = 0;
for(int i = 0; i < len; i++)
xor = xor ^  (index[i]+1);

while (len!=0);
String strKey ;

byte []sk = new byte[16];
int j = 0;

//pk[j++] = (byte)(Integer.parseInt(st.nextToken()));
sk[15] = (byte)((int)sk[15]^(xor));
j = 0;
String masterKey = Integer.toString((int)sk[j]);
++j;
while (j<16) {
masterKey+= ("" + Integer.toString((int)sk[j]));
j++;
}
    }

    private static class string {

        public string() {
        }
    }
}

    
       
        
    

