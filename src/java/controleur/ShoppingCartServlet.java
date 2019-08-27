/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.ShoppingCart;

import modele.ShoppingCartManager;

/**
 *
 * @author lin
 */
public class ShoppingCartServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (session == null) {
            response.sendRedirect("/WEB-INF/pageErreur.jsp");
        }
        Vector buylist = (Vector) session.getAttribute("shoppingcart");
        String action = request.getParameter("action");
        String id = request.getParameter("prdid");
        
        String size = request.getParameter("selectSize");
        
        
        if ("ADD".equals(action)) {

            //booleen qui va être utilisé pour vérifier si l'item est déjà 
            //dans le panier
            int  quantity =Integer.parseInt( request.getParameter("quan"));
            boolean match = false;
            ShoppingCart addPrd = ShoppingCartManager.getProduitSingle(id,quantity,size);

            //si panier inexistant on va le créer(cas du 1er item à ajouter)
            if (buylist == null) {

                //on crée le panier
                buylist = new Vector();

                //on ajoute le premier produit
                buylist.addElement(addPrd);

                //si le panier existe déjà (buylist non null) 
            } else {

                //on vérifie si le CD est déjà dans le panier?
                //pour ne pas l'ajouter une autre fois 
                for (int i = 0; i < buylist.size(); i++) {

                    //on récupère l'item à la position i
                    ShoppingCart prd = (ShoppingCart) buylist.elementAt(i);

                    // si on trouve l'item dans le panier
                    if (prd.getNoprd().equals(addPrd.getNoprd()) && prd.getSize().equals(addPrd.getSize())) {

                        //on va modifier la quantité en lui ajoutantant la
                        // nouvelle quantité
                        prd.setQuantityCart(prd.getQuantityCart()+addPrd.getQuantityCart());

                        //on replace l'item dans le panier
                        buylist.setElementAt(prd, i);

                        //on active la variable qui montre qu'on a trouvé l'item
                        //dans le panier
                        match = true;
                    } //end of if name matches
                } // end of for

                //si match est à false, donc item non déjà dans le panier,
                //on va devoir l'ajouter
                if (!match) //on ajoute l'item au panier
                {
                    buylist.addElement(addPrd);
                }
            }

        }
        //Calculer le total des produit
        double total=0;
        int nombre=buylist.size();
         for (int i = 0; i < buylist.size(); i++) {

                    //on récupère l'item à la position i
                    ShoppingCart prd = (ShoppingCart) buylist.elementAt(i);
                    total+=prd.getPricesale()*prd.getQuantityCart();
                    
                }
        //suuite à l'ajout ou à la suppression on doit RÉ-ATTACHER à la session
            //à la place de l'ancien
             session.setAttribute("shoppingcart", buylist);
             session.setAttribute("total", total);
             session.setAttribute("nombre", nombre);

            //et on redirige la requête vers la page EShop.jsp qui va afficher
            //le nouveau panier (grâce au INCLUDE)
            String url = "/WEB-INF/shoppingcart.jsp";
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher(url);
            rd.forward(request, response);
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
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
