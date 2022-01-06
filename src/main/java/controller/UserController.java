/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author danie
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController/*"})
public class UserController extends HttpServlet {

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
         
            String action = request.getPathInfo();
            HttpSession session = request.getSession();     
        
            UserDAO userDB = new UserDAO();
        
            switch(action){
                case "/login":
                    String userName = request.getParameter("user");
                    String pass = request.getParameter("password");


                    boolean login = userDB.login(userName, pass);
                    if(login){
                        User user = userDB.getUserByUserName(userName); 
                        session.setAttribute("isLogin", login);
                       
                        response.sendRedirect("/vistas/perfil.jsp");
                    }else{
                        response.sendRedirect("/vistas/login.jsp");
                    };                    
                    break;

                case"/createUser":
                    userName = request.getParameter("username");
                    pass = request.getParameter("password");
                    String name = request.getParameter("name");
                    String lastname = request.getParameter("lastname");                
                    String email = request.getParameter("email");                
                    String gender = request.getParameter("gender");

                    userDB.createUser(userName, pass, name, lastname, email, gender);
                    response.sendRedirect("/view/hola");
                    break;
                case"/logout":
                    session.setAttribute("isLogin", false);
                    response.sendRedirect("/");
                    break;    

                default:

                    break;
            }
            
            
        
            
        } catch(SQLException e){
            e.printStackTrace();
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
