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
import static modele.ProduitManager.getConnection;
import static modele.ProduitManager.getText;
import static modele.ProduitManager.putConnection;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


/**
 *
 * @author lin
 */
public class DetailSizeManager {
    
     public static Connection getConnection() {
         String url = "jdbc:oracle:thin:@anis-vps.tech:1521:XE";
        String user = "nan";
        String pwd = "vetement";
         
//         String url = "jdbc:oracle:thin:@144.217.163.57:1521:XE";
//        String user = "cstteam";
//        String pwd = "anypw";

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
    public static ArrayList getDetailsSize(String idprd) {
        String strQuery = "";
        ArrayList listeSizeStock = new ArrayList();
         DetailSize ds ;
        Connection conn = null;
        conn = getConnection();
        if (conn != null) {
            ResultSet rs = null;
            Statement statement = null;
            try {
                strQuery = "select d.noprd,d.nosize,d.quantitystock,c.namesize from detaillsize d join cataloguesize c on(d.nosize=c.nosize) where d.noprd=\'" +  idprd + "\' order by d.nosize";
                 statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);
                while (rs.next()) {
                    ds= new DetailSize();
                    
                    ds.setNoprd(rs.getString(1));
                    ds.setNosize(rs.getString(2));
                    ds.setQuantitystock(rs.getBigDecimal(3));
                    ds.setNamesize(rs.getString(4));
                     listeSizeStock.add(ds);
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
        return listeSizeStock;

    }
    
      public static JSONArray getQuantitySize(String size,String noprd ) {
        Connection conn = getConnection();        
         JSONArray array = new JSONArray();
       String strQuery="";
        if (conn != null) {
            ResultSet rs = null;
            Statement statement = null;
            try {
                
                 strQuery =  "select d.noprd,d.nosize,d.quantitystock,c.namesize from detaillsize d join cataloguesize c on(d.nosize=c.nosize) where d.noprd=\'" +  noprd + "\'  and c.namesize=\'" +  size + "\' order by d.nosize";
               
                statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);
                ResultSetMetaData metaData =  rs.getMetaData();  
                int columnCount= metaData.getColumnCount();   
                while (rs.next()) {
                    JSONObject jsonObj = new JSONObject(); 
                     for(int i = 1; i <= columnCount;i++)  {
                       String columnName = metaData.getColumnLabel(i); 
                       String value =rs.getString(columnName);  
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
    
    
}
