/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Product;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import Model.AccountDTO;
import Model.CategoryDTO;
import Model.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author MNC
 */
public class ProductManageServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductManageServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductManageServlet at " + request.getContextPath() + "</h1>");
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
                
            
        String message = (String) session.getAttribute("msg");
        session.removeAttribute("msg");

        List<ProductDTO> productDTOs = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        LinkedHashMap<ProductDTO, String> productCmap = new LinkedHashMap<>();
        HashMap<CategoryDTO, Integer> countCategory = new HashMap<>();

        //hide product 
        String action = request.getParameter("action");
        String indexPage_raw = request.getParameter("indexPage");

        try {
            int indexPage = 0;
            if (indexPage_raw == null) {
                indexPage = 1;
            } else {
                indexPage = Integer.parseInt(indexPage_raw);
            }
            if (action == null || action.equals("show")) {
                action = "normal";
                productCmap = productDAO.pagingProduct(action, indexPage);
                productDTOs = productDAO.getAllProduct();

                int numProduct = productDTOs.size();
                int endPage = numProduct / 5;
                if (numProduct % 5 != 0) {
                    endPage++;
                }
                request.setAttribute("endPage", endPage);
                request.setAttribute("action", "show");
                request.setAttribute("tag", indexPage);

                request.setAttribute("productCmap", productCmap);
                request.setAttribute("msg", message);
                request.getRequestDispatcher("ProductManage.jsp").forward(request, response);

            } else {
                productCmap = productDAO.pagingProduct(action, indexPage);
                productDTOs = productDAO.getAllProductHide();
                int numProduct = productDTOs.size();
                int endPage = numProduct / 5;
                if (numProduct % 5 != 0) {
                    endPage++;
                }

                request.setAttribute("action", "hide");
                request.setAttribute("endPage", endPage);
                request.setAttribute("tag", indexPage);

                request.setAttribute("productCmap", productCmap);
                request.setAttribute("msg", message);
                request.getRequestDispatcher("HideProduct.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
            }
            else {
            response.sendRedirect("403.jsp");
        }
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
        AccountDTO account = (AccountDTO) session.getAttribute("account");
        if (account != null) {
            if (account.getRole() == 1) {
                String searchKey = request.getParameter("search");
                System.out.println(searchKey);
                String action = request.getParameter("action");

                LinkedHashMap<ProductDTO, String> productCmap = new LinkedHashMap<>();

                ProductDAO productDAO = new ProductDAO();

                productCmap = productDAO.getSearchProduct(searchKey, action);

                request.setAttribute("productCmap", productCmap);
                request.setAttribute("size", productCmap.size());
                request.setAttribute("action", action);
                request.getRequestDispatcher("ProductSearch.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("403.jsp");
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
