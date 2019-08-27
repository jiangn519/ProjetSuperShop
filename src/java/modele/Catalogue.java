/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lin
 */
public class Catalogue {
    private String nocat;
    private String namecat;
    private String namecatmere;
    private ArrayList<Catalogue>  childCat;

    public Catalogue() {
    }

    public Catalogue(String nocat, String namecat, String namecatmere) {
        this.nocat = nocat;
        this.namecat = namecat;
        this.namecatmere = namecatmere;
    }

    public String getNocat() {
        return nocat;
    }

    public String getNamecat() {
        return namecat;
    }

    public String getNamecatmere() {
        return namecatmere;
    }

    public void setNocat(String nocat) {
        this.nocat = nocat;
    }

    public void setNamecat(String namecat) {
        this.namecat = namecat;
    }

    public void setNamecatmere(String namecatmere) {
        this.namecatmere = namecatmere;
    }

    public List getChildCat() {
        return childCat;
    }

    public void setChildCat(ArrayList childCat) {
        this.childCat = childCat;
    }
    
    
}
