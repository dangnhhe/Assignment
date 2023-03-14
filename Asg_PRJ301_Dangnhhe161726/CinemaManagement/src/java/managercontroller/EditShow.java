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
import model.Room;
import model.Show;
import model.Slot;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditShow", urlPatterns = {"/EditShow"})
public class EditShow extends HttpServlet {

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
        ManagerDAO dao = new ManagerDAO();
        FilmDAO fdao = new FilmDAO();
        String sid = request.getParameter("sid");
        Show show = fdao.getShow(sid);
        ArrayList<Room> rlist = dao.getAllRoom();
        ArrayList<Slot> slist = dao.getAllSlot();
        ArrayList<Films> flist = dao.getAllFilmAndId();
        request.setAttribute("rlist", rlist);
        request.setAttribute("slist", slist);
        request.setAttribute("flist", flist);
        request.setAttribute("sh", show);
        request.getRequestDispatcher("./manager/editshow.jsp").forward(request, response);

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
        String sid = request.getParameter("sid");
        String room = request.getParameter("room");
        String slot = request.getParameter("slot");
        String fid = request.getParameter("fid");
        String showdate = request.getParameter("showdate");
        String Price = request.getParameter("Price");
        String status = request.getParameter("status");
        ManagerDAO dao = new ManagerDAO();
        dao.editShow(room, fid, showdate, Price, status, slot, sid);
        response.sendRedirect("ManageShow");

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
