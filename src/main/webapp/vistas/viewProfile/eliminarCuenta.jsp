<%@page import="model.Account"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.UserDAO"%>
<%@page import="database.AccountDAO"%>
<%@include file="/vistas/partials/header.jsp" %>
<%
    /*
User usuario = (User) session.getAttribute("usuario");

int id_cuenta = Integer.parseInt(request.getParameter("id"));
    Account account = (Account) session.getAttribute("accounts");
*/

%>
<div class="container">
    <h1>Seguro quiere eliminar el registro</h1>
    <form class="shadow p-5 mb-5 bg-body rounded" action="/AccountController/delete">
        <div class="d-grid justify-content-end">
            <button class="btn btn-dark">Confirmar</button>
        </div>
    </form>
</div>

<%@include file="/vistas/partials/footer.jsp" %>