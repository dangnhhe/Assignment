/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package managercontroller;

import dao.FilmDAO;
import dao.ManagerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Films;
import model.Genre;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditFilm", urlPatterns = {"/EditFilm"})
public class EditFilm extends HttpServlet {

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
        FilmDAO fdao = new FilmDAO();
        String fid = request.getParameter("fid");
        ArrayList<Genre> glist = fdao.getAllGeners();
        Films f = fdao.getFilms(fid);
        request.setAttribute("glist", glist);
        request.setAttribute("f", f);
        request.getRequestDispatcher("./manager/editfilm.jsp").forward(request, response);
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
        String fid = request.getParameter("fid");
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String year = request.getParameter("year");
        String country = request.getParameter("country");
        String img = request.getParameter("img");
        String trailer = request.getParameter("trailer");
        ManagerDAO dao = new ManagerDAO();
        dao.editFilm(genre, title, year, country, img, trailer, fid);
        response.sendRedirect("ManageFilm");

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
