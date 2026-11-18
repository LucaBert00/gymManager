Allora, stiamo lavorando nella cartella chiamata Gym Manager.
È un progetto in Java JSP.
Ti spiego il contesto: questo è un esercizio in preparazione alla verifica che avrò di Java JSP.
Per ora nella stessa cartella madre JSP abbiamo altri progetti.
In particolare abbiamo Web 5A 26, che sarebbe lo stesso progetto chiamato anche Demo JSP,
però Web 5A 26 è quello che abbiamo costruito e fatto insieme al prof e che ci ha dato lui.
Cioè questo progetto è la source of truth di tutta la mia programmazione in JSP.
Quindi, anche se ci sono delle cose, come SQL injection o errori, vanno bene per questo caso.
Non bisogna usare servlet e le select; bisogna farle come intese dal prof.
Quindi inoltre abbiamo anche un altro progetto, come ti ho detto,
che si chiama Demo.jsp, è sempre nella cartella madre JSP.
Demo.jsp è l'equivalente a Web 5A 26 portato avanti con alcune funzionalità aggiunte
e alcune cose che potrebbero deviare un pochino come complessità da quello che ci ha fatto il prof.
Abbiamo altri progetti: eserciziSemplici che è un progetto con dentro 5 esercizi semplici svolti fatti; 
inoltre abbiamo Flat Manager, un altro progetto JSP con richieste molto simili a questo, puoi prenderlo 
come esempio per svolgere questo.
Il nostro compito adesso, avendo la consegna, è di sviluppare il progetto di Gym Manager con
le stesse accortezze che ha utilizzato il prof nello sviluppo di Web 5A 26 e, insomma, in generale di JSP (Flat Manager).
Ti dico inoltre che abbiamo nella cartella scuola Quinta I informatica docs sei utili PDF che
ci ha fornito il prof per le pratiche da utilizzare usando JSP. Inoltre nel progetto troviamo
due file che devono restare così mutabili per la connessione al database, ovvero Connessione.jsp o anche FunzioniDB.java.
Questi ultimi li puoi trovare forse un pochino cambiati in Demo.jsp e anche nella versione del prof,
ma per ora non ci focussiamo su questo. Il driver di MySQL arriva dalla dipendenza Maven
com.mysql:mysql-connector-j nel pom.xml. Per il progetto Demo.jsp e Web 5A 26 abbiamo utilizzato il database abbonati,
mentre per il nuovo progetto Gym Manager utilizziamo il DB palestra, già importato in HeidiSQL e avviato con MySQL di XAMPP
(il dump palestra.sql non è più nella repo: resta nella cronologia di Git).
I requisiti funzionali sono in CONSEGNA.md: è la consegna da seguire per cosa implementare.
Queste sono le prime accortezze che ti do per appunto cosa stiamo andando a fare.
Successivamente ti dirò anche delle accortezze specifiche, ad esempio per il lavoro con agenti, commit,
push e il comportamento da utilizzare per GitHub.
