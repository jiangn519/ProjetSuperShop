/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author lin
 */
public class ProduitManager {

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

    public static ArrayList getListeProduit() {
        ArrayList listeProduit = new ArrayList();
        Connection conn = getConnection();
        if (conn != null) {
            ResultSet rs = null;
            Statement statement = null;
            try {
                //String strQuery = "select c.nocat,c.namecat, cl.namecat from catalogue c join catalogue cl on cl.nocat = c.nocatmere order by c.nocat";
                String strQuery = "select p.noprd,p.nameprd,p.description,p.price,p.pricesale,p.photo,c.namecat,cl.namecat from produit order by noprd";
                statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);
                Produit prd;
                while (rs.next()) {
                    prd = new Produit();
                    prd.setNoprd(rs.getString("noprd"));
                    prd.setNameprd(rs.getString("nameprd"));
                    prd.setNamedescription(rs.getString("description"));
                    prd.setPrice(rs.getDouble("price"));
                    prd.setPricesale(rs.getDouble("pricesale"));
                    prd.setPhoto(rs.getString("photo"));
                    listeProduit.add(prd);

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
        return listeProduit;
    }

    public static Produit getDetailsProduit(String idprd) {
        String strQuery = "";
        Produit prd = new Produit();
        Catalogue cat = new Catalogue();
        Connection conn = null;
        conn = getConnection();
        if (conn != null) {
            ResultSet rs = null;
            Statement statement = null;
            try {
                strQuery = "select p.noprd,p.nameprd,p.description,p.price,p.pricesale,p.photo,p.genre, c.namecat,cl.namecat from produit p join catalogue c on (p.nocat=c.nocat) join catalogue cl on (c.nocatmere=cl.nocat) where p.noprd=\'" + idprd + "\'";

                statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);
                if (rs.next()) {
                    prd.setNoprd(rs.getString("noprd"));
                    prd.setNameprd(rs.getString("nameprd"));
                    prd.setNamedescription(rs.getString("description"));
                    prd.setPrice(rs.getDouble("price"));
                    prd.setPricesale(rs.getDouble("pricesale"));
                    prd.setPhoto(rs.getString("photo"));
                    prd.setGenre(rs.getString("genre"));
                    prd.setCatName(rs.getString(8));
                    prd.setCatNameMere(rs.getString(9));
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
        return prd;

    }

    public static ArrayList getProduitSimple() {
        //obtenir les informations des produits qui viennent de SGBD.
        ArrayList listeProduit = new ArrayList();
        //connect le BD
        Connection conn = getConnection();
        //si la connection a réussi, executer le sql.
        if (conn != null) {
            ResultSet rs = null;
            Statement statement = null;
            try {
                //executer le sql, enregistrer la variable rs.
                String strQuery = "select noprd,nameprd, price, pricesale,photo,genre,datecreat from produit order by pricesale";
                statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);
                Produit prd;
                //faire une boucle pour enregistrer les données dans une arraylist.
                while (rs.next()) {
                    prd = new Produit();
                    prd.setNoprd(rs.getString("noprd"));
                    prd.setNameprd(rs.getString("nameprd"));
                    prd.setPricesale(rs.getDouble("pricesale"));
                    prd.setPhoto(rs.getString("photo"));
                    prd.setGenre(rs.getString("genre"));
                    prd.setDatecreate("datecreat");
                    listeProduit.add(prd);

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
        return listeProduit;
    }

    public static ArrayList getProduitNewArrival() {
        //obtenir les informations des produits news arrivals qui viennent de SGBD.
        ArrayList listeProduit = new ArrayList();
        //connect le BD
        Connection conn = getConnection();
        //si la connection a réussi, executer le sql.
        if (conn != null) {
            ResultSet rs = null;
            Statement statement = null;
            try {
                //executer le sql, enregistrer la variable rs.
                String strQuery = "select noprd,nameprd, pricesale,photo,genre,datecreat from produit where genre='N' order by datecreat Desc ";
                statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);
                Produit prd;
                //faire une boucle pour enregistrer les données dans une arraylist.
                while (rs.next()) {
                    prd = new Produit();
                    prd.setNoprd(rs.getString("noprd"));
                    prd.setNameprd(rs.getString("nameprd"));
                    prd.setPricesale(rs.getDouble("pricesale"));
                    prd.setPhoto(rs.getString("photo"));
                    prd.setGenre(rs.getString("genre"));
                    prd.setDatecreate("datecreat");
                    listeProduit.add(prd);

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
        return listeProduit;
    }

    public static ArrayList getListeProduitGenre(String genre) {
        ArrayList listeProduit = new ArrayList();
        Connection conn = getConnection();
        if (conn != null) {
            ResultSet rs = null;
            Statement statement = null;
            try {
                //String strQuery = "select c.nocat,c.namecat, cl.namecat from catalogue c join catalogue cl on cl.nocat = c.nocatmere order by c.nocat";
                String strQuery = "select p.noprd,p.nameprd,p.description,p.price,p.pricesale,p.photo,p.genre,c.namecat,cl.namecat from produit p join catalogue c on (p.nocat=c.nocat) join catalogue cl on (c.nocatmere=cl.nocat) where cl.nocat=\'" + genre + "\' order by pricesale";
                statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);
                Produit prd;
                while (rs.next()) {
                    prd = new Produit();
                    prd.setNoprd(rs.getString("noprd"));
                    prd.setNameprd(rs.getString("nameprd"));
                    prd.setNamedescription(rs.getString("description"));
                    prd.setPrice(rs.getDouble("price"));
                    prd.setPricesale(rs.getDouble("pricesale"));
                    prd.setPhoto(rs.getString("photo"));
                    prd.setGenre(rs.getString("genre"));
                    prd.setCatName(rs.getString(8));
                    prd.setCatNameMere(rs.getString(9));
                    
                    listeProduit.add(prd);

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
        return listeProduit;
    }

    public static JSONArray getListProduitRecherche(String catMere, String catChild, String genre, String size, String price) {
        Connection conn = getConnection();
        String s = getText(catMere, catChild, genre, size, price);
        JSONArray array = new JSONArray();
        String strQuery = "";
        if (conn != null) {
            ResultSet rs = null;
            Statement statement = null;
            try {
                if (!("").equals(size)) {
                    strQuery = "select p.noprd,p.nameprd,p.pricesale,p.photo,p.genre from produit p join catalogue c on (p.nocat=c.nocat) join catalogue cl on (c.nocatmere=cl.nocat)  join detaillsize d on(p.NOPRD=d.NOPRD)  where " + s + " order by p.pricesale, p.nameprd ";
                } else {
                    strQuery = "select p.noprd,p.nameprd,p.pricesale,p.photo,p.genre from produit p join catalogue c on (p.nocat=c.nocat) join catalogue cl on (c.nocatmere=cl.nocat)   where " + s + " order by p.pricesale, p.nameprd ";
                }
                statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);
                ResultSetMetaData metaData = rs.getMetaData();
                int columnCount = metaData.getColumnCount();
                while (rs.next()) {
                    JSONObject jsonObj = new JSONObject();
                    for (int i = 1; i <= columnCount; i++) {
                        String columnName = metaData.getColumnLabel(i);
                        String value = rs.getString(columnName);
                        jsonObj.put(columnName, value);
                    }
                    array.put(jsonObj);

                }

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (JSONException ex) {
                Logger.getLogger(ProduitManager.class.getName()).log(Level.SEVERE, null, ex);
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
        return array;
    }
    


    public static String getText(String catMere, String catChild, String genre, String size, String price) {
        String text = "";
        if (!("").equals(catMere)) {
            text += "cl.nocat=\'" + catMere + "\'  and ";
        }
        if (!("").equals(catChild)) {
            text += "c.nocat=\'" + catChild + "\'  and ";
        }
        if (!("").equals(genre)) {
            if (("N").equals(genre) || ("S").equals(genre)|| ("Z").equals(genre)) {
                text += "p.genre=\'" + genre + "\'  and ";
            }
        }
        if (!("").equals(size)) {
            text += "d.nosize=\'" + size + "\'  and ";
        }

        switch (price) {
            case "1":
                text += "p.pricesale between 0 and 50";
                break;
            case "2":
                text += "p.pricesale between 50 and 100";
                break;
            case "3":
                text += "p.pricesale between 100 and 150";
                break;
            case "4":
                text += "p.pricesale between 150 and 200";
                break;
            case "5":
                text += "p.pricesale >200";
                break;
            default:
                text += "p.pricesale >0";
                break;
        }

        return text;

    }
    
    public static ArrayList getProduitCatChild(String catChild) {
        //obtenir les informations des produits qui viennent de SGBD.
        ArrayList listeProduit = new ArrayList();
        //connect le BD
        Connection conn = getConnection();
        //si la connection a réussi, executer le sql.
        if (conn != null) {
            ResultSet rs = null;
            Statement statement = null;
            try {
                //executer le sql, enregistrer la variable rs.
                String strQuery = "select p.noprd,p.nameprd,p.pricesale,p.photo,p.genre from produit p where p.nocat=\'" + catChild + "\'  order by p.pricesale";
                statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);
                Produit prd;
                //faire une boucle pour enregistrer les données dans une arraylist.
                while (rs.next()) {
                    prd = new Produit();
                    prd.setNoprd(rs.getString("noprd"));
                    prd.setNameprd(rs.getString("nameprd"));
                    prd.setPricesale(rs.getDouble("pricesale"));
                    prd.setPhoto(rs.getString("photo"));
                    prd.setGenre(rs.getString("genre"));
                    prd.setDatecreate("datecreat");
                    listeProduit.add(prd);

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
        return listeProduit;
    }

}
