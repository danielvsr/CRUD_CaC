<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.UserDAO"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/vistas/partials/header.jsp" %>
<%
  User usuario = (User) session.getAttribute("usuario");  
  out.println(" " + usuario.getLastName() + " " + usuario.getUsername());  
%>    
<section>
    <div class="row m-5 text-center">
        <h1 class="display-6 text-uppercase">Edite sus Datos Personales</h1>
    </div>    
</section>
<section class="container w-75">
    
    <form class="shadow p-5 mb-5 bg-body rounded" method="POST" action="/UserController/editUser" enctype="application/x-www-form-urlencoded">
        <div class="d-flex justify-content-end mb-5">
            <a href="#" class="">
                <img class="img-fluid" src="/img/logo_small.png" width="150" height="auto" alt="Logo Banco Republica">         
            </a>
        </div>
        <div class="row">
            <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                <input type="text" class="form-control" id="name_ep" name="name_ep" placeholder="Jane"" required>
                <label for="name_ep" class="text-muted">First name</label>
            </div>
            <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                <input type="text" class="form-control" id="lastname_ep" name="lastname_ep" placeholder="Doe" required>
                <label for="lastname_ep" class="text-muted">Last name</label>
            </div>
            <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                <input type="email" class="form-control" id="email_ep" name="email_ep" placeholder="name@example.com" required>
                <label for="email_ep" class="text-muted">Email address</label>
            </div>
  
            <div class="col-md-3 align-self-center mb-3">
                <label class="form-label" for="gender_ep">Género</label>
                <div class="d-flex">
                    <div class="form-check px-4">
                        <input class="form-check-input" type="radio" name="gender_ep" id="gender_ep" value="Female" checked>
                        <label class="form-check-label" for="Female">Femenino</label>
                    </div>
                    <div class="form-check px-4">
                        <input class="form-check-input" type="radio" name="gender_ep" id="gender_ep" value="Male">
                        <label class="form-check-label" for="Male">Masculino</label>
                    </div>
                    <div class="form-check px-4">
                        <input class="form-check-input" type="radio" name="gender_ep" id="gender_ep" value="NoBin">
                        <label class="form-check-label" for="NoBin">Otro</label>
                    </div>
                </div>    
            </div>            
            <div class="form-floating mb-3 p-2 col-lg-6 col-md-6 col-sm-12 col-xm-12">
                <input type="text" class="form-control" id="nameUser_ep" name="nameUser_ep" placeholder="nameUser"  required>
                <label for="nameUser_ep" class="text-muted" >Usuario</label>
                <div id="userHelp" class="form-text text-truncate">Su nombre de usuario es: <% out.println(" " + usuario.getUsername()); %></div>
            </div>  
        </div>
        <div class="col-auto mt-3">
            <button type="submit" class="btn btn-dark">Confirmar</button>
        </div>
    </form>
        
</section>
            
<%@include file="/vistas/partials/footer.jsp" %>