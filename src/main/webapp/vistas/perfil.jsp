<%-- 
    Document   : perfil
    Created on : 23/12/2021, 17:02:33
    Author     : danie
--%>


<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.UserDAO"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
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
            <div class="col-lg-12 col-md-12 col-sm-12 col-xm-12 border rounded">
                <h1 class="display-6 text-uppercase text-center mt-2">MIS DATOS</h1>        
                <div class="rounded mx-1 my-1 p-3">
                    <table class="table table-success table-hover  ">
                      <thead>
                        <tr>
                          <th class="text-center align-middle" scope="col">NOMBRE</th>
                          <th class="text-center align-middle" scope="col">APELLIDO</th>
                          <th class="text-center align-middle" scope="col">CORREO ELECTRONICO</th>
                          <th class="text-center align-middle" scope="col">NOMBRE DE USRUARIO</th>
                          <th class="text-center align-middle" scope="col fs-6">EDITAR DATOS</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="text-uppercase text-center"><% out.println(usuario.getName()); %></td>
                          <td class="text-uppercase text-center"><% out.println(usuario.getLastName()); %></td>
                          <td class="text-uppercase text-center"><% out.println(usuario.getEmail()); %></td>
                          <td class="text-uppercase text-center"><% out.println(usuario.getUsername()); %></td>
                          <td class="align-content-center">
                            <div class="text-center align-middle">
                                <a class="text-success" href="/view/editarP" >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                    </svg>
                                </a>
                            </div>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                </div>
            </div>          
        </section>
    </div> 

<%@include file="/vistas/partials/footer.jsp" %>