<%-- 
    Document   : delete
    Created on : 08/05/2020, 19:14:54
    Author     : guih_
--%>
<%@page import="br.gov.sp.fatec.users.Db"%>
<%@page import="br.gov.sp.fatec.users.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    User user = null;
    int i = -1;
    if(request.getParameter("i") != null){
        i = Integer.parseInt(request.getParameter("i"));
        user = Db.getUsers().get(i);
        if(user == null){
            error = "Índice inválido!";
        }else{
            if(request.getParameter("delete")!=null){      
                Db.getUsers().remove(i);
                response.sendRedirect("list.jsp");
            }
        }
    }else{
        error = "Índice inválido!";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir - UserWebApp</title>
    </head>
    <body>
        <h1>User Web App</h1>
        <h3><a href="../index.jsp">Início</a></h3>
        <h3><a href="list.jsp">Usuário</a></h3>
        <h3>Excluir</h3>
        <%if(error!=null){%>
        <div style="color:red"><%=error%></div>
        <%}else{%>
        <br/>
        <form method="post">
            <input type="hidden" name="i" value="<%=i%>"/>
            Nome do usuário:<br/>
            <b><%=user.getName()%></b><br/>
            Email: <br/>
            <b><%=user.getEmail()%>"</b><br/>
            <br/>
            <input type="submit" name="delete" value="Excluir"><br/>
        </form>
        <%}%>
    </body>
</html>
