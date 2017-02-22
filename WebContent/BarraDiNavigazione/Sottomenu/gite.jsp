<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="circolo nocerino">
		<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
		<link rel="icon" href="../../IMG/logo.png">
		<link href="../../HomePage/CSS/gite.css"  rel="stylesheet">
		<link href="../../HomePage/CSS/homepage.css" rel="stylesheet">
		<title> Qui vengono elencate tutte le gite in programma</title>
	</head>

<body>

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
	<h1 class="gita">Qui vengono elencate tutte le gite in programma</h1>
	
	<img src="../../HomePage/IMG/gite.gif" >
	
	<br>
	
		<h2 class="gita">Evento previsto per il 16 Giugno 2016</h2>
	
	<img src="../../HomePage/IMG/ortobotanico.jpg" id="gite2img">
	<p class="gita">
	  La gita del giorno 16 giugno prevista per ore 13:00 prevede la visita 
	  dell'orto botanico e delle opere di valorizzazione realizzate dal parco delle Apli apuane.
	  Uno degli obiettivi principali del progetto è stato quello di rendere l'Orto botanico accessibile al 
	  maggior numero di persone, tenendo fede ai principi della cosidetta Dichiarazione di Norcia, enunciati 
	  nel convegno internazionale "Il Parco è di tutti. Il mondo anche" promosso da Federparchi, dalla 
	  Federazione Italiana per il Superamento dell'Handicap e dal Parco Nazionale dei Monti Sibillini,
	  tenutosi a Norcia nell'ottobre 2003. Della Dichiarazione di Norcia si riportano di seguito alcune significative enunciazioni: ... 
	  Le diversità umane costituiscono un valore al pari dell'infinità di specie che compongono la natura; pertanto tutti gli interventi devono tenerne conto... 
	  L'accessibilità è un diritto umano e come tale deve essere garantita a tutte le persone indipendentemente dalle loro condizioni e dai loro limiti
	  </p> 
	  
	  <h2 class="gita">Evento previsto per il 22 Giugno 2016 </h2>
	  <img src="../../HomePage/IMG/funivia.jpg">
	  <h2 class="gita">PROGRAMMA</h2>
			<ol>
				<li>- Ore 10.05-10.10: Ritrovo a STAZIONE LECCO (F.s) (Piazza Lega Lombarda,Lecco)</li><br>
				<li>Treni : Da Chivasso (7.16) - Da Milano Centrale: 9.20 // Lecco F.s (Ore 10.00)</li><br>
				<li>-Ore 10.10-10.40: Partenza e arrivo in auto al Piazzale della funivia "PIANI D'ERNA" ,(6 km /25/30 min.) (Località Versasio, 23900 Versasio (LC))</li><br>
				<li>Qui i gentili autisti,se vorranno,potranno mettere a disposizione il mezzo per accompagnarci (dividendo spese e costo parcheggio) dalla stazione di Lecco F.S
				al piazale A Valle della Funivia "PIANI D'ERNA)</li><br>
				<li>-Ore 10.45-11.15: Partenza / Arrivo IN FUNIVIA ai PIANI D'ERNA,(Ci vogliono 6 minuti circa di funivia,ma potrebbe accadere che non riusciremo a prendere la 
				prima salita possibile.</li><br>
				<li>Gli orari di risalita dovrebbero essere alle 10.30 e alle 11.00...Se poi c'e' molta gente,ci saranno Corse ogni 15 minuti.</li><br>
		
		<h2 class="gita">Evento previsto per il 15 Agosto 2016</h2>
		<img src="../../HomePage/IMG/gite4.jpg">
		<h2 class="gita"> Ferragosto</h2>
			<ol>
				<li>Ferragosto 2015: sei aree musicali, beach volley e grigliata alle Capannine</li><br>
				<li>-15 agosto 2016 a partire dalle ore 19:00 alle Capannine di viale Kennedy parte una serata per festeggiare il Ferragosto</li> <br>
				<li>-Ore 20:30 Cena di Ferragosto con buffet e menù a scelta.</li><br>
		
		

</body>
	</html>
		
