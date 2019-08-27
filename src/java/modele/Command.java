/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Date;

/**
 *
 * @author lin
 */
public class Command {
    private String nocom;
    private Date datecom ;
    private String etat ;
    private String idclient ;

    public String getNocom() {
        return nocom;
    }

    public Date getDatecom() {
        return datecom;
    }

    public String getEtat() {
        return etat;
    }

    public String getIdclient() {
        return idclient;
    }

    public void setNocom(String nocom) {
        this.nocom = nocom;
    }

    public void setDatecom(Date datecom) {
        this.datecom = datecom;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public void setIdclient(String idclient) {
        this.idclient = idclient;
    }
    
}
