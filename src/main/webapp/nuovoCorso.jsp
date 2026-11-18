<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="connessione.jsp" %>
<%
    String username = (String) session.getAttribute("username");
    boolean admin = username != null && username.equals("admin");
    String messaggio = "";
    String corsoInserito = "";

    if (admin && "POST".equalsIgnoreCase(request.getMethod())) {
        String idCorso = request.getParameter("idCorso");
        String descrizione = request.getParameter("descrizione");
        String giornoSettimana = request.getParameter("giornoSettimana");
        String ora = request.getParameter("ora");
        String costo = request.getParameter("costo");
        if (idCorso != null) idCorso = idCorso.trim();
        if (descrizione != null) descrizione = descrizione.trim();
        if (giornoSettimana != null) giornoSettimana = giornoSettimana.trim();
        if (ora != null) ora = ora.trim();
        if (costo != null) costo = costo.trim();

        boolean costoValido = costo != null && costo.matches("\\d+");
        int costoNumero = 0;
        if (costoValido) {
            try {
                costoNumero = Integer.parseInt(costo);
                costoValido = costoNumero > 0;
            } catch (NumberFormatException e) {
                costoValido = false;
            }
        }

        boolean campiValidi = idCorso != null && !idCorso.isEmpty() && idCorso.length() <= 5
                && descrizione != null && !descrizione.isEmpty() && descrizione.length() <= 50
                && giornoSettimana != null && !giornoSettimana.isEmpty() && giornoSettimana.length() <= 20
                && ora != null && !ora.isEmpty() && ora.length() <= 20
                && costoValido;

        if (!campiValidi) {
            messaggio = "Controlla i dati inseriti.";
        } else if (funzioni.verificaEsistente(
                "SELECT idCorso FROM corsi WHERE idCorso=" + funzioni.fc(idCorso))) {
            messaggio = "Esiste già un corso con questo codice.";
        } else {
            String[] campi = {"idCorso", "descrizione", "giornoSettimana", "ora", "costo"};
            String[] valori = {
                funzioni.fc(idCorso),
                funzioni.fc(descrizione),
                funzioni.fc(giornoSettimana),
                funzioni.fc(ora),
                funzioni.fc(String.valueOf(costoNumero))
            };

            if (funzioni.update(campi, valori, "corsi", true, false)) {
                messaggio = "Corso inserito correttamente.";
                corsoInserito = idCorso;
            } else {
                messaggio = "Inserimento non riuscito.";
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nuovo corso - Gym Manager</title>
</head>
<body>
    <h1>Inserisci un nuovo corso</h1>
    <% if (!admin) { %>
        <p>Questa pagina è riservata all'utente admin.</p>
    <% } else { %>
        <% if (!messaggio.isEmpty()) { %>
            <p><%= messaggio %></p>
        <% } %>
        <% if (!corsoInserito.isEmpty()) { %>
            <p><a href="dettaglioCorso.jsp?idCorso=<%= corsoInserito %>">Visualizza il corso inserito</a></p>
        <% } %>
        <form method="post" action="nuovoCorso.jsp">
            <p>
                <label for="idCorso">Codice corso:</label>
                <input type="text" id="idCorso" name="idCorso" maxlength="5" required>
            </p>
            <p>
                <label for="descrizione">Nome del corso:</label>
                <input type="text" id="descrizione" name="descrizione" maxlength="50" required>
            </p>
            <p>
                <label for="giornoSettimana">Giorno della settimana:</label>
                <select id="giornoSettimana" name="giornoSettimana" required>
                    <option value="">-- Seleziona un giorno --</option>
                    <option value="lunedi">lunedì</option>
                    <option value="martedi">martedì</option>
                    <option value="mercoledi">mercoledì</option>
                    <option value="giovedi">giovedì</option>
                    <option value="venerdi">venerdì</option>
                    <option value="sabato">sabato</option>
                    <option value="domenica">domenica</option>
                </select>
            </p>
            <p>
                <label for="ora">Ora di inizio:</label>
                <input type="text" id="ora" name="ora" maxlength="20" placeholder="es. 18.00" required>
            </p>
            <p>
                <label for="costo">Costo:</label>
                <input type="number" id="costo" name="costo" min="1" max="2147483647" step="1" required>
            </p>
            <button type="submit">Inserisci corso</button>
        </form>
    <% } %>
    <p><a href="index.jsp">Torna alla pagina iniziale</a></p>
</body>
</html>
