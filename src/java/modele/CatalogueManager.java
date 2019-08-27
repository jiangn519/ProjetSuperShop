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
import java.util.ArrayList;

/**
 *
 * @author lin
 */
public class CatalogueManager {
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
     public static ArrayList getListeCatalogue() {
        ArrayList <Catalogue> listeCatalogue = new ArrayList();
        ArrayList <Catalogue> listeChild = null;
        Connection conn = getConnection();
        if (conn != null) {
            ResultSet rs = null;
            Statement statement = null;
            try {
                //String strQuery = "select c.nocat,c.namecat, cl.namecat from catalogue c join catalogue cl on cl.nocat = c.nocatmere order by c.nocat";
               String strQuery = "select nocat,namecat, nocatmere  from catalogue";
                statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);
                Catalogue cat;
                while (rs.next()) {
                    cat = new Catalogue();
                    cat.setNocat(rs.getString("nocat"));
                    cat.setNamecat(rs.getString("namecat"));
                    cat.setNamecatmere(rs.getString("nocatmere"));
                    cat.setChildCat(listeChild);
                    listeCatalogue.add(cat);
                   
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
        
        return listeCatalogue;
    }
   
     public static ArrayList getMenuListe() {
         ArrayList<Catalogue>  rootMenu=getListeCatalogue();
          ArrayList<Catalogue>  menuListe=new ArrayList<Catalogue>();
         for(int i=0;i<rootMenu.size();i++){
             if(rootMenu.get(i).getNamecatmere()==null){
                 menuListe.add(rootMenu.get(i));
             }
             }
         for(Catalogue cat: menuListe){
             cat.setChildCat(getChild(cat.getNocat(),rootMenu));
         }    
         return menuListe;
     }
     
      public static ArrayList getChild(String no, ArrayList<Catalogue> rootMenu) {
         ArrayList<Catalogue>  childMenu=new ArrayList<>();
         for(Catalogue cat: rootMenu){
             if(cat.getNamecatmere()!=null){
                 if(no.equals(cat.getNamecatmere())){
                     childMenu.add(cat);
                 }
             }
         }    
         
         if(childMenu.size()==0){
             return null;
         }
         return childMenu;
      }
}
