/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author lin
 */
public class ShoppingCartManager {
           public static Connection getConnection() {
        String url = "jdbc:oracle:thin:@anis-vps.tech:1521:XE";
        String user = "nan";
        String pwd = "vetement";

        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, pwd);
        } catch (SQLException e) {
            System.out.println("Connexion impossible");
            e.printStackTrace();
        }
        return conn;
    }

    public static void putConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("incapable de fermer la connexion");
                e.printStackTrace();
            }
        }
    }

        public static ShoppingCart getProduitSingle(String id, int quantity,String size) {
        //obtenir les informations des produits qui viennent de SGBD.
        ShoppingCart prd = new ShoppingCart();
        //connect le BD
        Connection conn = getConnection();
        //si la connection a réussi, executer le sql.
        if (conn != null) {
            ResultSet rs = null;
            Statement statement = null;
            try {
                //executer le sql, enregistrer la variable rs.
                String strQuery = "select noprd,nameprd, price, pricesale,photo,genre,datecreat from produit where noprd=\'" + id + "\'";
                statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);
                
                //faire une boucle pour enregistrer les données dans une arraylist.
                while (rs.next()) {
                    
                    prd.setNoprd(rs.getString("noprd"));
                    prd.setNameprd(rs.getString("nameprd"));
                    prd.setPricesale(rs.getDouble("pricesale"));
                    prd.setPhoto(rs.getString("photo"));
                   

                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    rs.close();
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();

                }
                putConnection(conn);
            }
        }
        prd.setQuantityCart(quantity);
        prd.setSize(size);
        return prd;
    }
}
