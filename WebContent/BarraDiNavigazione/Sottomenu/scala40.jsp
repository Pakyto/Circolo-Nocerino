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
		<link href="../../HomePage/CSS/scala40.css"  rel="stylesheet">
		<link href="../../HomePage/CSS/homepage.css" rel="stylesheet">
		<title> Scala 40</title>
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
		
		<h1 class="scala40"> Regolamento Scala 40</h1>
		<p>
		<img src="../../HomePage/IMG/scala40.jpg">
		</p>
		<h2 class="scala40"> Come si gioca?</h2>
		<ol>
			<li>Giocatori:Il numero di giocatori consigliato è dai 2 ai 5 giocatori ma volendo anche di più.</li><br>
			<li>Mazzo:Si usano due mazzi da 52 carte compresi i 4 jolly. Le carte hanno i seguenti valori :</li><br>
			<li>Figure: 10 punti;Asso: 11 punti (oppure 1 punto, se usato in Combinazioni A-2-3 o se è l'unica carta in mano);</li><br>
			<li>Jolly: 25 punti in mano oppure il valore della carta che sostituisce, se usato nei Giochi.</li><br>
			<li>Regole:Il mazziere distribuisce in senso orario,una alla volta, 13 carte coperte. 
				Le rimanenti vengono poste al centro del tavolo e ne viene scoperta una. </li><br>
			<li>I giocatori sono chiamati a turno a pescare una carta dal mazzo posto al centro del tavolo e dispongono di tre possibilità:
				mettere la carta al centro del proprio mazzo per creare combinazioni
				calare le carte in mano che hanno un valore totale di almeno 40 punti (ad esempio un tris di assi e uno di tre o 4 re ecc).
				scartare la carta pescata.</li><br>
			<li>Le prime due operazioni possono essere eseguite in qualsiasi ordine; lo scarto indica che il giocatore ha deciso di terminare il proprio turno.
				Il giocatore che cala combinazioni per un totale di 40 punti si dice che ha aperto il gioco. 
				Da questo momento può attaccare carte della sua mano alle combinazioni poste sul tavolo dagli altri giocatori, 
				sostituire un jolly posto sul tavolo da un avversario in una combinazione con la carta mancante (prendendo quest'ultima nel suo mazzo) 
				e pescare l'ultima carta scartata. l giocatore che, dopo aver scartato una carta valida, rimane senza carte, si dice che ha chiuso. </li><br>
			<li>Un giocatore può anche chiudere calando tutte le carte (senza aprire il gioco) ; in questo caso si dice che ha chiuso in mano.
				Alla chiusura i giocatori che non hanno chiuso contano i punti delle carte che hanno ancora in mano e se restano con tutte le carte pagano 100 punti, 
				quindi li sommano al loro punteggio precedente. Se la partita non è finita, si procede ad una nuova mano. 
				In alcune varianti i punti della chiusura in mano valgono doppio.</li><br><br>
			<li>Punteggio:Si stabilisce un punteggio di uscita all'inizio della partita che è solitamente di 301 punti (sono però ammessi anche 101, 151 e 201).</li><br>
			<li>Scopo:Lo scopo del gioco è chiudere il maggior numero di volte possibile eliminando gli avversari. Colui che rimane da solo in gioco è il vincitore.</li>	
		</body>
		
		</html>