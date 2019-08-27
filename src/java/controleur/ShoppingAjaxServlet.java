/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.ShoppingCart;

/**
 *
 * @author lin
 */
public class ShoppingAjaxServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            if (session == null) {
                response.sendRedirect("/WEB-INF/pageErreur.jsp");
            }
            Vector buylist = (Vector) session.getAttribute("shoppingcart");
            String trait = request.getParameter("trait");
            String prdno = request.getParameter("prdno");
            String quan = request.getParameter("quantity");
            System.out.println(prdno + " " + quan);
            String prdid = request.getParameter("prdnoD");
            System.out.println("prdnoD string:" + prdid);
            if ("update".equals(trait)) {
                System.out.println(trait + " " + prdno + " " + quan);
                if (!"".equals(prdno) && !"".equals(quan)) {
                    for (int i = 0; i < buylist.size(); i++) {
                        int quantityC = Integer.parseInt(quan);
                        //on récupère l'item à la position i
                        ShoppingCart prd = (ShoppingCart) buylist.elementAt(i);

                        // si on trouve l'item dans le panier
                        if (prd.getNoprd().equals(prdno)) {

                            //on va modifier la quantité en lui ajoutantant la
                            // nouvelle quantité
                            prd.setQuantityCart(quantityC);

                            //on replace l'item dans le panier
                            buylist.setElementAt(prd, i);

                        }
                    } // end of for
                }
            } else if ("delete".equals(trait)) {
                //on supprime l'item du panier
                int prdnoD = Integer.parseInt(prdid);
                System.out.println("trait condition" + trait + "prdnoD: " + prdnoD);
                buylist.removeElementAt(prdnoD);
            }
            double total = 0;
            int nombre = buylist.size();
            for (int i = 0; i < buylist.size(); i++) {

                //on récupère l'item à la position i
                ShoppingCart prd = (ShoppingCart) buylist.elementAt(i);
                total += prd.getPricesale() * prd.getQuantityCart();

            }

            session.setAttribute("shoppingcart", buylist);
            session.setAttribute("total", total);
            session.setAttribute("nombre", nombre);
            Gson gson = new Gson();
            String jsonList = gson.toJson(buylist);
            System.out.println(jsonList);
            out.print(jsonList);
            out.flush();
            out.close();
        }

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
