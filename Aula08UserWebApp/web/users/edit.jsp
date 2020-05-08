<%-- 
    Document   : edit
    Created on : 07/05/2020, 13:56:45
    Author     : guih_
--%>

<%@page import="br.gov.sp.fatec.users.User"%>
<%@page import="br.gov.sp.fatec.users.Db"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    User user = null;
    int i = -1;
    
    if(request.getParameter("i")!= null){
        i = Integer.parseInt(request.getParameter("i"));
        user = Db.getUsers().get(i);
        
        if(user == null){
            error = "Índice inválido";
        }else{
        
          if(request.getParameter("edit") != null){
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
                        User editedUser = new User();
                        editedUser.setName(name);
                        editedUser.setEmail(email);
                        editedUser.setSenha(senha1);
                        Db.getUsers().set(i, editedUser);
                        response.sendRedirect("list.jsp");
                    }else{
                        error = "Senhas diferentes";
                    }
                }
            }  
        }
    }
%>

<html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar - Users Web App</title>
    </head>
    <body>
        <h1>Editar User Web App</h1>
        <h2><a href="list.jsp">Usuários</a></h2>
        <h3>Editar</h3>
       <%if(error!=null){%>
       
             <div style="color: red"><%=error%></div>
             
       <%}else{%>
       
        <form method="post">
            
            <input type="hidden" name="i" value="<%=i %>">
            
            <label>Nome de usuário:</label> <br/>
            <input type="text" name="name" value="<%=user.getName()%>"/> <br/>
           
            <label>E-mail:</label><br />
            <input type="text" name="email" value="<%=user.getEmail()%>"/> <br />
            
            <fieldset>
                <legend>Senha</legend>
                
                <label>Senha:</label><br />
                <input type="password" name="senha1" value="<%=user.getSenha()%>" /><br />
                
                <label>Confirmar senha:</label><br />
                <input type="password" name="senha2" value="<%=user.getSenha()%>"/><br />
            </fieldset>
            <br />
            <input type="submit" name="edit" value="Alterar"/><br />
            
        </form>
       <%}%>
      
    </body>
</html>
