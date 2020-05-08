<%-- 
    Document   : edit
    Created on : 07/05/2020, 13:56:45
    Author     : guih_
--%>

<%@page import="br.gov.sp.fatec.users.Contato"%>
<%@page import="br.gov.sp.fatec.users.Db"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    Contato contato = null;
    int i = -1;
     if(request.getParameter("i")!= null){
        i = Integer.parseInt(request.getParameter("i"));
        contato = Db.getContatos().get(i);
        if(contato == null){
            error = "Índice inválido!";
        }else{
            if(request.getParameter("edit")!=null){
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
                        Contato editedContato = new Contato();
                        editedContato.setNome(name);
                        editedContato.setEmail(email);
                        editedContato.setTelefone(telefone);
                        Db.getContatos().set(i,editedContato);
                        response.sendRedirect("listContato.jsp");
                    
                }
            }
        }
    }else{
        error = "Índice inválido!";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar - Contato Web App</title>
    </head>
    <body>
        <h1>Contato Web App</h1>
        <h3><a href="../index.jsp">Início</a></h3>
        <h2><a href="listContato.jsp">Contatos</a></h2>
        <h3>Editar</h3>
        
        <%if(error!=null){%>
        <div style="color:red"><%=error%></div>
        <%}else{%>
        <br/>
        <form method="post">
            <input type="hidden" name="i" value="<%=i%>"/>
            Nome:<br/>
            <input type="text" name="name" value="<%=contato.getNome()%>"/><br/>
            Email: <br/>
            <input type="text" name="email" value="<%=contato.getEmail()%>"/><br/>
            
            Telefone: <br/>
            <input type="text" name="telefone" value="<%=contato.getTelefone()%>"/><br/>
            
            <input type="submit" name="edit" value="Alterar"><br/>
        </form>
        <%}%>
    </body>
</html>
