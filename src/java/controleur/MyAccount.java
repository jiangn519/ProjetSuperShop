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
public class MyAccount extends HttpServlet {

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
        Client c = (Client) session.getAttribute("Client");
        String cat = request.getParameter("cat");
        if ("edit".equals(cat)) {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/WEB-INF/myaccountedit.jsp");
            disp.forward(request, response);

        } else if ("pwd".equals(cat)) {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/WEB-INF/myaccountpwd.jsp");
            disp.forward(request, response);
        } else if ("confirm".equals(cat)) {
            String username = request.getParameter("username");
            String firstname = request.getParameter("first-name");
            String lastname = request.getParameter("last-name");
            String tel = request.getParameter("telephone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String postcode = request.getParameter("postcode");
            int nombre=ClientManager.updateClient(username, firstname, lastname, tel, email, address, postcode);
            if(nombre>0){
            c.setFirstname(firstname);
            c.setLastname(lastname);
            c.setTel(tel);
            c.setEmail(email);
            c.setAddress(address);
            c.setPostcode(postcode);
            session.setAttribute("Client", c);
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/WEB-INF/myaccount.jsp");
            disp.forward(request, response);
            }
        } else {

            RequestDispatcher disp = getServletContext().getRequestDispatcher("/WEB-INF/myaccount.jsp");
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
