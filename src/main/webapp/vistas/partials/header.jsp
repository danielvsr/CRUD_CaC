
<%@page import="model.Account"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
    
    <!-- CSS -->
    <link rel="stylesheet" href="/css/style.css">
    
    <title>Banco República</title>
    <link rel="shottcut icon" href="/img/logo_small_icon_only.png">
</head>
<body style="display: grid; grid-template-rows: auto 1fr auto; min-height: 100vh; overflow-x:hidden;">
    <nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(var(--bg-primary), #3b5762) ;">
        <div class="container-fluid" >
            <!-- <a class="navbar-brand" href="#">BANCO NACIONAL DE LA REPUBLICA</a>
            -->
            <a href="/index.jsp" class="navbar-brand text-white" style="margin-left: 3rem;">
                <img src="/img/logo_white_large.png" width="170" height="auto" alt="Logo Codo a Codo">         
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                <% 
                    if(session.isNew()){
                        session.setAttribute("isLogin", false);
                    }
                    boolean isLogged = (boolean) session.getAttribute("isLogin");
                        if(isLogged){
                        User usuario = (User) session.getAttribute("usuario");
                        Account account = (Account) session.getAttribute("accounts");
                %>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link mx-2" aria-current="page" href="/view/perfilCuenta">Mis Cuentas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-2" aria-current="page" href="/view/404">Transferencias</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-2" aria-current="page" href="/view/nuevaCuenta">Solicitar Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-2" aria-current="page" href="/view/perfil">Mi Perfíl</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-2" aria-current="page" href="/UserController/logout">Cerrar Sesión</a>
                    </li>
                </ul>
                <%
                    } else {
                %>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link mx-2" aria-current="page" href="/#institucional">Institucional</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-2" aria-current="page" href="/#productos">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-2" aria-current="page" href="/view/register">Hacete cliente</a>
                    </li>
                    <li class="nav-item">
                        <a class="cabecera btn btn-outline-light mx-sm-0 mx-md-0 mx-lg-5" aria-current="page" href="/vistas/login.jsp" role="button">Home Banking</a>
                    </li>
                </ul>    
                <% 
                    }
                %>    
            </div>
        </div>
    </nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>
