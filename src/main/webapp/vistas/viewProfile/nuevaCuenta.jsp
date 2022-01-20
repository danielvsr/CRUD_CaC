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
<%
  User usuario = (User) session.getAttribute("usuario");  
  out.println(" " + usuario.getLastName() + " " + usuario.getId());    
%>

<%--       

    <% int numeroAleatorio = (int) (Math.random() * (0 - 10000000) + 10000000);
                out.println(numeroAleatorio + 1000000000);
    %>
--%>
    <section>
        <div class="row m-5 text-center">
            <h1 class="display-6 text-uppercase">COMPLETE LOS DATOS PARA NUEVA CUENTA</h1>
        </div>    
    </section>
    <section class="container w-75">
        <form class="shadow p-5 mb-5 bg-body rounded" action="/AccountController/nuevaCuenta" method="POST" enctype="application/x-www-form-urlencoded">
            <div class="d-flex justify-content-end mb-5">
                <a href="#" class="">
                    <img class="img-fluid" src="/img/logo_small.png" width="150" height="auto" alt="Logo Banco Republica">         
                </a>
            </div>
            <div class="row">
                <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                    <select class="form-select" id="type" name="type" aria-label="Floating label select example">
                        <option selected>Seleccione tipo de cuenta</option>
                        <option value="$CA">Caja de Ahorro</option>
                        <option value="$CC">Cuenta Corriente</option>
                        <option value="u$s">Caja de Ahorro en Dólares</option>
                        <option value="$CA">Caja de Ahorro Electrónica</option>
                    </select>
                   <label for="type">Elija el tipo de cuenta</label>
                </div>
                <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                    <input type="number" class="form-control" id="account_number" name="account_number"
                           placeholder="account_number" value="account_number">
                    <label for="account_number">N° Cuenta:</label>
                </div>

                <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                    <select class="form-select" id="currency" name="currency" aria-label="Floating label select example">
                        <option selected>Seleccione tipo de cuenta</option>
                        <option value="ARG">PESOS</option>
                        <option value="USD">DOLARES</option>
                        <option value="BIT">BITCOINS</option>
                    </select>
                   <label for="currency">Elija el tipo de moneda</label>
                </div>            
                <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                    <input type="number" class="form-control" id="balance" name="balance">
                    <label for="balance">Dinero a ingresar:</label>
                </div>
                <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                    <input type="number" class="form-control" id="user_id" name="user_id" value="">
                    <label for="user_id">N° de cliente</label>
                    <div id="userHelp" class="form-text text-truncate">Su número de cliente es: <% out.println(" " + usuario.getId()); %></div>
                </div>
            </div>
            <div class="d-grid justify-content-end">
                <button class="btn btn-dark">Confirmar</button>
            </div>
        </form>
    </section>
        <%
            
        %>   

<%@include file="/vistas/partials/footer.jsp" %>