<%-- 
    Document   : registro
    Created on : 23/12/2021, 17:02:44
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/vistas/partials/header.jsp" %>
    <!-- FORMULARIO DE REGISTRO -->
    <div class="row m-5 text-center">
        <h1 class="display-6">Registro de Usuario en Online Banking</h1>
    </div>
    <div class="container w-50 ">
        <form class="shadow p-5 mb-5 bg-body rounded" method="POST" action="/UserController/createUser" enctype="application/x-www-form-urlencoded">
        <!--
            <div class="d-flex justify-content-end mb-5">
                <a href="#" class="">
                    <img class="img-fluid" src="/img/logo_small.png" width="150" height="auto" alt="Logo Banco Republica">         
                </a>
            </div>              
            <div class="col-md-6">
              <label for="name" class="form-label">Nombre</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="Ingresa tu nombre" required>
            </div>
            <div class="col-md-6">
              <label for="lastname" class="form-label">Apellido</label>
              <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Ingresa tu apellido" required>
            </div>
            <div class="col-md-8">
              <label for="username" class="form-label">Usuario</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="username" name="username" placeholder="Ingresa un nombre de usuario" aria-describedby="inputGroupPrepend" required>
              </div>
            </div>
            <div class="col-md-8">
              <label for="username" class="form-label">Email</label>
              <div class="input-group has-validation">
                <input type="email" class="form-control" id="email" name="email" placeholder="Ingresa un correo" aria-describedby="inputGroupPrepend" required>
              </div>
            </div>
        <div class="col-md-3 align-self-center">
            <label for="gender" class="form-label">Género</label>
            <div class="d-flex">
                <div class="form-check pe-5">
                    <input class="form-check-input" type="radio" name="gender" id="gender" value="female" checked>
                    <label class="form-check-label" for="female">
                      F
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="gender" value="male">
                    <label class="form-check-label" for="male">
                     M
                    </label>
                </div>
            </div>
        </div>
        <div class="col-md-3">
          <label for="password" class="form-label">Contraseña</label>
          <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="col-md-3">
          <label for="repassword" class="form-label">Repita Contraseña</label>
          <input type="password" class="form-control" id="repassword" name="repassword" required>
        </div>
        <div class="col-12">
          <button class="btn btn-primary" type="submit">Registrarme</button>
        </div>
            
        -->
         
            <div class="d-flex justify-content-end mb-5">
                <a href="#" class="">
                    <img class="img-fluid" src="/img/logo_small.png" width="150" height="auto" alt="Logo Banco Republica">         
                </a>
            </div>            
            <div class="form-floating mb-3">
                <input type="text" class="form-control has-validation" id="username" name="username" placeholder="name@example.com" required>
                <label for="username" class="text-muted">Usuario</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control has-validation" id="password" name="password" placeholder="Password" required>
                <label for="password" class="text-muted">Password</label>
                <div id="userHelp" class="form-text text-truncate">La contraseña debe contener al menos 8 caractéres</div>
            </div>
        <div class="form-floating mb-3">
                <input type="password" class="form-control" id="repassword" name="repassword" placeholder="Repeat Password">
                <label for="repassword" class="text-muted">Repeat password</label>
                <div id="userHelp" class="form-text text-truncate">La contraseña debe ser identica a la anterior</div>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="name" name="name" placeholder="Jane" required>
                <label for="name" class="text-muted">First name</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Doe" required>
                <label for="lastname" class="text-muted">Last name</label>
            </div>
            <div class="form-floating mb-4">
                <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                <label for="email" class="text-muted">Email address</label>
            </div>
            <div class="col-md-3 align-self-center mb-3">
                <label class="form-label" for="gender">Género</label>
                <div class="d-flex">
                    <div class="form-check px-5">
                        <input class="form-check-input" type="radio" name="gender" id="gender" value="Female" checked>
                        <label class="form-check-label" for="Female">F</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="gender" value="Male">
                        <label class="form-check-label" for="Male">M</label>
                    </div>
                </div>    
            </div>


            <div class="col-auto">
                <button type="submit" class="btn btn-dark">Registrarme</button>
            </div>
        
        </form>
    </div>
