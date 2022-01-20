
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/vistas/partials/header.jsp" %>
    <!-- FORMULARIO DE REGISTRO -->
    <div class="row m-5 text-center">
        <h1 class="display-6 text-uppercase">Registro de Usuario en Online Banking</h1>
    </div>
    <div class="container w-50 ">
        <form class="shadow p-5 mb-5 bg-body rounded" method="POST" action="/UserController/createUser" enctype="application/x-www-form-urlencoded">         
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
            <div class=" mb-3">
                <label class="form-label" for="gender">Género</label>
                <div class="d-flex">
                    <div class="form-check px-4">
                        <input class="form-check-input" type="radio" name="gender" id="gender" value="Female" checked>
                        <label class="form-check-label" for="Female">Femenino</label>
                    </div>
                    <div class="form-check px-4">
                        <input class="form-check-input" type="radio" name="gender" id="gender" value="Male">
                        <label class="form-check-label" for="Male">Masculino</label>
                    </div>
                    <div class="form-check px-4">
                        <input class="form-check-input" type="radio" name="gender" id="gender_ep" value="NoBin">
                        <label class="form-check-label" for="NoBin">Otro</label>
                    </div>
                </div>    
            </div>
            <div class="col-auto mt-3">
                <button type="submit" class="btn btn-dark">Registrarme</button>
            </div>        
        </form>
    </div>
    
<%@include file="/vistas/partials/footer.jsp" %>