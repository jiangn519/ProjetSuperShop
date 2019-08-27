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
public class Produit {

    private String noprd;
    private String nameprd;
    private String namedescription;
    private double price;
    private double pricesale;
    private String photo;
    private String genre;
    private String datecreate;
    private String size;
    private int quantity;
    private String catName;
    private String catNameMere;
   

    public String getNoprd() {
        return noprd;
    }

    public String getNameprd() {
        return nameprd;
    }

    public String getNamedescription() {
        return namedescription;
    }

    public double getPrice() {
        return price;
    }

    public double getPricesale() {
        return pricesale;
    }

    public String getPhoto() {
        return photo;
    }

    public String getGenre() {
        return genre;
    }

    public String getDatecreate() {
        return datecreate;
    }

    public String getSize() {
        return size;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getCatName() {
        return catName;
    }

    public String getCatNameMere() {
        return catNameMere;
    }
    
   

    public void setNoprd(String noprd) {
        this.noprd = noprd;
    }

    public void setNameprd(String nameprd) {
        this.nameprd = nameprd;
    }

    public void setNamedescription(String namedescription) {
        this.namedescription = namedescription;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setPricesale(double pricesale) {
        this.pricesale = pricesale;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setDatecreate(String datecreate) {
        this.datecreate = datecreate;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public void setCatNameMere(String catNameMere) {
        this.catNameMere = catNameMere;
    }
    
     
}
