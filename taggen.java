
import it.unisa.dia.gas.jpbc.Element;
import it.unisa.dia.gas.jpbc.ElementPowPreProcessing;
import it.unisa.dia.gas.jpbc.Field;
import it.unisa.dia.gas.jpbc.Pairing;
import it.unisa.dia.gas.jpbc.PairingParameters;
import it.unisa.dia.gas.jpbc.PairingParametersGenerator;
import it.unisa.dia.gas.plaf.jpbc.pairing.PairingFactory;
import it.unisa.dia.gas.plaf.jpbc.pairing.a.TypeACurveGenerator;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Napster
 */
import it.unisa.dia.gas.jpbc.Pairing;
import it.unisa.dia.gas.jpbc.PairingParameters;
import it.unisa.dia.gas.jpbc.PairingParametersGenerator;
import it.unisa.dia.gas.plaf.jpbc.pairing.PairingFactory;
import it.unisa.dia.gas.plaf.jpbc.pairing.a.TypeACurveGenerator;
import java.math.BigInteger;

public class taggen {

    public Pairing pairing;
    public Params params;
     private Field zr, g1, gt;
    private Element g, k, g_k, z_k,pk,fid;
    private ElementPowPreProcessing gpre;
    

    private int chunkSize;

    public Params generate(int x, int y) {
        params = new Params();
        //Get the curve parameters
        PairingParametersGenerator pg = new TypeACurveGenerator(x, y);
        PairingParameters curveParams = pg.generate();
        this.pairing = PairingFactory.getPairing(curveParams);
        params.setPairing(this.pairing);

        //Initialize the parameters for second-level encryption
        params.setg1(pairing.getG1());
        params.setgt(pairing.getGT());
        params.setzr(pairing.getZr());
        
        params.setg(params.getg1().newRandomElement().getImmutable());
        params.setgpre(params.getg().getElementPowPreProcessing());
        params.setk(params.getzr().newRandomElement().getImmutable());
        params.setg_k(params.getgpre().powZn(params.getk()).getImmutable());
        params.setz_k(pairing.pairing(params.getg(), params.getg_k()).getImmutable());

        return params;
    }
    
  public int teggen(String mi, String pk, String msk ) 
  {
    Field e= params.getg1();
    e.newElement(BigInteger.ONE).powZn(g);   
    int tag=e.getNqr().hashCode();
    int r=new BigInteger(pk).multiply((BigInteger) fid).hashCode();
    
    
    return r;
  }
  

}
