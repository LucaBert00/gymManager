<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    String nome = (String) session.getAttribute("nome");
    boolean loggato = username != null;
    boolean admin = loggato && username.equals("admin");
    // Il login fallito lascia un messaggio in sessione: lo mostro una sola volta.
    String erroreLogin = (String) session.getAttribute("login");
    session.removeAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gym Manager</title>
</head>
<body>
    <h1>Gym Manager</h1>
    <% if (erroreLogin != null) { %>
        <p>Credenziali non valide.</p>
    <% } %>
    <% if (loggato) { %>
        <p>Benvenuto, <%= nome %> (<%= username %>).</p>
        <p><a href="logout.jsp">Esci</a></p>
    <% } else { %>
        <h2>Login clienti</h2>
        <form method="post" action="login.jsp">
            <p>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" maxlength="50" required>
            </p>
            <p>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" maxlength="50" required>
            </p>
            <button type="submit">Login</button>
        </form>
        <p>Non hai un account? <a href="registrazione.jsp">Registrati</a></p>
    <% } %>
    <h2>Corsi</h2>
    <p><a href="corsi.jsp">Visualizza i corsi disponibili</a></p>
    <p><a href="classifica.jsp">Visualizza la classifica dei corsi</a></p>
    <% if (admin) { %>
        <h2>Area amministratore</h2>
        <p><a href="corsiCliente.jsp">Visualizza i corsi di un cliente</a></p>
        <p><a href="incassoTotale.jsp">Visualizza l'incasso totale</a></p>
        <p><a href="nuovoCorso.jsp">Inserisci un nuovo corso</a></p>
    <% } %>
</body>
</html>
