<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="circolo nocerino">
		<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
		<link rel="icon" href="../../HomePage/IMG/logo.png">
		<link href="../../HomePage/CSS/scopa.css" rel="stylesheet">
		<link href="../../HomePage/CSS/homepage.css" rel="stylesheet">
		<title>Scopa</title>
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
<h1 class="scopa">Il gioco della scopa</h1>
<img src="../../HomePage/IMG/scopa.jpg">
<img id="scopa" src="../../HomePage/IMG/scopa2.jpg">

<p class="scopa">Regole:</p> 
	<ol>
		<li>Si ottiene prendendo in una sol colpo tutte le carte giacenti sul tavolo, e cio' viene mentalmente raffigurato come un colpo di scopa che spazza via tutto cio' che giace sul tavolo.</li><br>
		<li>La Scopa classica detta anche "Scopetta" si puo' giocare in due, in tre, in quattro (a coppie) oppure in sei a squadre di 3. Si tira a sorte per decidere chi e' di mano: </li><br>
		<li>I giocatori prendono una carta coperta dal mazzo e chi e' in possesso della carta piu' bassa da' le carte. Il mazziere da' tre carte a ognuno dei giocatori, a partire da quello 
			Quando poi tutti i giocatori hanno giocato le proprie carte, il mazziere ne distribuisce altre tre a testa fino al totale esaurimento del mazzo.</li><br>
		<li>Punteggi della Scopa</li><br>
		<li>I punti di gioco sono 4 di base: Carte, Denari Sette Bello e Primiera (o Settanta), ma a questi si aggiungono le eventuali scope inflitte 
	        all'avversario nel corso della partita. Ecco cosa contare alla fine di ogni partita.</li><br>
	    <li>   Le Carte della Scopa</li><br>
	    <li>Chi ha piu' di 20 carte (almeno 21) realizza 1 punto. Se entrambi i giocatori hanno preso 20 carte, il punto e'pari e non viene assegnato a nessuno.</li><br>
		<li>I Denari</li><br>
	    <li>Si aggiudica i denari chi se ne e' assicurato la meta'+ uno (e quindi almeno 6). Chi possiede quindi piu' di 5 carte del seme dei denari (almeno 6) realizza 1 punto. 
			Se entrambi i giocatori si sono aggiudicati 5 carte di denari, il punto e' pari e non viene assegnato a nessuno.</li><br>
		<li>Il Sette Bello (o Sette di Denari) vale 1 punto. Si assicura un Punto chi riesce ad assicurarselo.</li><br>
		<li>La Primiera (o Settanta)vale 1 punto. Si realizza con la combinazione dei 7 e delle altre carte di tutti e 4 i semi,
		superiore per punteggio a quella dell'avversario, secondo la seguente Tabella:</li><br><br>
		<li>7 = 21 Punti</li>
		<li>6 = 18 Punti</li>
		<li>Asso = 16 Punti</li>
		<li>5 = 15 Punti</li>
		<li>4 = 14 Punti</li>
		<li>3 = 13 Punti</li>
		<li>2 = 12 Punti</li>
		<li>La Primiera diventa insuperabile nel caso tu abbia:</li>
		<li>4 Sette</li>
		<li>3 Sette con una carta del range che va dall'Asso al 3</li>
	</ol>


</body>
</html>
