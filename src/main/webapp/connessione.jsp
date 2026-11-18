<%@ page import="com.example.gymmanager.FunzioniDB" %>
<%
    FunzioniDB funzioni = (FunzioniDB) session.getAttribute("funzioni");
    if (funzioni == null) {
        funzioni = new FunzioniDB("jdbc:mysql://localhost/palestra", "root", "");
        session.setAttribute("funzioni", funzioni);
    }
%>
