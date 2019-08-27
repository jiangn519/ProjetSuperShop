/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Vector;

import java.sql.Date;
/**
 *
 * @author lin
 */
public class CommandManager {
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

//    public static boolean insertCommand(Vector buylist)  throws SQLException{
//        Connection conn = getConnection();
//        PreparedStatement stm=null;
//        String nocom;
//    Date datecom ;
//    String etat ;
//    String idclient ;
//    String sql = "insert into command values(?,?,?,?) ";
//    stm = conn.prepareStatement(sql);
//    //datecom=new Date();
//       for (int i = 0; i < buylist.size(); i++) {
//
//          //on récupère l'item à la position i
//          ShoppingCart prd = (ShoppingCart) buylist.elementAt(i);
//         
//       
//    }
//    }
}
