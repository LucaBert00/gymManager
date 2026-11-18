<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="connessione.jsp" %>
<%
    String usernameAdmin = (String) session.getAttribute("username");
    boolean admin = usernameAdmin != null && usernameAdmin.equals("admin");
    String utente = request.getParameter("username");
    if (utente == null) utente = "";
    utente = utente.trim();

    boolean ricercaRichiesta = "POST".equalsIgnoreCase(request.getMethod());
    String messaggio = "";
    String nomeCliente = "";
    ResultSet corsi = null;
    boolean corsiDisponibili = false;

    if (admin && ricercaRichiesta) {
        if (utente.isEmpty() || utente.length() > 50) {
            messaggio = "Inserisci uno username valido.";
        } else {
            ResultSet cliente = funzioni.select(
                    "SELECT nome, cognome FROM clienti WHERE username=" + funzioni.fc(utente));
            if (cliente == null) {
                messaggio = "Impossibile verificare il cliente. Riprova più tardi.";
            } else if (cliente.next()) {
                nomeCliente = cliente.getString("nome") + " " + cliente.getString("cognome");
                corsi = funzioni.select(
                        "SELECT corsi.idCorso, corsi.descrizione, corsi.giornoSettimana, corsi.ora, corsi.costo "
                        + "FROM iscrizioni INNER JOIN corsi ON iscrizioni.idCorso = corsi.idCorso "
                        + "WHERE iscrizioni.username=" + funzioni.fc(utente)
                        + " ORDER BY corsi.descrizione");
                // next() verifica la presenza di righe e posiziona il cursore sul primo corso.
                corsiDisponibili = corsi != null && corsi.next();
            } else {
                messaggio = "Il cliente indicato non esiste.";
            }
            if (cliente != null) funzioni.closeResultSet(cliente);
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Corsi di un cliente - Gym Manager</title>
</head>
<body>
    <h1>Visualizza i corsi di un cliente</h1>
    <% if (!admin) { %>
        <p>Questa pagina è riservata all'utente admin.</p>
    <% } else { %>
        <% if (!messaggio.isEmpty()) { %>
            <p><%= messaggio %></p>
        <% } %>
        <form method="post" action="corsiCliente.jsp">
            <p>
                <label for="username">Username del cliente:</label>
                <input type="text" id="username" name="username" maxlength="50" value="<%= utente %>" required>
            </p>
            <button type="submit">Visualizza corsi</button>
        </form>
        <% if (!nomeCliente.isEmpty()) { %>
            <h2>Corsi di <%= nomeCliente %> (<%= utente %>)</h2>
            <% if (corsi == null) { %>
                <p>Impossibile caricare i corsi. Riprova più tardi.</p>
            <% } else if (!corsiDisponibili) { %>
                <p>Il cliente non è iscritto a nessun corso.</p>
            <% } else { %>
                <table>
                    <thead>
                        <tr>
                            <th>Codice</th>
                            <th>Nome</th>
                            <th>Giorno</th>
                            <th>Ora</th>
                            <th>Costo</th>
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
                            </tr>
                        <% } while (corsi.next()); %>
                    </tbody>
                </table>
            <% } %>
        <% } %>
        <% if (corsi != null) { funzioni.closeResultSet(corsi); } %>
    <% } %>
    <p><a href="index.jsp">Torna alla pagina iniziale</a></p>
</body>
</html>
