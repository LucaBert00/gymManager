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
    <% } %>
</body>
</html>
