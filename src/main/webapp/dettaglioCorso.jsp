<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="connessione.jsp" %>
<%
    String idCorso = request.getParameter("idCorso");
    if (idCorso == null) idCorso = "";
    idCorso = idCorso.trim();
    String username = (String) session.getAttribute("username");
    String messaggio = "";

    boolean idValido = !idCorso.isEmpty() && idCorso.length() <= 5;
    boolean corsoEsistente = idValido
            && funzioni.verificaEsistente("SELECT idCorso FROM corsi WHERE idCorso=" + funzioni.fc(idCorso));
    boolean iscritto = corsoEsistente && username != null && funzioni.verificaEsistente(
            "SELECT idIscrizione FROM iscrizioni WHERE idCorso=" + funzioni.fc(idCorso)
            + " AND username=" + funzioni.fc(username));

    if ("POST".equalsIgnoreCase(request.getMethod()) && "iscriviti".equals(request.getParameter("azione"))) {
        if (username == null) {
            messaggio = "Devi effettuare il login per iscriverti a un corso.";
        } else if (!corsoEsistente) {
            messaggio = "Il corso selezionato non è disponibile.";
        } else if (iscritto) {
            messaggio = "Sei già iscritto a questo corso.";
        } else {
            String[] campi = {"idIscrizione", "idCorso", "username"};
            String[] valori = {
                "",
                funzioni.fc(idCorso),
                funzioni.fc(username)
            };

            if (funzioni.update(campi, valori, "iscrizioni", true, true)) {
                messaggio = "Iscrizione effettuata correttamente.";
                iscritto = true;
            } else {
                messaggio = "Iscrizione non riuscita.";
            }
        }
    }

    ResultSet corso = null;
    boolean corsoDisponibile = false;
    if (corsoEsistente) {
        corso = funzioni.select(
                "SELECT idCorso, descrizione, giornoSettimana, ora, costo FROM corsi WHERE idCorso="
                + funzioni.fc(idCorso));
        corsoDisponibile = corso != null && corso.next();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dettaglio corso - Gym Manager</title>
</head>
<body>
    <h1>Dettaglio del corso</h1>
    <% if (!messaggio.isEmpty()) { %>
        <p><%= messaggio %></p>
    <% } %>
    <% if (idCorso.isEmpty()) { %>
        <p>Non è stato selezionato nessun corso.</p>
    <% } else if (!idValido) { %>
        <p>Il codice del corso non è valido.</p>
    <% } else if (!corsoEsistente) { %>
        <p>Il corso selezionato non esiste.</p>
    <% } else if (corso == null) { %>
        <p>Impossibile caricare il corso. Riprova più tardi.</p>
    <% } else if (!corsoDisponibile) { %>
        <p>Il corso selezionato non esiste.</p>
    <% } else { %>
        <table>
            <tr><th>Codice</th><td><%= corso.getString("idCorso") %></td></tr>
            <tr><th>Nome</th><td><%= corso.getString("descrizione") %></td></tr>
            <tr><th>Giorno</th><td><%= corso.getString("giornoSettimana") %></td></tr>
            <tr><th>Ora</th><td><%= corso.getString("ora") %></td></tr>
            <tr><th>Costo</th><td><%= corso.getString("costo") %> euro</td></tr>
        </table>
        <% if (username == null) { %>
            <p>Per iscriverti a questo corso devi <a href="index.jsp">effettuare il login</a>.</p>
        <% } else if (iscritto) { %>
            <p>Sei iscritto a questo corso.</p>
        <% } else { %>
            <form method="post" action="dettaglioCorso.jsp">
                <input type="hidden" name="idCorso" value="<%= idCorso %>">
                <button type="submit" name="azione" value="iscriviti">Iscriviti al corso</button>
            </form>
        <% } %>
    <% } %>
    <% if (corso != null) { funzioni.closeResultSet(corso); } %>
    <p><a href="corsi.jsp">Torna alla lista dei corsi</a></p>
    <p><a href="index.jsp">Torna alla pagina iniziale</a></p>
</body>
</html>
