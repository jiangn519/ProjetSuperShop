/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.Client;
import modele.ClientManager;

/**
 *
 * @author lin
 */
public class RegisterInfo extends HttpServlet {

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        String firstname = request.getParameter("first-name");
        String lastname = request.getParameter("last-name");
        String tel = request.getParameter("telephone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String postcode = request.getParameter("postcode");
        System.out.println(username+" "+password+" "+firstname);
        String message = "";
        int retour = ClientManager.insertClient(username, password, firstname, lastname, tel, email, address, postcode);
        if (retour == 1) {
            Client c=new Client(username, password, firstname, lastname, tel, email, address, postcode);
            session.setAttribute("user", username);
            session.setAttribute("Client", c);
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.forward(request, response);
        } else if (retour == -1) {
            message = "Username exist!";
            request.setAttribute("message", message);
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/WEB-INF/pageErreur.jsp");
            disp.forward(request, response);
        } else {
            message = "Create user failed!";
            request.setAttribute("message", message);
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/WEB-INF/pageErreur.jsp");
            disp.forward(request, response);
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
