<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.UserDAO"%>
<%@page import="database.AccountDAO"%>
<%@include file="/vistas/partials/header.jsp" %>
<section class="container mt-3 mb-5">
    <div class="m-5">
        <h1 class="display-6 text-center text-uppercase">Ups! Ha ocurrido un error!</h1>
    </div>
    <div class="d-flex justify-content-center mt-5">
        <img class="img-fluid " src="../../img/tildeRojo.png" alt="errorMensaje" >
    </div>
    <div class="m-3">
        <h6 class="text-muted text-center text-uppercase">Inténtelo nuevamente</h6>
    </div>
</section>

<%@include file="/vistas/partials/footer.jsp" %>
