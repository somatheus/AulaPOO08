<%-- 
    Document   : list
    Created on : 07/05/2020, 11:15:39
    Author     : guih_
--%>

<%@page import="br.gov.sp.fatec.users.Contato"%>
<%@page import="br.gov.sp.fatec.users.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista - Contatos Web App</title>
    </head>
    <body>
        <h1>Contatos Web App</h1>
        <h2><a href="../index.jsp">Inicio</a></h2>
        <h3>Lista</h3>
        <h4><a href="newContato.jsp">Adicionar Novo Contato</a></h4>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>E-Mail</th>
                <th>Telefone</th>
                <th>Comandos</th>
            </tr>
            <%for(Contato contato: Db.getContatos()){%>
            <tr>
                <td><%=contato.getNome()%></td>
                <td><%=contato.getEmail()%></td>
                <td><%=contato.getTelefone()%></td>
                <td>
                    <% int i = Db.getContatos().indexOf(contato);%>
                    <a href="editContato.jsp?i=<%=i%>">Alterar</a>
                </td>
                <td><a href="deleteContato.jsp?i=<%=i%>">Excluir</a></td>
            </tr>
            <%}%>
        </table>
</html>
