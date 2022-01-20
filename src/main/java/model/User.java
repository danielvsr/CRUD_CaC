/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import database.AccountDAO;
import java.util.List;
import java.sql.SQLException;
/**
 *
 * @author danie
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String name;
    private String lastName;
    private String gender;
    private String email;
    private List<Account> userAccounts;

/*CONSTRUCTOR DEL USUARIO COMPLETO*/
    public User(int id, String username, String password, String name, String lastName, String gender, String email){
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.lastName = lastName;
        this.gender = gender;
        this.email = email;

        AccountDAO accounts = new AccountDAO();

    }
/*CONTRUCTOR SOLO PARA EL USUARIO Y CONTRASEÑA -> VA A SERVIR PARA EL METODO LOGIN*/
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }
 
/*EMPIEZAN LOS GET & SET*/    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }


    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    
    public String getName() {
        return name;
    }    

    public void setName(String name) {
        this.name = name;
    }

    
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    
    public String getGender() {
        return gender;
    }    

    public void setGender(String gender) {
        this.gender = gender;
    }

   
    public String getEmail() {
        return email;
    }    

    public void setEmail(String email) {
        this.email = email;
    }
    
    public List<Account> getUserAccounts() {
        return userAccounts;
    }    

    public void setUserAccounts(List<Account> userAccounts) {
        this.userAccounts = userAccounts;
    }

/*    
    public String getAvatar() {
        return avatar;
    }
    
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    


    
*/













}
