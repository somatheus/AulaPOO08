<%-- 
    Document   : new
    Created on : 07/05/2020, 11:58:07
    Author     : guih_
--%>

<%@page import="br.gov.sp.fatec.users.Db"%>
<%@page import="br.gov.sp.fatec.users.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    if(request.getParameter("add") != null){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String senha1 = request.getParameter("senha1");
        String senha2 = request.getParameter("senha2");
        if(name.isEmpty()){
            error = "Nome inválido";
        }else if(email.isEmpty()){
            error = "Email inválido";
        }else if(senha1.isEmpty()){
            error = "Senha inválida";
        }else{
            if(senha1.equals(senha2)){
                User user = new User();
                user.setName(name);
                user.setEmail(email);
                user.setSenha(senha1);
                Db.getUsers().add(user);
                response.sendRedirect("list.jsp");
            }else{
                error = "Senhas diferentes";
            }
        }
    }  
%>
<html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo - Users Web App</title>
    </head>
    <body>
        <h1>Novo User Web App</h1>
        <h2><a href="list.jsp">Usuários</a></h2>
        <h3>Novo</h3>
       <%if(error!=null){%>
       <div style="color: red"><%= error%></div>
       <%}%>
        <form method="post">
            <label>Nome de usuário:</label><br />
            <input type="text" name="name" /><br />
            <label>E-mail:</label><br />
            <input type="text" name="email" /><br />
            
            <fieldset>
                <legend>Senha</legend>
                <label>Senha:</label><br />
                <input type="password" name="senha1" /><br />
                <label>Confirmar senha:</label><br />
                <input type="password" name="senha2" /><br />
            </fieldset>
            <br />
            <input type="submit" name="add" value="Adicionar"/><br />
            
        </form>
    </body>
</html>
