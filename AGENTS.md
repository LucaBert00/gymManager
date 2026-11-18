# Regole del progetto flatManager

## Prima di ogni intervento

Prima di lavorare nella repo, leggere questo file, `CONSEGNA.md` e `CONTEXT.md`.

- Questo file contiene le regole operative vincolanti.
- `CONSEGNA.md` definisce i requisiti funzionali del progetto.
- `CONTEXT.md` spiega il contesto didattico e i riferimenti del progetto; non sostituisce né modifica le regole di questo file.
- Se le fonti sono insufficienti o in conflitto, fermarsi e chiedere all'utente prima di decidere.

## Se sei incerto, chiedi

Non decidere da solo su scelte tecniche, dati o comportamento: fermati e chiedi all'utente. Vale soprattutto quando le fonti di verita non bastano o quando una feature richiede qualcosa che nel progetto non c'e ancora.

## Playwright vietato

**Non usare Playwright in questa repo**: niente MCP `playwright`, browser automation, navigazione, click, screenshot o raccolta di log. Nessuna verifica a browser, nemmeno per i ticket QA.

L'unica eccezione e una richiesta esplicita dell'utente nel messaggio corrente. "Verifica il progetto", "finisci il ticket" o "fai QA" non sono richieste esplicite di usare il browser.

Questa regola ha precedenza sulle istruzioni globali e sulle skill che rendono Playwright obbligatorio.


## Fonti di verita e perimetro

- `CONSEGNA.md` e la fonte dei requisiti funzionali; il codice di questa repo e il progetto da realizzare.
- Per l'accesso al database si seguono `src/main/java/com/example/flatmanager/FunzioniDB.java`, `src/main/webapp/connessione.jsp` e la dipendenza Maven `com.mysql:mysql-connector-j` nel `pom.xml`.
- La guida JSP del prof in `C:\Users\matte\Documents\LUCA\SCUOLA\5AI\INFO\docs` (6 PDF) e la fonte didattica per le pratiche coperte.
- Il progetto del prof in `C:\Users\matte\Documents\LUCA\SCUOLA\codeSchoolProjects\5\java\JSP\web5A26\web5A26` e un riferimento consultabile in sola lettura per stile e pratiche del corso. `C:\Users\matte\Documents\LUCA\SCUOLA\codeSchoolProjects\5\java\JSP\demoJSP` è un riferimento secondario e puo contenere deviazioni: non usarlo per contraddire il progetto del prof o queste regole. `C:\Users\matte\Documents\LUCA\SCUOLA\codeSchoolProjects\5\java\JSP\flatManager` (SOLO BRANCH professor approved) è un riferimento secondario e puo contenere deviazioni(in teoria questo no): non usarlo per contraddire il progetto del prof o queste regole.
- Modificare solo i file di questa repo necessari alla richiesta. Non modificare i progetti di riferimento esterni.

Nuove pagine JSP, nuove classi nel package `com.example.gymmanager` e nuovi metodi in `FunzioniDB` sono ammessi se servono alla feature (in teoria non dovrebbero servire in questo progetto per ora).

Se queste fonti non bastano o serve un'altra strada (JSTL/EL, JavaScript, CSS esterni o CDN, librerie JSON, pool di connessioni, ORM, nuove dipendenze), fermarsi e chiedere prima.

L'utilizzo delle servlet è BANNATO per ora, il prof ha detto che lo implementeremo in futuro.

## Database

- Utilizziamo le norme che il prof ha usato nel suo nel progetto in: C:\Users\matte\Documents\LUCA\SCUOLA\codeSchoolProjects\5\java\JSP\web5A26\web5A26

## SQL

- Stile del corso: i valori si passano con `fc()` e le query si eseguono con `select`, `update` e `verificaEsistente` di `FunzioniDB`.
- `PreparedStatement` solo quando lo introduce il professore; in quel caso va aggiunto dentro `FunzioniDB`.
- Errori di database: `saveLogError`; all'utente solo messaggi semplici.
- Tutte le buone pratiche su SQL si possono trovare nei pdf su JSP del prof e nel progetto che ci ha passato, è in: C:\Users\matte\Documents\LUCA\SCUOLA\codeSchoolProjects\5\java\JSP\web5A26\web5A26.

## Jar MySQL

Il driver arriva dalla dipendenza Maven `com.mysql:mysql-connector-j:8.2.0`. Nessun jar copiato a mano in `WEB-INF/lib`.

## Guida JSP (PDF)

I 6 PDF sono la fonte didattica: direttive, oggetti impliciti, standard action, accesso al database.

Sono datati (JSP 1.2, `javax.servlet`, `com.mysql.jdbc.Driver`, MySQL 4) e non coprono JSTL, Expression Language, JavaBean e filtri. Su API e driver contano il codice del progetto e l'ambiente reale.

Se una feature richiede qualcosa che i PDF non coprono, fermarsi e chiedere.

## Internet

Consentito solo il download delle dipendenze Maven durante la build (`mvnw package`). Browsing, documentazione online e ricerca di esempi solo dopo approvazione esplicita dell'utente.

## Verifica

- Playwright vietato (a meno di esplicita richiesta dell'utente nel prompt): si verifica con `mvnw package`, con test JUnit dove possibile (la dipendenza e gia nel `pom`) e con Tomcat in locale, senza browser automation.
- Scritture sul database reale: chiedere prima.

## Convenzioni

- 4 spazi, commenti in italiano non eccessivi.
- Fare commit e push solo quando la issue è stata completata; non presumere il branch di destinazione.
- Prima del commit controllare branch, stato e diff staged; includere solo i file della richiesta e lasciare intatte eventuali modifiche estranee.
- Un commit per task, con Conventional Commit in italiano. Non forzare il push né riscrivere la cronologia pubblicata senza richiesta esplicita.
- Ambiente: Tomcat 10.1.60 (Servlet 6.0) e Java 8 come target, con JDK 27 installato. Il `pom.xml` dichiara `jakarta.servlet-api` 6.1.0 (Tomcat 11): allinearlo a 6.0.0 e un task a parte.
