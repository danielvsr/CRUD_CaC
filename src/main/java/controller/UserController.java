
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


@WebServlet(name = "UserController", urlPatterns = {"/UserController/*"})
public class UserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        //Dentro del TRY vamos a definir todo lo que vamos a hacer con el SERVLET 
            String action = request.getPathInfo();
            //Creamos una VARIABLE llamada "action" a la cual vamos a traer el "request" del "Path"
            //Depende el nombre de la VARIABLE el SWITCH va a realizar un accion especifica
            HttpSession session = request.getSession();     
        
            UserDAO userDB = new UserDAO();
        
            switch(action){
                case "/login":
                    String userName = request.getParameter("user");
                    String pass = request.getParameter("password");
                    boolean login = userDB.login(userName, pass);
                    if(login){
                        User usuario = userDB.getUserByUserName(userName);
                        session.setAttribute("isLogin", login);
                        session.setAttribute("usuario", usuario);
                        response.sendRedirect("/vistas/perfil.jsp");
                    }else{
                        response.sendRedirect("/view/error");
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
                    response.sendRedirect("/view/login");
                    break;
                case"/modificarUsuario":
                    userDB = new UserDAO();
                    
                    String name_mp = request.getParameter("name_ep");
                    String lastname_mp = request.getParameter("lastname_ep");                
                    String email_mp = request.getParameter("email_ep");                
                    String gender_mp = request.getParameter("gender_ep");
                    int id_ep = Integer.parseInt(request.getParameter("id_mp"));
                    
                    userDB.modificarUsuario(id_ep, name_mp, lastname_mp, email_mp, gender_mp);
                    
                    response.sendRedirect("/view/exito");
                    int id = Integer.parseInt(request.getParameter("id_mp"));
                    User usuario = userDB.getUserByID(id);
                    session.setAttribute("usuario", usuario);                   
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
