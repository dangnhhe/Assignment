/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Profile", urlPatterns = {"/profile"})
public class Profile extends HttpServlet {

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
        request.getRequestDispatcher("profile.jsp").forward(request, response);

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

        try {
            UserDAO dao = new UserDAO();
            HttpSession session = request.getSession();
            String email = ((User) session.getAttribute("account")).getEmail();
            String fullnamepf = request.getParameter("fullnamepf");
            int gender = 0;
            gender = Integer.valueOf(request.getParameter("gender"));
            String phonepf = request.getParameter("phonepf");
            String addresspf = request.getParameter("addresspf");
            String myAvatar = request.getParameter("Avatar");

            System.out.println("" + email);
            System.out.println("fullnamepf: " + fullnamepf);
            System.out.println("gender: " + gender);
            System.out.println("phonepf: " + phonepf);
            System.out.println("addresspf: " + addresspf);
            System.out.println("myAvatar: " + myAvatar);
            if (fullnamepf.equals("") || phonepf.equals("") || addresspf.equals("")) {
//            response.getWriter().println("Please do not enter empty!");
                request.setAttribute("msg", "Please do not enter empty!");

            } else {
                dao.updateProfile(fullnamepf, gender, phonepf, addresspf, myAvatar, email);
                session.setAttribute("account", dao.getUserByEmail(email));
//            response.getWriter().println("Change profile successfully!");
                request.setAttribute("msg", "Change profile successfully!");

            }
            request.setAttribute("msg", "Email or password not correct!");
        } catch (Exception e) {
        }

        request.getRequestDispatcher("Home").forward(request, response);
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
