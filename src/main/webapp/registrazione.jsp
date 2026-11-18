<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="connessione.jsp" %>
<%
    String messaggio = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String citta = request.getParameter("citta");
        String telefono = request.getParameter("telefono");
        if (username != null) username = username.trim();
        if (nome != null) nome = nome.trim();
        if (cognome != null) cognome = cognome.trim();
        if (citta != null) citta = citta.trim();
        if (telefono != null) telefono = telefono.trim();

        boolean campiValidi = username != null && !username.isEmpty() && username.length() <= 50
                && password != null && !password.isEmpty() && password.length() <= 50
                && nome != null && !nome.isEmpty() && nome.length() <= 50
                && cognome != null && !cognome.isEmpty() && cognome.length() <= 50
                && citta != null && citta.length() <= 50
                && telefono != null && telefono.length() <= 50;

        if (!campiValidi) {
            messaggio = "Controlla i dati inseriti.";
        } else if (funzioni.verificaEsistente(
                "SELECT username FROM clienti WHERE username=" + funzioni.fc(username))) {
            messaggio = "Lo username scelto è già utilizzato.";
        } else {
            String[] campi = {"username", "password", "cognome", "nome", "citta", "telefono"};
            String[] valori = {
                funzioni.fc(username),
                funzioni.fc(password),
                funzioni.fc(cognome),
                funzioni.fc(nome),
                funzioni.fc(citta),
                funzioni.fc(telefono)
            };

            if (funzioni.update(campi, valori, "clienti", true, false)) {
                messaggio = "Registrazione completata: ora puoi effettuare il login.";
            } else {
                messaggio = "Registrazione non riuscita.";
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registrazione - Gym Manager</title>
</head>
<body>
    <h1>Registrazione di un nuovo cliente</h1>
    <% if (!messaggio.isEmpty()) { %>
        <p><%= messaggio %></p>
    <% } %>
    <form method="post" action="registrazione.jsp">
        <p>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" maxlength="50" required>
        </p>
        <p>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" maxlength="50" required>
        </p>
        <p>
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" maxlength="50" required>
        </p>
        <p>
            <label for="cognome">Cognome:</label>
            <input type="text" id="cognome" name="cognome" maxlength="50" required>
        </p>
        <p>
            <label for="citta">Città:</label>
            <input type="text" id="citta" name="citta" maxlength="50">
        </p>
        <p>
            <label for="telefono">Telefono:</label>
            <input type="text" id="telefono" name="telefono" maxlength="50">
        </p>
        <button type="submit">Registrati</button>
    </form>
    <p><a href="index.jsp">Torna alla pagina iniziale</a></p>
</body>
</html>
