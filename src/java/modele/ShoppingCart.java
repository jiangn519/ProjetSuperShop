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
public class ShoppingCart {

    private String noprd;
    private String nameprd;    
    private double pricesale;
    private String photo;
    private String size; 
    private int quantityCart;

    public String getNoprd() {
        return noprd;
    }

    public String getNameprd() {
        return nameprd;
    }

     public double getPricesale() {
        return pricesale;
    }

    public String getPhoto() {
        return photo;
    }


    public String getSize() {
        return size;
    }
   
    public int getQuantityCart() {
        return quantityCart;
    }

    public void setNoprd(String noprd) {
        this.noprd = noprd;
    }

    public void setNameprd(String nameprd) {
        this.nameprd = nameprd;
    }
 
    public void setPricesale(double pricesale) {
        this.pricesale = pricesale;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

     public void setSize(String size) {
        this.size = size;
    }
   
     public void setQuantityCart(int quantityCart) {
        this.quantityCart = quantityCart;
    }

}
