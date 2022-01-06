<%-- 
    Document   : createAccount
    Created on : 04/01/2022, 15:23:10
    Author     : danie
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.UserDAO"%>
<%@page import="database.AccountDAO"%>
<%@include file="/vistas/partials/header.jsp" %>
        
    <main class="container mt-5">
<%--        <script>
            document.write("Hola")
            function numberAccount(min, max){
                let numeroCuenta = 0;
                numeroCuenta = Math.random() * (0 - 10000000) + 10000000;
                numeroCuenta = numeroCuenta + 100000000000000;
            }
            document.account_number.account_number.value=numeroCuenta;
        </script>     

    <% int numeroAleatorio = (int) (Math.random() * (0 - 10000000) + 10000000);
                out.println(numeroAleatorio + 1000000000);
    %>
--%>            
        <form action="/AccountController/nuevaCuenta" method="POST">
            <div class="form-floating mb-3 col-6 p-2">
                <select class="form-select" id="type" name="type" aria-label="Floating label select example">
                    <option selected>Seleccione tipo de cuenta</option>
                    <option value="$CA">Caja de Ahorro</option>
                    <option value="$CC">Cuenta Corriente</option>
                    <option value="u$s">Caja de Ahorro en Dólares</option>
                    <option value="?CA">Caja de Ahorro Electrónica</option>
                </select>
               <label for="type">Elija el tipo de cuenta</label>
            </div>
            <div class="form-floating mb-3 col-6 p-2">
                <input type="number" class="form-control" id="account_number" name="account_number"
                       placeholder="account_number" value="account_number">
                <label for="account_number">N° Cuenta:</label>
            </div>
            <div class="form-floating mb-3 col-6 p-2">
                <select class="form-select" id="currency" name="currency" aria-label="Floating label select example">
                    <option selected>Seleccione tipo de cuenta</option>
                    <option value="ARG">PESOS</option>
                    <option value="USD">DOLARES</option>
                    <option value="BIT">BITCOINS</option>
        
                </select>
               <label for="currency">Elija el tipo de moneda</label>
            </div>            
            <div class="form-floating mb-3 col-6 p-2">
                <input type="number" class="form-control" id="balance" name="balance">
                <label for="balance">Dinero a ingresar:</label>
            </div>
            <div class="form-floating mb-3 col-6 p-2 ">
                <input type="number" class="form-control" id="user_id" name="user_id" value="">
                <label for="user_id">Usuario:</label>
            </div>    
            <div class="mx-3 mt-3">
                <button class="btn btn-primary">Crear</button>
            </div>
        </form>
        <%
            
        %>   
    </main>    