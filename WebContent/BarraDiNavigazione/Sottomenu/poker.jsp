<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="circolo nocerino">
		<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
		<link rel="icon" href="../../IMG/logo.png">
		<link href="../../HomePage/CSS/poker.css"  rel="stylesheet">
		<link href="../../HomePage/CSS/homepage.css" rel="stylesheet">
		<title> Poker</title>
	</head>
	<body>
	<header class="top"><img src="../../HomePage/IMG/logo.png"></header>
	<header class="top1"><h1>NUOVO CIRCOLO NOCERINO</h1></header>
	
	<%
		HttpSession s = request.getSession();
	
		String u = (String)s.getAttribute("Username");
		String pw=(String)s.getAttribute("Password");
	%>
	<% if(CheckLogin.validate(u,pw)){%>
		<a href="../../Cart.jsp"><img id="cart" src="../../HomePage/IMG/cart.png"></a><br>
	<% } %>
		<% if(CheckLogin.validate(u,pw)){%>
				<form action="../../Logout">
					<input id="qwe" type="submit" value="Logout" >
				</form>
			<p class="log">Benvenuto <%=u %> &nbsp;</p>
			
		<%}%>
	
	<%
		HttpSession f=request.getSession();
		String uadmin=(String)f.getAttribute("username");
		String pwadmin=(String)f.getAttribute("password");
		if(uadmin!=null){%>
			<form action="../../Logout">
					<input id="qwe" type="submit" value="Logout" >
				</form>
			<p class="log">Benvenuto amministratore <%=uadmin %> &nbsp;</p>
	
	<%}%>
	
	<div id="nav">													<!-- NAVIGATION BAR -->
		<ul>
			<li ><a href="../../HomePage/homepage.jsp">Home</a></li>
			<li><a href="../News.jsp">News</a></li>
			<li class="selected"><a href="#">Attività</a>
				<ul>
					<li><a href="cene.jsp">Cena</a></li>
					<li><a href="gite.jsp">Gita</a></li>
					<li><a href="#">Partita <br>
									a <br>
									Carte</a>
									<ul>
										<li><a href="scopa.jsp">Scopa</a></li><br>										
										<li><a href="poker.jsp">Poker</a></li><br>
										<li><a href="scala40.jsp">Scala 40</a></li><br>
									</ul>
									</li>
				</ul>
			</li>
			<li><a href="../../Eventi.jsp">Eventi</a></li>
			<li><a href="#">Chi siamo</a>
				<ul class="ev">
					<li><a href="Storia.jsp">La storia</a></li>
					<li><a href="Galleria.jsp">Galleria <br>
									immagini</a></li>
					<li><a href="../Contatti.jsp">Dove siamo</a></li>
				</ul>
			</li>
			<%if(CheckLogin.validate(u,pw)){%>
			<li><a href="#">Area Riservata</a>
				<ul>
					<li><a href="../../profilo.jsp">Profilo</a></li><br>
					<li><a href="../../ordine.jsp">Ordini</a></li><br>
					<li><a href="../../Cart.jsp">Carrello</a></li><br>
				</ul>
			</li>
			<%} %>
			<li><a href="#">Catalogo Articoli</a>
				<ul>
					<li><a href="#">Categorie</a>
						<ul class="cat">
							<li><a href="../../Abbigliamento.jsp">Abbigliamento</a></li><br>
							<li><a href="../../Gadget.jsp">Accessori</a></li><br>
							<li><a href="../../Biglietto.jsp">Biglietti</a></li><br>
						</ul>
					</li>
				</ul>
			</li>
			<li><a href="../Statuto.jsp">Statuto</a></li>
			<li><a href="../Contatti.jsp">Contatti</a></li>
			<%if(uadmin!=null) {%>
			<li><a href="../ListaSoci.jsp">Lista Soci</a></li>
			<li><a href="../../ordine.jsp">Ordini</a></li>
			<%} %>
		</ul>
	</div><br><br><br>
	<h1 class="poker">Il gioco del Poker </h1>
	<img  src="../../HomePage/IMG/poker.jpg">
	<img id="poker" src="../../HomePage/IMG/poker1.jpg">
	<p class="poker"> Guida al gioco:</p>
	<ol>
			<li>Ogni giocatore dispone di sette carte, di cui solo 2 sono "private"(le carte coperte che ha in mano il giocatore)
				,mentre le altre cinque vengono definite "community cards" poiché appartengono a tutti i giocatori e vengono scoperte al centro del tavolo</li><br>
			<li>I giocatori cercheranno di ottenere la combinazione di cinque carte che abbia il maggior valore possibile,lo scopo di ogni mano è naturalmente quello
				di aggiudicarsi il piatto(pot), formato dalle chips che vengono messe al centro durante i vari giri di puntate</li><br>
			<li>Lo scopo di ogni mano è naturalmente quello di aggiudicarsi il piatto(pot), formato dalle chips che vengono messe al centro durante i vari giri di puntate</li><br>
			<li>Ciascuno ha la possibilità di utilizzare le sue due carte private più tre carte comuni, oppure quattro comuni e soltanto 
				una privata, o in certi casi soltanto le cinque carte comuni. Lo scopo del gioco è quindi quello di vincere più chips possibili.</li><br>
			<li>Possono partecipare alla partita da 2 a 10 giocatori:Il giocatore alla sinistra del bottone(il mazziere "virtuale") mette nel piatto una cifra fissa prestabilita 
				che viene definita Small Blind, e il giocatore seguente ne mette un'altra pari al doppio, definita Big Blind.</li><br>
			<li>Queste sono le due uniche puntate che vengono effettuate prima della distribuzione delle carte,una volta che i giocatori hanno le proprie due carte private effettuano 
				il primo giro di puntate,a partire da quello alla sinistra del Big Blind, definito in gergo Under The Gun (UTG), i giocatori hanno tre possibilità: fare Fold, ossia passare
				e gettare le proprie carte,fare Call, cioè vedere la puntata messa nel piatto dal Big Blind, oppure fare Raise, rilanciare scommettendo un'importo maggiore di quello messo dal Big Blind</li><br>
			<li>E' il momento di scoprire le prime tre carte: il mazziere "brucia" una carta e gira il Flop, che è composto appunto dalle prime tre carte delle cinque comuni.</li><br>
			<li>Manuale di texas holdem alla mano,  a questo puno parte il secondo giro di puntate. Questa volta si parte dallo Small Blinde si prosegue in senso orario,i giocatori possono fare Check, ossia restare
				nella mano senza aggiungere altre chips, fare un Bet, una puntata pari almeno all'importo del Big Blind,oppure rilanciare sul Bet fatto in precedenza da un altro giocatore.</li><br>
			<li>Finito il secondo giro di scommesse, il mazziere(il Dealer) "brucia" una carta e scopre il Turn, la quarta carta comune,si effettua il terzo giro di puntate con le stesse modalità del precedente.</li><br>
			<li>E' il momento di scoprire l'ultima community card; viene bruciata una carta e se ne gira un'altra al centro del tavolo. Parte il quarto ed ultimo giro di scommesse,effettuato con le stesse modalità dei due precedenti.</li><br>
			<li>A questo punto dobbiamo vedere chi si aggiudicherà il piatto. Si svolge lo Showdown: se ci sono stati uno o più Call si confrontano le mani dei giocatori rimasti in gara.  Secondo il manuale del poker texas holdem, chi ha fatto 
				azione per ultimo, puntando o rilanciando, scopre per primo le sue carte private ,dichiarando la sua combinazione, dopo tocca ai giocatori che hanno visto la puntata.</li> <br>
				Se uno dei giocatori che ha fatto Call ha un punto inferiore a chi ha già mostrato può gettare le proprie carte senza farle vedere agli altri giocatori.<br><br>
				Nel caso di combinazioni uguali si divide il pot in parti uguali; se nella divisione rimanesse una chip dispari, questa verrà assegnata al giocatore che<br>
				si trova in posizione inferiore.<br><br>
				Fine :).<br>

	
	</body>
	</html>