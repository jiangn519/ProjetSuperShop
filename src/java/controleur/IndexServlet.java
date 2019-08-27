/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.Catalogue;
import modele.CatalogueManager;
import modele.ProduitManager;

/**
 *
 * @author lin
 */
public class IndexServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param config
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName(config.getInitParameter("jdbcDriver"));
            System.out.println("jdbcDriver");
        } catch (ClassNotFoundException ex) {
            System.out.println("Initialize connector problem");
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String local = "";
        HttpSession session = request.getSession();
        Locale locale = Locale.getDefault();
        ResourceBundle bundle = ResourceBundle.getBundle("ressources_i18n.Messages", locale);
        String selectLang = request.getParameter("lang");
        if (selectLang == null || ("").equals(selectLang)) {
            local = request.getHeader("accept-language").substring(0, 2);
        } else {
            local = selectLang;
        }

        List catListe = new ArrayList();
        List produitNewListe = new ArrayList();
        List produitListe = new ArrayList();
        catListe = CatalogueManager.getMenuListe();
        produitNewListe = ProduitManager.getProduitNewArrival();
        produitListe = ProduitManager.getProduitSimple();
        request.setAttribute("catalogues", catListe);
        request.setAttribute("produitsNew", produitNewListe);
        request.setAttribute("produits", produitListe);
        session.setAttribute("bundle", bundle);
        session.setAttribute("locale", local);
        RequestDispatcher disp = getServletContext().getRequestDispatcher("/index1.jsp");
        disp.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
