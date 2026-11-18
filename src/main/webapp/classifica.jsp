<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="connessione.jsp" %>
<%
    ResultSet classifica = funzioni.select(
            "SELECT corsi.idCorso, corsi.descrizione, COUNT(iscrizioni.idIscrizione) AS iscritti "
            + "FROM corsi LEFT JOIN iscrizioni ON corsi.idCorso = iscrizioni.idCorso "
            + "GROUP BY corsi.idCorso, corsi.descrizione "
            + "ORDER BY iscritti DESC, corsi.idCorso");
    // next() verifica la presenza di righe e posiziona il cursore sul primo corso.
    boolean classificaDisponibile = classifica != null && classifica.next();
    int posizione = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Classifica corsi - Gym Manager</title>
</head>
<body>
    <h1>Classifica dei corsi per numero di iscritti</h1>
    <% if (classifica == null) { %>
        <p>Impossibile caricare la classifica. Riprova più tardi.</p>
    <% } else if (!classificaDisponibile) { %>
        <p>Non ci sono corsi registrati.</p>
    <% } else { %>
        <table>
            <thead>
                <tr>
                    <th>Posizione</th>
                    <th>Codice</th>
                    <th>Nome</th>
                    <th>Iscritti</th>
                </tr>
            </thead>
            <tbody>
                <% do {
                    posizione++;
                %>
                    <tr>
                        <td><%= posizione %></td>
                        <td><%= classifica.getString("idCorso") %></td>
                        <td><%= classifica.getString("descrizione") %></td>
                        <td><%= classifica.getInt("iscritti") %></td>
                    </tr>
                <% } while (classifica.next()); %>
            </tbody>
        </table>
    <% } %>
    <% if (classifica != null) { funzioni.closeResultSet(classifica); } %>
    <p><a href="index.jsp">Torna alla pagina iniziale</a></p>
</body>
</html>
