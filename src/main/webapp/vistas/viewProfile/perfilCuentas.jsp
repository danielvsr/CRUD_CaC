<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="model.Account"%>
<%@page import="database.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="en_US"/>
<%@include file="/vistas/partials/header.jsp" %>
    <div>
        <h1 class="display-4 text-uppercase text-center m-5">BIENVENIDO/A 
        <%
            User usuario = (User) session.getAttribute("usuario");
            out.println(" " + usuario.getLastName() + " " + usuario.getName());
             
        %>
        </h1>
        <section class="container mb-5">
            <div class="row">
                <div class="col-lg-9 col-md-9 col-sm-12 col-xm-12 mb-3 border rounded shadow" >
                    <h1 class="display-6 text-center text-uppercase mt-2">Mis cuentas</h1>
                    <div class="rounded mx-1 my-1 p-3">
                        <table class="table table-success table-hover">
                            <thead>
                                <tr>
                                    <th class="text-center align-middle d-none" scope="col">#</th>
                                    <th class="text-center align-middle" scope="col"></th>
                                    <th class="text-center align-middle" scope="col">N° de cuenta</th>
                                    <th class="text-center align-middle" scope="col">Saldo</th>
                                    <th class="text-center align-middle" scope="col">Moneda</th>
                                    <th class="text-center align-middle" scope="col fs-6">Eliminar</th>                        
                                </tr>
                                <tbody>

                                    <%
                                    List<Account> accounts = (List<Account>) session.getAttribute("accounts");
                                    AccountDAO accountDB = new AccountDAO();
                                    accounts = accountDB.getAccounts(usuario.getId());
                                    session.setAttribute("cuenta", accounts);


                                    for (int i=0 ; i < accounts.size(); i++){

                                    String id = Integer.toString(accounts.get(i).getId()); 
                                    int cantidad = i;
                                    NumberFormat formatoImporte = NumberFormat.getCurrencyInstance();

                                    %>    
                                    <tr>
                                        <td class="text-center d-none" name="id"><%= id %></td>
                                        <td class="text-center"><% out.println(cantidad = (cantidad+1)); %></td>
                                        <td class="text-center" name="accountNumber"><% out.println(accounts.get(i).getType()+ "-" + accounts.get(i).getAccountNumber()); %></td>
                                        <td class="text-center" name="accountBalance" ><% out.println(formatoImporte.format(accounts.get(i).getBalance())); %></td>
                                        <td class="text-center" name="accountCurrency"><% out.println(accounts.get(i).getCurrency()); %></td>
                                        <td>
                                            <form action="/DeleteAccountController/delete" method="POST">
                                                <div class="text-center align-middle">
                                                    <input type="hidden" name="idAccount" value="<%= id %>">
                                                    <button class="btn btn btn-sm text-danger" type="submit" >
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                        </svg>
                                                    </button>    
                                                </div>
                                            </form>    
                                        </td>
                                    </tr>
                                </tbody>
                                <%
                                    }
                                %>
                            </thead>
                        </table>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xm-12">
                    <div class="card text-center bg-success bg-gradient text-white shadow">
                        <div class="card-body">
                            <h5 class="h5 fw-light text-uppercase">Cantidad de cuentas</h5>
                            <h4 class="display-4">
                                <i class="bi bi-wallet2"></i><% out.println(" " + accounts.size()); %>
                            </h4>                   
                        </div>
                    </div>       
                </div>                           
            </div>
            <div class="mx-3 mt-3">
                <a class="btn btn-dark" href="/view/nuevaCuenta" role="button">Nueva Cuenta</a>
            </div>    
        </section>
    </div>

<%@include file="/vistas/partials/footer.jsp" %>