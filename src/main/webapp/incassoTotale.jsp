<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="connessione.jsp" %>
<%
    String username = (String) session.getAttribute("username");
    boolean admin = username != null && username.equals("admin");

    ResultSet incasso = null;
    boolean incassoDisponibile = false;
    if (admin) {
        incasso = funzioni.select(
                "SELECT SUM(corsi.costo) AS totale, COUNT(iscrizioni.idIscrizione) AS iscrizioni "
                + "FROM iscrizioni INNER JOIN corsi ON iscrizioni.idCorso = corsi.idCorso");
        incassoDisponibile = incasso != null && incasso.next();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Incasso totale - Gym Manager</title>
</head>
<body>
    <h1>Incasso totale della palestra</h1>
    <% if (!admin) { %>
        <p>Questa pagina è riservata all'utente admin.</p>
    <% } else if (incasso == null) { %>
        <p>Impossibile calcolare l'incasso. Riprova più tardi.</p>
    <% } else if (!incassoDisponibile) { %>
        <p>Non ci sono iscrizioni registrate.</p>
    <% } else { %>
        <p>Totale incassato dalle iscrizioni ai corsi: <strong><%= incasso.getInt("totale") %> euro</strong></p>
        <p>Numero di iscrizioni registrate: <%= incasso.getInt("iscrizioni") %></p>
    <% } %>
    <% if (incasso != null) { funzioni.closeResultSet(incasso); } %>
    <p><a href="index.jsp">Torna alla pagina iniziale</a></p>
</body>
</html>
