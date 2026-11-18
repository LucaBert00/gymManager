<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="connessione.jsp" %>
<%
    ResultSet corsi = funzioni.select(
            "SELECT idCorso, descrizione, giornoSettimana, ora, costo FROM corsi ORDER BY descrizione");
    // next() verifica la presenza di righe e posiziona il cursore sul primo corso.
    boolean corsiDisponibili = corsi != null && corsi.next();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Corsi - Gym Manager</title>
</head>
<body>
    <h1>Corsi disponibili</h1>
    <% if (corsi == null) { %>
        <p>Impossibile caricare i corsi. Riprova più tardi.</p>
    <% } else if (!corsiDisponibili) { %>
        <p>Non ci sono corsi disponibili.</p>
    <% } else { %>
        <table>
            <thead>
                <tr>
                    <th>Codice</th>
                    <th>Nome</th>
                    <th>Giorno</th>
                    <th>Ora</th>
                    <th>Costo</th>
                    <th>Dettagli</th>
                </tr>
            </thead>
            <tbody>
                <% do { %>
                    <tr>
                        <td><%= corsi.getString("idCorso") %></td>
                        <td><%= corsi.getString("descrizione") %></td>
                        <td><%= corsi.getString("giornoSettimana") %></td>
                        <td><%= corsi.getString("ora") %></td>
                        <td><%= corsi.getString("costo") %> euro</td>
                        <td><a href="dettaglioCorso.jsp?idCorso=<%= corsi.getString("idCorso") %>">Dettagli</a></td>
                    </tr>
                <% } while (corsi.next()); %>
            </tbody>
        </table>
    <% } %>
    <% if (corsi != null) { funzioni.closeResultSet(corsi); } %>
    <p><a href="index.jsp">Torna alla pagina iniziale</a></p>
</body>
</html>
