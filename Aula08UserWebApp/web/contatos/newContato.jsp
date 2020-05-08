<%-- 
    Document   : new
    Created on : 07/05/2020, 11:58:07
    Author     : guih_
--%>

<%@page import="br.gov.sp.fatec.users.Contato"%>
<%@page import="br.gov.sp.fatec.users.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    
    if(request.getParameter("add") != null){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        if(name.isEmpty()){
            error = "Nome inválido";
        }else if(email.isEmpty()){
            error = "Email inválido";
        }else if(telefone.isEmpty()){
            error = "Telefone inválida";
        }else{
                Contato contato = new Contato();
                contato.setNome(name);
                contato.setEmail(email);
                contato.setTelefone(telefone);
                Db.getContatos().add(contato);
                response.sendRedirect("listContato.jsp");
            }
        }
    
%>

<html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo - Contato Web App</title>
    </head>
    <body>
        <h1>Novo Contato Web App</h1>
        <h2><a href="listContato.jsp">Contatos</a></h2>
        <h3>Novo</h3>
      
        <%if(error!=null){%>
       <div style="color: red"><%= error%></div>
       <%}%>
       
        <form method="post">
            <label>Nome:</label><br />
            <input type="text" name="name" /><br />
            
            <label>E-mail:</label><br />
            <input type="text" name="email" /><br />
            
            <label>Telefone:</label><br />
            <input type="text" name="telefone" /><br />
           
            <br />
            <input type="submit" name="add" value="Adicionar"/><br />
            
        </form>
    </body>
</html>
