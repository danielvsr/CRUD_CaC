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
import model.Account;
import model.User;

/**
 *
 * @author danie
 */
public class AccountDAO {

/*PRIMERO LLAMAMOS AL METODO CONECTION (IMPORTAMOS LA CLASE)*/
    Connection connection;
/*REALIZAMOS LA CONEXION A NUESTRA BASE, LLAMAMOS A NUESTRO METODO DE CONEXION 
    REALIZADO ANTERIORMENTE EN "CONFIG" MEDIANTE LA CLASE "CONEXION"*/    
    public AccountDAO(){
        Conexion conn = new Conexion();
        connection = conn.getConnection("homebanking", "root", "carde53730");
    }

//METODO PARA TRAER LAS CUENTAS DE USUARIO.    
    public List<Account> getAccounts(int userId)throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        List<Account> accountDB = new ArrayList<>();
            
        ps = connection.prepareStatement("SELECT * FROM accounts WHERE user_id = ?");
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            
            while(rs.next()) {
                int id = rs.getInt("id");
                int accountNumber = rs.getInt("account_number");
                String type = rs.getString("type");
                String currency = rs.getString("currency");
                double balance = rs.getDouble("balance");
                int user_id = rs.getInt("user_id");
                Account cuentas = new Account(id, accountNumber, type, currency, balance, user_id);
                accountDB.add(cuentas);
                //accountDB.add(new Account(rs.getInt("account_number"), rs.getString("type"), rs.getString("currency"), rs.getLong("balance"), rs.getInt("user_id")));
            }
            return accountDB;
    }

//METODO PARA CREACION DE CUENTAS    
    public void crearCuentas(int account_number, String type, String currency, double balance, int user_id) throws SQLException{
        PreparedStatement ps;
        ResultSet rs;
        
            ps = connection.prepareStatement("INSERT INTO accounts (account_number, type, currency, balance, user_id) "
                + "VALUES(?, ?, ?, ?, ?)");
            ps.setInt(1, account_number);
            ps.setString(2, type);
            ps.setString(3, currency);
            ps.setDouble(4, balance);
            ps.setInt(5, user_id);
            
            ps.executeUpdate();
            
            ps.close();
            connection.close();
    }
 
//METODO PARA EDITAR CUENTAS (NO ES UTILIZADO DENTRO DEL CODIGO).    
    public void updateAccount(int id, int account_number, String type, String currency, double balance)throws SQLException{
        PreparedStatement ps;
        ResultSet rs;            
        
            ps = connection.prepareStatement("UPDATE accounts SET account_number = ?, type = ?, currency = ?, balance = ? WHERE id = ?" ); 
            ps.setInt(1, account_number);
            ps.setString(2, type);
            ps.setString(3, currency);
            ps.setDouble(4, balance);
                     
            ps.executeUpdate();        
    }
    
//METODO PARA BORRAR CUENTAS DE USUARIO.
    public void borrarCuenta (int id)throws SQLException{
        PreparedStatement ps;
        ResultSet rs;
        
        ps = connection.prepareStatement("DELETE FROM accounts WHERE id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
        
        ps.close();
        connection.close();
    }
   
}
