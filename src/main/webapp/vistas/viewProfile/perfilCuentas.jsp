<%@page import="java.sql.Statement"%>
<%@page import="config.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="model.Account"%>
<%@page import="database.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/vistas/partials/header.jsp" %>
    <div>
        <h1 class="display-4 text-uppercase text-center m-5">BIENVENIDO/A 
        <%
            User usuario = (User) session.getAttribute("usuario");
            out.println(" " + usuario.getLastName() + " " + usuario.getName());
        %>
        </h1>
        <section class="container">
            <div class="col-md-12 col-sm-12 col-xm-12 border rounded" >
                <h1 class="display-6 text-center text-uppercase mt-2">Mis cuentas</h1>
                <div class="rounded mx-1 my-1 p-3">
                    <table class="table table-success table-hover">
                        <thead>
                            <tr>
                                <th class="text-center align-middle" scope="col">#</th>
                                <th class="text-center align-middle" scope="col">N° cuenta</th>
                                <th class="text-center align-middle" scope="col">Tipo de cuenta</th>
                                <th class="text-center align-middle" scope="col">Saldo</th>
                                <th class="text-center align-middle" scope="col">Moneda</th>
                                <th class="text-center align-middle" scope="col fs-6">Eliminar</th>                        
                            </tr>
                            <tbody>
                                <%
                                List<Account> accounts = (List<Account>) session.getAttribute("accounts");
                                AccountDAO accountDB = new AccountDAO();
                                accounts = accountDB.getAccounts(usuario.getId());
                                

                                for (int i=0 ; i < accounts.size(); i++){
                                   
                                    /*int del = accounts.get(i).getAccountNumber();*/
                                    
                                   /*String delete ="DeleteAccountController?accion=eliminar&id=" + accounts.get(i).getId() ;*/
                                %>    
                                <tr>
                                    <td class="text-center"><% out.println(accounts.get(i).getId()); %></td>
                                    <td class="text-center"><% out.println(accounts.get(i).getAccountNumber()); %></td>
                                    <td class="text-center"><% out.println(accounts.get(i).getType()); %></td>
                                    <td class="text-center"><% out.println(accounts.get(i).getBalance()); %></td>
                                    <td class="text-center"><% out.println(accounts.get(i).getCurrency()); %></td>
                                    <%--                                
                                    <td class="align-content-center">
                                        <div class="text-center align-middle">
                                            <a class="text-success" href="" >
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                    <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                                </svg>
                                            </a>
                                        </div>
                                    </td>
                                    --%>
                                    <td>
                                        <div class="text-center align-middle">
                                            <%--
                                            <button class="btn btn btn-sm text-danger" type="button" class="" data-bs-toggle="modal" data-bs-target="#modalDelete" data-bs-numeroId <%=accounts.get(i).getId()%>>
                                            --%>
                                            <a class="text-danger" href="/view/eliminar" >
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                </svg>
                                            </a>
                                        </div>
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
            <div class="mx-3 mt-3">
                <a class="btn btn-dark" href="/view/nuevaCuenta" role="button">Nueva Cuenta</a>
            </div>    
        </section>
    </div>
    <%--                    
    <section>
        

        
        <div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #DC3545; color: white">
                        <h5 class="modal-title text-center text-uppercase" id="modalLabel">Usted va a eliminar la siguiente cuenta</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="/AccountController/eliminarCuenta" class="borrar" id="borrar">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="numeroCuenta" class="col-form-label" style="display: inline;">Número de cuenta:</label>
                                <input type="text" class="form-control" id="numeroCuenta" name="numeroCuenta" style="display: inline-block" disabled/> <!--readonly-->
                            </div>
                            <div class="mb-3">
                                <label for="messageTextCD" class="col-form-label"></label>
                                <input type="text" class="form-control-plaintext" id="messageTextCD" style="text-align: center" disabled>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backspace" viewBox="0 0 16 16">
                                    <path d="M5.83 5.146a.5.5 0 0 0 0 .708L7.975 8l-2.147 2.146a.5.5 0 0 0 .707.708l2.147-2.147 2.146 2.147a.5.5 0 0 0 .707-.708L9.39 8l2.146-2.146a.5.5 0 0 0-.707-.708L8.683 7.293 6.536 5.146a.5.5 0 0 0-.707 0z"/>
                                    <path d="M13.683 1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-7.08a2 2 0 0 1-1.519-.698L.241 8.65a1 1 0 0 1 0-1.302L5.084 1.7A2 2 0 0 1 6.603 1h7.08zm-7.08 1a1 1 0 0 0-.76.35L1 8l4.844 5.65a1 1 0 0 0 .759.35h7.08a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1h-7.08z"/>
                                </svg>
                                <input type="hidden" class="form-control" id="invoiceNumCD" name="invoiceNumCD" style="display: inline-block"/>
                            </button>

                            <button type="submit" class="btn btn-danger">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                </svg>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>                            
    --%>                     
<%@include file="/vistas/partials/footer.jsp" %>