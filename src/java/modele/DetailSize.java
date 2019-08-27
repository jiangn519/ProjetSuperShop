/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.math.BigDecimal;

/**
 *
 * @author lin
 */
public class DetailSize {
    private String noprd;
    private String nosize;
    private BigDecimal quantitystock;
    private String namesize;

    public String getNoprd() {
        return noprd;
    }

    public String getNosize() {
        return nosize;
    }

    public BigDecimal getQuantitystock() {
        return quantitystock;
    }

    public String getNamesize() {
        return namesize;
    }

    public void setNoprd(String noprd) {
        this.noprd = noprd;
    }

    public void setNosize(String nosize) {
        this.nosize = nosize;
    }

    public void setQuantitystock(BigDecimal quantitystock) {
        this.quantitystock = quantitystock;
    }

    public void setNamesize(String namesize) {
        this.namesize = namesize;
    }
    
    
}
