<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="connessione.jsp" %>
<%
    if (!"POST".equalsIgnoreCase(request.getMethod())) {
        response.sendRedirect("index.jsp");
        return;
    }

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if (username != null) username = username.trim();

    boolean credenzialiValide = username != null && !username.isEmpty() && username.length() <= 50
            && password != null && !password.isEmpty() && password.length() <= 50;

    ResultSet cliente = null;
    boolean autenticato = false;
    if (credenzialiValide) {
        cliente = funzioni.select("SELECT nome FROM clienti WHERE username="
                + funzioni.fc(username) + " AND password=" + funzioni.fc(password));
        autenticato = cliente != null && cliente.next();
    }

    if (autenticato) {
        session.setAttribute("username", username);
        session.setAttribute("nome", cliente.getString("nome"));
        response.sendRedirect("index.jsp");
    } else {
        session.setAttribute("login", "falso");
        response.sendRedirect("index.jsp");
    }
    if (cliente != null) funzioni.closeResultSet(cliente);
%>
