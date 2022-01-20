/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.AccountDAO;
import database.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.User;

/**
 *
 * @author danie
 */
@WebServlet(name = "AccountController", urlPatterns = {"/AccountController/*"})
public class AccountController extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String action = request.getPathInfo();
            HttpSession session = request.getSession();
            UserDAO userDB = new UserDAO();
            AccountDAO accountDB = new AccountDAO();
            
            
            switch (action){
                case "/perfilCuenta":
                    /*
                    List<Account> accounts = new ArrayList<>();
                    User user = (User) session.getAttribute("user");
                    accounts = accountDB.getAccounts(user.getId());
                    session.setAttribute("accounts", accounts);
                    response.sendRedirect("/view/perfilCuenta.jsp");*/
                    
                    response.sendRedirect("/view/perfilCuenta.jsp");
                    String userName = request.getParameter("nameUser_ep");
                    User usuario = userDB.getUserByUserName(userName);
                    session.setAttribute("usuario", usuario);
                    List<Account> accounts = new ArrayList<>();
                    accounts = accountDB.getAccounts(usuario.getId());
                    session.setAttribute("accounts", accounts);
                    break;
                case "/delete":
 
                    response.sendRedirect("/view/perfil");
                    
                    break;    
                case "/nuevaCuenta":
                    /*
                    UserDAO userDB = new UserDAO();
                    String userName = request.getParameter("user");
                    String pass = request.getParameter("password");
                    boolean login = userDB.login(userName, pass);
                    */
                    int account_number = Integer.parseInt(request.getParameter("account_number"));
                    String type = request.getParameter("type");
                    String currency = request.getParameter("currency");
                    long balance = Long.parseLong(request.getParameter("balance"));
                    int user_id = Integer.parseInt(request.getParameter("user_id"));
                    
                    accountDB.crearCuentas(account_number, type, currency, balance, user_id);
                    response.sendRedirect("/view/perfil");
                    
                    break;

                default:
                    
                    break;
            }
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
        /*try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }*//*
        AccountDAO accountDB = new AccountDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        
        if(accion.equals("eliminar")){
            int id = Integer.parseInt(request.getParameter("id"));
            accountDB.deleteAccount(id);
            dispatcher = request.getRequestDispatcher("/view/perfil");
        }
        dispatcher.forward(request, response);*/
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
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
