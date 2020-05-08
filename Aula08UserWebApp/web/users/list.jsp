<%-- 
    Document   : list
    Created on : 07/05/2020, 11:15:39
    Author     : guih_
--%>

<%@page import="br.gov.sp.fatec.users.User"%>
<%@page import="br.gov.sp.fatec.users.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista - User Web App</title>
    </head>
    <body>
        <h1>User Web App</h1>
        <h2><a href="../index.jsp">Inicio</a></h2>
        <h3>Lista</h3>
        <h4><a href="new.jsp">Adicionar Novo User</a></h4>
        <table border="1">
            <tr>
                <th>Nome do usuário</th>
                <th>E-Mail</th>
                <th>Comandos</th>
            </tr>
            <%for(User user: Db.getUsers()){%>
            <tr>
                <td><%=user.getName()%></td>
                <td><%=user.getEmail()%></td>
                <td>
                    <% int i = Db.getUsers().indexOf(user);%>
                    <a href="edit.jsp?i=<%=i%>">Alterar</a>
                </td>
                <td><a href="delete.jsp?i=<%=i%>">Excluir</a></td>
            </tr>
            <%}%>
        </table>
</html>
