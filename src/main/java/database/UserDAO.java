/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 * DAO --> OBJETO QUE TIENE ACCESO A LOS DATOS.
 * @author danie
 */
public class UserDAO {
    Connection connection;
    
    public UserDAO(){
        Conexion conn = new Conexion();
        connection = conn.getConnection("homebanking", "root", "carde53730");
    }

   public List<User> getUsers(int limit)throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        List<User> usersDB = new ArrayList<>();
            
        ps = connection.prepareStatement("SELECT * FROM users LIMIT ?");
            ps.setInt(1, limit);
            rs = ps.executeQuery();
            
            while(rs.next()) {
                usersDB.add(new User(rs.getString("username"), rs.getString("password")));
            }

        
        return usersDB;
    }

    
    public User getUserByID(int id) throws SQLException {
        PreparedStatement preparedSt;
        ResultSet resultSt;
        User user = null;
        
            preparedSt = connection.prepareStatement("SELECT * FROM users WHERE id = ?");
            preparedSt.setInt(1, id);
            resultSt = preparedSt.executeQuery();
                  
            if(resultSt.next()) {
                String username = resultSt.getString("username");
                String password = resultSt.getString("password");
                String name = resultSt.getString("name");
                String lastName = resultSt.getString("last_name");
                String gender = resultSt.getString("gender");
                String email = resultSt.getString("email");
                
                user = new User(username, password, name, lastName, gender, email);
            }
            /*
            resultSt.close();
            preparedSt.close();
            connection.close();*/
            return user;
    }   

    
    public User getUserByUserName(String username) throws SQLException {
        PreparedStatement preparedSt;
        ResultSet resultSt;
        User user = null;
        
            preparedSt = connection.prepareStatement("SELECT * FROM users WHERE id = ?");
            preparedSt.setString(1, username);
            resultSt = preparedSt.executeQuery();
                  
            if(resultSt.next()) {
                String userName = resultSt.getString("username");
                String password = resultSt.getString("password");
                String name = resultSt.getString("name");
                String lastName = resultSt.getString("last_name");
                String gender = resultSt.getString("gender");
                String email = resultSt.getString("email");
                
                user = new User(userName, password, name, lastName, gender, email);
            }           
            return user;
    }

    public boolean login(String username, String password) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;

        ps = connection.prepareStatement("SELECT username, password FROM users WHERE username = ? AND password = ?");
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();
        /*
        CUANDO CIERRO ESTA CONEXION SE ROMPE
        rs.close();
        ps.close();
        connection.close();*/
        return rs.next();
    }
    
    public void createUser(String username, String password, String name, String lastname, String email, String gender) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
    
        ps = connection.prepareStatement("INSERT INTO users(username, password, name, last_name, email, gender) "
                + "VALUES(?, ?, ?, ?, ?, ?)");
        
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, name);
        ps.setString(4, lastname);
        ps.setString(5, email);
        ps.setString(6, gender);
        
        ps.executeUpdate();
    }
/*    
    public boolean createUser(String username, String password, String name, String lastname, String email, String gender, String repass) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        
        if (password.equals(repass)) {
            ps = connection.prepareStatement("INSERT INTO users(username, password, name, last_name, email, gender) "
                + "VALUES(?, ?, ?, ?, ?, ?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(4, lastname);
            ps.setString(5, email);
            ps.setString(6, gender);
            ps.executeUpdate();
            
            ps = connection.prepareStatement("SELECT * FROM users WHERE username = ?");
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
              return true;
            }
          return false;  
        }       
       return false;    
    }
*/    
}
