/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author danie
 * host + database, userMysql, passMysql
 * String database, String userMysql, String passMysql
 * private String host = "jdbc:mysql://localhost:3306/";
 */
public class Conexion {
    private String driver = "com.mysql.jdbc.Driver";
    private String host = "jdbc:mysql://localhost:3306/";
    
    public Connection getConnection(String database, String userMysql, String passMysql){
        Connection conn = null;
    
        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(host + database, userMysql, passMysql);
            
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return conn;
    }    

    
    
    /*
    public static void main(String[] arg) throws SQLException{
        Connection conn = null;
        Conexion con = new Conexion();
        conn = con.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        
        ps = conn.prepareStatement("SELECT * FROM users");
        rs = ps.executeQuery();
        
        while(rs.next()){
            int id = rs.getInt("id");
            String username = rs.getString("username");
            String password = rs.getString("password");
            String name = rs.getString("name");
            String lastName = rs.getString("last_name");
            String email = rs.getString("email");            
            String gender = rs.getString("gender");
            System.out.println(" id "+id+" usuario: "+username+" pass: "+password+" nombre: "+name+" apellido: "+lastName+" email:"+email+" genero: "+gender);
        }
    }
*/
}

    