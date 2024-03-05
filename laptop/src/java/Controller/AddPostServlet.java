/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import DAO.PostCategoryDAO;
import DAO.PostListDAO;
import Model.AccountDTO;
import Model.PostCategoryDTO;
import Model.PostDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;

/**
 *
 * @author MNC
 */
public class AddPostServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddPostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPostServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        AccountDTO account = (AccountDTO) session.getAttribute("account");
        if (account != null) {
            if (account.getRole() == 1) {
                //List User
                PostCategoryDAO postCategoryDAO = new PostCategoryDAO();
                ArrayList<PostCategoryDTO> postCategoryDTOs = postCategoryDAO.getAllPostCategory();
                request.setAttribute("postCategoryDTOs", postCategoryDTOs);
                request.getRequestDispatcher("AddNewPost.jsp").forward(request, response);
            } else {
                response.sendRedirect("403.jsp");
            }
        } else {
            response.sendRedirect("403.jsp");
        }

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
        HttpSession session = request.getSession();
        String content = request.getParameter("content");
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        System.out.println(category);
        Part banner = request.getPart("banner");
        String fileBanner = banner.getSubmittedFileName();

        if (content.isEmpty() || title.isEmpty() || fileBanner.isEmpty()) {
            session.setAttribute("msg", "Add New Post Not Sucess!");
            response.sendRedirect("postDashboard");
        } else {
            PostDTO pdto = new PostDTO(0, title, "", fileBanner, "", content, category);
            PostListDAO postListDAO = new PostListDAO();
            int checkAddPost = postListDAO.addNewPost(pdto);
            if (checkAddPost != 0) {
                String path = getServletContext().getRealPath("") + "images/Post";
                File file = new File(path);
                banner.write(path + File.separator + fileBanner);
                session.setAttribute("msg", "Add New Post Sucess!");
                response.sendRedirect("postDashboard");
            } else {
                System.out.println("error server");
            }
        }

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
