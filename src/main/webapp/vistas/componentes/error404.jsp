<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.UserDAO"%>
<%@page import="database.AccountDAO"%>
<%@include file="/vistas/partials/header.jsp" %>
<section class="container mt-3 mb-5">
    <div class="m-5">
        <h1 class="display-6 text-center text-uppercase">Ups! Página no encontrada!</h1>
    </div>
    <div class="d-flex justify-content-center mt-5">
        <img class="img-fluid " src="../../img/error404.png" alt="error404" >
    </div>
    <%
        if(isLogged){
            User usuario = (User) session.getAttribute("usuario");
            Account account = (Account) session.getAttribute("accounts");
    %>
    <div class="m-3">
        <h6 class="text-muted text-center text-uppercase">Próximamente se habilitará esta sección. Favor de dirigirse hacia su perfil.</h6>
    </div>
    <%
        } else {
    %>   
    <div class="m-3">
        <h6 class="text-muted text-center text-uppercase">Próximamente se habilitará esta sección. Favor de dirigirse hacia la página central.</h6>
    </div>
    <%
        }
    %>    
</section>

<%@include file="/vistas/partials/footer.jsp" %>
