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
 * CON ESTA CLASE SE CREA LA LOGICA DE ACCESO A MIS DATOS.
 * ACA SE VAN A DEFINIR LOS METODOS QUE VAN A INTERACTUAR ENTRE LA BD Y MI APLICACIÓN.
 * 
 */
public class UserDAO {
/*Voy a definir una VARIABLE CONNECTION llamada "CONNECTION" la cual no voy a inicianilizar ni dar ningun valor*/
/*Esto es para crear una instancia en la BD*/    
    Connection connection;

/*SE DEFINE EL METODO CONSTRUCTOR DE MI BD*/  
    public UserDAO(){
/*Vamos a crear una instancia de la CLASE CONEXION creada anteriormente*/        
        Conexion conn = new Conexion();
/*A la VARIABLE CONNECTION se le asigna la conexion a la BD tal cual lo creamos en la CLASE CONEXION (Linea 21/28)*/        
        connection = conn.getConnection("homebanking", "root", "carde53730");
    }


//EXPLICACION DE LO QUE VA A REALIZAR CADA METODO -> LEER PARA ENTENDER QUE HACE EN CADA PASO.

/*CREAMOS UN METODO PARA PODER TRAERNOS UN USUARIO:
1- IMPORTANTE ESTE METODO LO VAMOS A CORRER EN NUESTRO CONTROLADOR.
2- NUESTO CONTROLADOR LO VA A GUARDAR EN UN "SESSION"
3- VAMOS A RESCATAR ESA INFORMACIÓN DESDE NUESTRO NAVEGADOR A TRAVES DEL CACHÉ
4- MUESTRA ESA INFORMACION EN LA PAGINA*/
   
//Definimos un metodo PUBLIC que va a ser del tipo "USER" -> NOS TIENE QUE DEVOLVER UN OBJETO DEL TIPO USER CREADO EN EL "MODEL"   
//Vamos a llamar al metodo "GetUserById" que va a recibir un INT ID por parametro
   public User getUserByID(int id) throws SQLException {
//Va a hacer lo siguiente:
/*POR ESTANDAR: "PreparedStatement" se le pone de nombre "ps" y "ResultSet" se le pone de nombre "rs"*/
        PreparedStatement preparedSt;//Se crea la VARIABLE "PreparedStatement" de nombre: "preparedSt" o "ps"        
        ResultSet resultSt;//Se crea la VARIABLE "ResultSet" de nombre: "resultSt" o "rs"
                           //En esta variable se guardan los resultados que traemos de la BD        
        User user = null;//Creamos un OBJETO del tipo USER llanado "user" y lo inicializamos en 0 o NULL
                         //SI NO EXISTE EL USUARIO CUANDO CONSULTA A LA BD NOS VA A DEVOLVER NULL
            
            preparedSt = connection.prepareStatement("SELECT * FROM users WHERE id = ?");
            //Agarro mi VARIABLE "preparedSt" y le vamos a asignar la VARIABLE "Connection"
            //Realizamos nuestro "prepareStatement" y le enviamos nuestra sentencia de SQL
            //El "?" corresponde a que al estar trabajando con una consulta preparada y no estatica, no sabemos el valor que tiene ni cual va a ser ese "ID"
            preparedSt.setInt(1, id);
            //Vamos a SETEAR el valor de ese "ID" y nos va a decir que "1" es el valor de la primer incognita "?" la que va a tomar el valor de "ID"
            //Lo toma del parametro dentro de nuesto METODO: getUserByID(int id->ESTE VALOR)
            resultSt = preparedSt.executeQuery();
            //Llamamos a la VARIABLE "resultSt" y le asignamos "preparedSt" -> CUANDO HACEMOS UNA CONSULTA A LA BD DEBEMOS PORNER "executeQuery()"      
            //executeQuery() es porque estamos realizando un SELECT
            //Cuando estamos MODIFICANDO es "executeUpdate()" -> SON METODOS DE LA CLASE "ResultSet"
            if(resultSt.next()) {
            //CON EL IF VALIDAMOS SI EL "resultSt" TIENE UN VALOR
            //SI TIENE UN VALOR ME VA A DEVOLVER UN "next()" SINO UN "NULL"
                int userid = resultSt.getInt("id");
                String username = resultSt.getString("username");//UTILIZO LA VARIABLE "USERNAME" PORQUE "USER" LA UTILICE EN "User user = new User();"
                String password = resultSt.getString("password");
                String name = resultSt.getString("name");
                String lastName = resultSt.getString("last_name");
                String gender = resultSt.getString("gender");
                String email = resultSt.getString("email");
                //ACA ME VA A TRAER TODOS LOS DATOS DEL USUARIO
                //ESTOS DATOS DEBEN ESTAR EN CLASE -> "User"
                //DENTRO DEL "getString()" DEBEN IR LOS NOMBRES DE LA COLUMNA DE MI TABLA DE LA BD
                user = new User(userid, username, password, name, lastName, gender, email);
                //UNA VEZ QUE CONSULTA NOS DEVUELVE UN "user" Y DENTRO DE "User()" VAN LOS DATOS QUE VAMOS A TRAER
                //ESOS DATOS DEBEN SER LOS MISMOS QUE EN EL CONSTRUCTOS DE "User()" DONDE LOS TRAERMOS
                //CONSTRUCTOR ES CUANDO TIENE EL POR EJEMPLO this.lastName = lastName QUE SE ALOJA DENTRO DE LOS PARAMETROS DEL CONSTRUCTOR
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
        
            preparedSt = connection.prepareStatement("SELECT * FROM users WHERE username = ?");
            preparedSt.setString(1, username);
            resultSt = preparedSt.executeQuery();
                  
            if(resultSt.next()) {
                int user_id = resultSt.getInt("id");
                String userName = resultSt.getString("username");
                String password = resultSt.getString("password");
                String name = resultSt.getString("name");
                String lastName = resultSt.getString("last_name");
                String gender = resultSt.getString("gender");
                String email = resultSt.getString("email");
                
                user = new User(user_id, userName, password, name, lastName, gender, email);
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
    
    public void editUser(String name, String lastname, String email, String gender, String username)throws SQLException{
        PreparedStatement ps;
        ResultSet rs;
    
        ps = connection.prepareStatement("UPDATE users SET name = ? , last_name = ? , email = ? , gender = ? WHERE username = ?");
        
        ps.setString(1, name);
        ps.setString(2, lastname);
        ps.setString(3, email);
        ps.setString(4, gender);
        ps.setString(5, username);
        
        ps.executeUpdate();
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

//NOS PERMITE PARA UTILIZAR OTROS METODOS
//EL MAIN HACE QUE PODAMOS PORBARLO POR COSNSOLA
    public static void main(String[] args) {
        
        UserDAO user = new UserDAO();
        
        try {
            User usuario = user.getUserByUserName("admin");
            System.out.print(usuario.getName() + " ");
            System.out.print(usuario.getLastName() + " - ");
            System.out.print(usuario.getUsername() + " - ");
            System.out.print(usuario.getPassword() + " - ");
            System.out.print(usuario.getEmail());
              System.out.print(usuario.getGender());
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
    }  

  }