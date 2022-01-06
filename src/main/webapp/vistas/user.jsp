<%-- 
    Document   : user
    Created on : 27/12/2021, 15:26:06
    Author     : danie
--%>

<%@page import="database.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <% int numeroAleatorio = (int) (Math.random() * (0 - 10000000) + 10000000);
                out.println(numeroAleatorio + 1000000000);
            %>
        </h1>
        <%--        
        <% 


            boolean exists = (boolean) session.getAttribute("exists");
            if (exists){
        %>
            <h1>Accedi al sistema</h1>
        <% 
            } else{
        %>
            <h1>No accedi</h1>
        <% 
            }
        %>
        --%>
    </body>
</html>
