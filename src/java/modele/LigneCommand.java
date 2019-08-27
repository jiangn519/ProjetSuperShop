/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

/**
 *
 * @author lin
 */
public class LigneCommand {

    private String nocom;
    private String noprd;
    int quantite;

    public String getNocom() {
        return nocom;
    }

    public String getNoprd() {
        return noprd;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setNocom(String nocom) {
        this.nocom = nocom;
    }

    public void setNoprd(String noprd) {
        this.noprd = noprd;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

}
