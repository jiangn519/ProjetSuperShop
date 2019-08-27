/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lin
 */
public class ClientManager {

    private static ArrayList listeClient;

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

    public static Client validerClient(String name, String pwd) {

        Connection conn = getConnection();
        boolean isValide = false;
        Client c = null;
        if (conn != null) {
            ResultSet rs = null;
            Statement statement = null;

            try {
                String strQuery = "select idclient, username,password,firstname,lastname,tel,email,address,postcode from client where username=\'" + name + "\' and password=\'" + pwd + "\' ";
                statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);

                if (rs.next()) {
                    c = new Client();
                    c.setUsername(rs.getString("username"));
                    c.setPassword(rs.getString("password"));
                    c.setFirstname(rs.getString("firstname"));
                    c.setLastname(rs.getString("lastname"));
                    c.setTel(rs.getString("tel"));
                    c.setEmail(rs.getString("email"));
                    c.setAddress(rs.getString("address"));
                    c.setPostcode(rs.getString("postcode"));
                    //isValide = true;

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
        return c;
    }

    public static int insertClient(String username, String pwd, String firstname, String lastname, String tel,
            String email, String address, String postcode) {

        Connection conn = getConnection();
        ResultSet rs = null;
        Statement statement = null;
        PreparedStatement stm = null;
        int nombre = 0;
        String idClient = "";
        if (conn != null) {
            boolean trouve = false;
            try {
                String strQuery = "select * from client order by idclient";
                statement = conn.createStatement();
                rs = statement.executeQuery(strQuery);
                while (rs.next()) {
                    if (username.equals(rs.getString("username"))) {
                        trouve = true;
                    }
                    idClient = rs.getString("idclient");
                }
            } catch (SQLException ex) {
                Logger.getLogger(ClientManager.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (trouve) {
                return -1;
            } else {
                try {
                    String sql = "insert into client values(?,?,?,?,?,?,?,?,?,?)";
                    stm = conn.prepareStatement(sql);
                    System.out.println("idclient" + idClient);
                    String id = String.valueOf(Integer.parseInt(idClient) + 1);
                    stm.setString(1, id);
                    stm.setString(2, username);
                    stm.setString(3, pwd);
                    stm.setString(4, firstname);
                    stm.setString(5, lastname);
                    stm.setString(6, tel);
                    stm.setString(7, email);
                    stm.setString(8, address);
                    stm.setString(9, postcode);
                    stm.setString(10, "A");

                    nombre = stm.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        stm.close();

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    putConnection(conn);
                }
            }
        }
        return nombre;
    }

    public static int updateClient(String username, String firstname, String lastname, String tel,
            String email, String address, String postcode) {
        Connection conn = getConnection();
        PreparedStatement stm = null;
        int nombre=-1;
        String sql = "update  client set firstname=?, lastname=?, tel=?, email=?, address=?, postcode=?  where username=?";
         if (conn != null) {
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, firstname);
            stm.setString(2, lastname);
            stm.setString(3, tel);
            stm.setString(4, email);
            stm.setString(5, address);
            stm.setString(6, postcode);
            stm.setString(7, username);
            nombre=stm.executeUpdate();
            

        } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        stm.close();

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    putConnection(conn);
                }
         }
        return nombre;
            }
   
}
