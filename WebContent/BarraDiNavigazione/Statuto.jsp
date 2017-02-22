<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href="IMG/logo.png">
<link href="../HomePage/CSS/homepage.css" rel="stylesheet">

<title>Statuto del Nuovo Circolo Nocerino</title>
</head>
<body>
<header class="top"><img src="../HomePage/IMG/logo.png"></header>
	<header class="top1"><h1>NUOVO CIRCOLO NOCERINO</h1></header>
	<%
		HttpSession s = request.getSession();
	
		String u = (String)s.getAttribute("Username");
		String pw=(String)s.getAttribute("Password");
	%>
	<% if(CheckLogin.validate(u,pw)){%>
		<a href="../Cart.jsp"><img id="cart" src="../HomePage/IMG/cart.png"></a><br>
	<% } %>
		<% if(CheckLogin.validate(u,pw)){%>
				<form action="../Logout">
					<input id="qwe" type="submit" value="Logout" >
				</form>
			<p class="log">Benvenuto <%=u %> &nbsp;</p>
			
		<%}%>
		
		<%
		HttpSession f=request.getSession();
		String uadmin=(String)f.getAttribute("username");
		String pwadmin=(String)f.getAttribute("password");
		if(uadmin!=null){%>
			<form action="../Logout">
					<input id="qwe" type="submit" value="Logout" >
				</form>
			<p class="log">Benvenuto amministratore <%=uadmin %> &nbsp;</p>
	
		<%}%>
		
	<div id="nav">													<!-- NAVIGATION BAR -->
		<ul>
			<li><a href="../HomePage/homepage.jsp">Home</a></li>
			<li><a href="News.jsp">News</a></li>
			<li><a href="#">Attivit&agrave;</a>
				<ul>
					<li><a href="Sottomenu/cene.jsp">Cena</a></li>
					<li><a href="Sottomenu/gite.jsp">Gita</a></li>
					<li><a href="#">Partita <br>
									a <br>
									Carte</a>
									<ul>
										<li><a href="Sottomenu/scopa.jsp">Scopa</a></li><br>
										<li><a href="Sottomenu/poker.jsp">Poker</a></li><br>
										<li><a href="Sottomenu/scala40.jsp">Scala 40</a></li><br>
									</ul>
									</li>
				</ul>
			</li>
			<li><a href="../Eventi.jsp">Eventi</a></li>			
			<li><a href="#">Chi siamo</a>
				<ul class="ev">
					<li><a href="Sottomenu/Storia.jsp">La storia</a></li>
					<li><a href="Sottomenu/Galleria.jsp">Galleria <br>
									immagini</a></li>
					<li><a href="Contatti.jsp">Dove siamo</a></li>
				</ul>
			</li>
			<%if(CheckLogin.validate(u,pw)){%>
			<li><a href="#">Area Riservata</a>
				<ul>
					<li><a href="../profilo.jsp">Profilo</a></li><br>
					<li><a href="../ordine.jsp">Ordini</a></li><br>
					<li><a href="../Cart.jsp">Carrello</a></li><br>
				</ul>
			</li>
			<%} %>
			<li><a href="#">Catalogo Articoli</a>
				<ul>
					<li><a href="#">Categorie</a>
						<ul class="cat">
							<li><a href="../Abbigliamento.jsp">Abbigliamento</a></li><br>
							<li><a href="../Gadget.jsp">Accessori</a></li><br>
							<li><a href="../Biglietto.jsp">Biglietti</a></li><br>
						</ul>
					</li>
				</ul>
			</li>
			<li class="selected"><a href="Statuto.jsp">Statuto</a></li>
			<li><a href="Contatti.jsp">Contatti</a></li>
			<%if(uadmin!=null) {%>
			<li><a href="ListaSoci.jsp">Lista Soci</a></li>
			<li><a href="../ordine.jsp">Ordini</a></li>
			<%} %>
		</ul>
	</div>
	<div>
	<h1 id="t">Statuto del Nuovo Circolo Nocerino</h1><br>
	<h3>Lista delle regole</h3><br>
	<div id="statuto">
<b>Art. 1:</b> è costituito in ............................................ il circolo di cultura
cinematografica denominato.”..........................................................................” aderente
all’Associazione Nazionale Circoli Cinematografici Italiani ANCCI.
Il Circolo “......................................” è una libera associazione di fatto, regolata a norma
dell’art. 36 e seguenti del Codice Civile, dell’art. 18, primo comma del D.Lgs. 22 gennaio
2004 n. 28, nonché del presente statuto.
Esso ha sede in ...............................................................................(.............................)
Via ...............................................n. ............... ed ha durata illimitata.
L’eventuale cambio di sede non comporta modifiche allo Statuto.
 <br><br><b>Art. 2:</b> il circolo esclude scopi di lucro e si propone di svolgere attività
cinematografica, oltre che teatrale e musicale, (questa aggiunta è facoltativa e può essere
inserita dai circoli che svolgono attività polivalente) attraverso proiezioni, dibattiti,
conferenze, corsi, pubblicazioni ed ogni altra manifestazione o iniziativa nel quadro di
attività culturali mediante gli strumenti della comunicazione sociale e audiovisiva.
In linea più generale rientra tra gli scopi del Circolo promuovere la cultura e l’arte
attraverso attività specifiche e di formazione e predisporre servizi di assistenza e
consulenza culturale per i propri soci.
(Nel caso di costituzione del Circolo nell'ambito della realtà parrocchiale si può
aggiungere: Il Circolo potrà utilizzare spazi e impianti della parrocchia di ......................,
tramite apposita convenzione, esclusivamente per lo svolgimento dell'attività
istituzionale. Nel caso in cui intenda dar vita a rapporti che possano coinvolgere,
direttamente o indirettamente, la parrocchia, dovrà comunque ottenere da essa il
benestare).
Inoltre, il Circolo può realizzare ogni attività da considerarsi sussidiaria e meramente
strumentale per il conseguimento delle finalità istituzionali.<br>
<br><br><b>Art. 3:</b> per il perseguimento dei fini sociali, il Circolo può assumere la gestione di
una sala cinematografica riservata ai soci ai sensi dell’art. 18, sesto comma del D.Lgs. n.
28/2004.
SOCI
<br><br><b>Art. 4:</b> sono soci del circolo coloro che vi si iscrivono per partecipare alle sue
attività, che ne accettano lo statuto, che rispettano le decisioni degli organi statutari e che
versano la quota sociale annuale. La domanda di ammissione presentata da coloro che
non hanno raggiunto la maggiore età deve essere controfirmata per convalida da un
genitore o da chi ne fa le veci.
L’ammissione dei soci è deliberata dal Presidente e dai suoi Vice.
La qualità di socio si perde per dimissioni, per decadenza a seguito del mancato
versamento della quota annuale entro tre mesi dal termine dell’anno sociale, per
espulsione deliberata dal Presidente del Circolo e dai suoi Vice in caso di violazioni dello
statuto e delle deliberazioni assunte dagli organi statutari. Contro le decisioni relative al
diniego di ammissione e all’espulsione, è possibile presentare ricorso scritto al Consiglio
direttivo entro 30 giorni dalla data di notifica. 
Le proiezioni cinematografiche sono comunque riservate ai soci muniti di tessera annuale
vidimata dalla S.I.A.E. e rilasciata dal Presidente del Circolo. Il divieto di accesso per i
minori sarà rispettato per le proiezioni di film aventi tale divieto o che non abbiano
chiesto il nullaosta di circolazione.
<br><br><b>Art. 5:</b> tutti i soci in regola con il versamento della quota sociale annuale hanno
diritto di partecipare alla vita associativa. I soci maggiorenni esercitano diritto di voto
nelle assemblee per l’approvazione e le modifiche dello Statuto e dei regolamenti nonché
per la nomina degli organi direttivi. È espressamente esclusa la temporaneità della
partecipazione alla vita associativa. I soci minorenni partecipano alle assemblee con solo
voto consultivo e non possono assumere cariche associative.
<br><br><b>Art. 6:</b> le prestazioni fornite dai soci e da coloro che rivestono cariche elettive
sono a titolo gratuito e non possono essere retribuite neppure dal beneficiario. Ai soci
possono essere rimborsate soltanto le spese effettivamente sostenute, secondo opportuni
parametri validi per tutti i soci, preventivamente stabiliti dal Consiglio direttivo.
ORGANI DEL CIRCOLO
<br><br><b>Art. 7:</b> sono organi del Circolo:
A) il Presidente;
B) il Consiglio direttivo;
C) l’Assemblea dei soci;
D) il Collegio dei revisori dei conti (facoltativo).
a) il Presidente
<br><br><b>Art. 8:</b> il Presidente, eletto dal Consiglio direttivo tra i suoi membri, ha la
rappresentanza legale del Circolo; dura in carica ........ anni e può essere rieletto; convoca
e presiede le riunioni del Consiglio direttivo e dell’Assemblea; esercita l’ordinaria
amministrazione e compie ogni atto necessario allo svolgimento dell’attività sociale. A
lui potranno essere delegati parte dei poteri spettanti al Consiglio direttivo. Nell’ambito
del Consiglio direttivo potranno essere eletti, con mandato triennale rinnovabile, uno o
più Vice Presidenti, di cui uno designato vicario, e un Tesoriere.
<br><br><b>Art. 9:</b> rientra nelle competenze del Presidente e dei Vice Presidenti:
A) l’attuazione delle deliberazioni dell’Assemblea e del Consiglio direttivo;
B) l’ammissione e l’espulsione dei soci ai sensi dell’art. 4 del presente Statuto;
C) la predisposizione degli ordini del giorno del Consiglio direttivo e
dell’Assemblea;
D) l’esercizio della normale amministrazione
b) il Consiglio direttivo<br>
<br><br><b>Art. 10:</b> il Consiglio direttivo è l’organo esecutivo del Circolo. Esso è composto
da non meno di cinque membri, tutti maggiorenni, eletti dall’Assemblea: tutti i
componenti durano in carica ........ anni e possono essere rieletti.
(Nel caso di circolo costituito nell'ambito della realtà parrocchiale, si può aggiungere:
“Partecipa alle riunioni del Consiglio direttivo, con solo voto consultivo e, senza che
concorra a formare il numero legale, il parroco pro-tempore della parrocchia di
................... o altro sacerdote da lui delegato”). <br>
<br><br><b>Art. 11:</b> compete al Consiglio direttivo:
A) la elezione, tra i suoi membri, del Presidente, di uno o più Vice Presidenti di
cui uno Vicario, del Tesoriere e del Segretario;
B) la definizione dei programmi di attività e l’attuazione delle deliberazioni
dell’Assemblea;
C) la delega al Presidente a compiere atti di straordinaria amministrazione;
D) la determinazione delle quote sociali e di quelle eventuali per la partecipazione
a specifiche attività del circolo;
E) la predisposizione del rendiconto economico e finanziario annuale nonché
della relazione sull’attività svolta da sottoporre all’approvazione dell’Assemblea;
F) l’esame in appello dei ricorsi (negata ammissione o espulsione) ai sensi
dell’art. 4 del presente Statuto;
G) la proposta di modifiche al presente statuto da sottoporre all’approvazione
dell’Assemblea;
H) la formulazione degli eventuali regolamenti interni da sottoporre
all’approvazione dell’Assemblea;
I) la proposta dell’eventuale scioglimento del Circolo da sottoporre
all’approvazione dell’Assemblea;
L) l’eventuale nomina, su proposta del Presidente, del Segretario del Circolo.
<br><br><b>Art. 12:</b> qualora durante il mandato vengano a mancare uno o più Consiglieri si
procederà alla sostituzione facendo subentrare i primi non eletti che rimarranno in carica
fino alla scadenza del mandato del Consigliere sostituito. Il Consiglio direttivo si
considera decaduto quando vengano a mancare i due terzi dei componenti.
<br><br><b>Art. 13:</b> il Consiglio direttivo si riunisce almeno una volta l’anno e ogniqualvolta
il Presidente lo riterrà necessario.
c) l’Assemblea dei soci
<br><br><b>Art. 14:</b> l’Assemblea, organo sovrano del Circolo, è costituita dai soci di cui
all’art. 4 del presente statuto in regola con il pagamento delle quote associative. Essa è
convocata dal Presidente, in via ordinaria, almeno una volta l’anno per l’approvazione del
rendiconto. Può essere convocata in via straordinaria quando il Consiglio direttivo lo
ritenga opportuno o su richiesta di almeno un terzo dei soci in regola con il versamento
delle quote associative.
 La convocazione va comunque fatta con lettera, fax, e.mail e con avviso pubblico
affisso, in maniera ben visibile, nei locali in cui vengono svolte le attività associative
almeno 15 giorni prima della data dell’Assemblea. L’avviso di convocazione deve
contenere il giorno, l’ora ed il luogo della prima e seconda convocazione, nonché l’ordine
del giorno. In prima convocazione l’Assemblea è validamente costituita se sono
rappresentati oltre la metà dei voti esprimibili. In seconda convocazione l’Assemblea
delibera validamente qualunque sia il numero dei voti esprimibili. Tra la prima e la
seconda convocazione deve intercorrere almeno un’ora.
 Ai sensi dell’art. 2538 (D.lgs. 17/01/2003, n.6), 2° comma del Codice Civile ogni
socio ha diritto ad un solo voto. Può essere portatore di una sola delega. 
Art. 15: spetta all’Assemblea:
A) definire le linee di indirizzo generale dell’attività del Circolo;
B) eleggere ogni tre anni i componenti il Consiglio direttivo fissandone il numero
che non potrà essere inferiore a cinque;
C) eleggere ogni tre anni i componenti il Collegio dei revisori dei conti;
D) approvare il rendiconto economico e finanziario annuale, predisposto dal
Consiglio direttivo entro tre mesi dalla chiusura dell’esercizio sociale;
E) approvare gli eventuali regolamenti interni;
F) deliberare sulle modifiche allo Statuto e sull’eventuale scioglimento del
Circolo.
Art. 16: le deliberazioni sono prese a maggioranza semplice. Per le modifiche
statutarie è richiesto il voto favorevole di almeno la metà di tutti i soci.
Per lo scioglimento del Circolo e per la devoluzione del patrimonio occorre il voto
favorevole di almeno due terzi dei soci.
 Delle delibere assembleari e dei rendiconti annuali deve essere data pubblicità, per
estratto, mediante affissione nella sede sociale del verbale relativo.
d) il Collegio dei revisori dei conti
Art. 17: il Collegio dei revisori dei conti è composto da tre soci eletti
dall’Assemblea al di fuori dei componenti il Comitato direttivo.
 Spetta al Collegio dei revisori dei conti:
A) la revisione dei rendiconti annuali del Circolo;
B) la redazione della relazione sui predetti rendiconti annuali.
 I rendiconti annuali devono essere depositati presso la sede del Circolo entro i 15
giorni precedenti la data di approvazione per poter essere consultati dai soci. L’esercizio
sociale si apre il 1° Gennaio e si chiude il 31 Dicembre di ogni anno.
IL PATRIMONIO
Art. 18: il patrimonio del Circolo è costituito:
A) dalle quote associative;
B) dalle erogazioni effettuate a qualunque titolo al Circolo;
C) dagli eventuali proventi derivanti dalle attività di cui all’art. 2, 4°comma del
presente statuto;
D) da eventuali investimenti mobiliari ed immobiliari;
E) da eventuali eccedenze attive di gestione.
 È fatto divieto di distribuire, anche in modo indiretto, utili o avanzi di gestione
nonché fondi, riserve o capitale durante la vita del Circolo, salvo che la destinazione o la
distribuzione non sia imposta dalla legge. Non è ammessa la trasmissibilità e la
rivalutazione delle quote associative, ad eccezione dei trasferimenti a causa di morte, e la
loro rivalutabilità.
SCIOGLIMENTO DEL CIRCOLO 
Art. 19: lo scioglimento del Circolo deve essere deliberato, su proposta del
Consiglio direttivo, dall’Assemblea dei soci secondo le modalità previste dall’art. 16,
2°comma del presente Statuto. Con le stesse modalità sono nominati i liquidatori. Il
patrimonio residuo del Circolo deve essere devoluto ad altri enti con finalità analoghe o a
fini di pubblica utilità, sentito l’organismo di controllo di cui all’art. 3, comma 190 della
legge 23/12/96 n. 662, e salvo diversa destinazione imposta dalla legge.
NORME FINALI
Art. 20: per quanto non previsto dal presente statuto si fa riferimento alle vigenti
disposizioni di legge e agli eventuali regolamenti interni approvati dall’Assemblea.
	</div>
	</div>
</body>
</html>