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

/*EN ESTA CLASE SE VA A CREA TODA LA LOGICA PARA LA CONEXION A MI BASE DE DATOS*/
public class Conexion {
    private String driver = "com.mysql.jdbc.Driver";
    private String host = "jdbc:mysql://localhost:3306/";
/*ESTO ES EL METODO PARA LA CONEXION A MI BASE DE DATOS*/
/*STRING database -> NOMBRE DE MI BD*/
/*STRING userMysql y passMysql -> LOS DATOS PARA CONECTAR A MI BD*/    
/*IMPORTAR LAS CLASES A UTILIZAR*/    
    public Connection getConnection(String database, String userMysql, String passMysql){
/*Creamos una VARIABLE del tipo CONNECTION de nombre CONN -> PODEMOS PONERLE EL NOMBRE QUE NOS QUEDE MÁS COMODO*/
/*La inicializamos en 0 (NULL)porque es lo que después tenemos que retornar -> RETURN CONN*/
        Connection conn = null;
/*Se realiza un bloque TRY / CACHT*/            
        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(host + database, userMysql, passMysql);
/*conn -> NOS VA A DEVOLVER UN OBJETO DEL TIPO CONECCTION CON TODOS LOS DATOS PARA MI CONEXION LO CUALES ESTAN POR PARAMETRO*/
/*NOS VA A DEVOLVER LA CONEXION CADA VEZ QUE LA NECESITEMOS*/
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
/*printStackTrace() -> ES EL METODO QUE VA A DEVOLVER EL ERROR*/            
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

    