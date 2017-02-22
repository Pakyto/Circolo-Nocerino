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
		<link href="../../HomePage/CSS/cene.css"  rel="stylesheet">
		<link href="../../HomePage/CSS/homepage.css" rel="stylesheet">
		<title> Qui vengono elencate tutte le cene programma</title>
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
			<li class="selected"><a href="#">Attività </a>
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
	
	<h1 class="cena">Qui vengono elencate tutte le cene in programma</h1>
	<img src="../../HomePage/IMG/cene.jpg">
	
	<h2 class="cena">Cena prevista per  Venerdi 17 Giugno </h2>
	
	<p class="cena"> Menù:
	</p>
	<ol>
		<li>Cervello di vitello fritto, ostrica, mandorla di Toritto e Cavolfiore </li>
		<li> Zacapa Reserva 23</li>
		<li>Risotto con trippa di pesce veloce del Baltico (baccalà)</li>
		<li>Zacapa  Etiqueta negra</li>
		<li>Fegato di vitello con cipolla in saor di zafferano, battuto di scampi e crema di zucca</li>
		<li>Zacapa Etiqueta Negra</li>
		<li>Pane e cioccolato con zabaione al Zacapa</li>
	</ol>
		
		
		<h2 class="cena">Cena prevista per Sabato 25 Giugno</h2>
		<p class="cena">Menù:</p>
		<ol>
			<li>Burratina con senape in grani, sgombro speziato e misticanza dell'orto</li>
			<li>Busiate integrali di grani antichi con tonno rosso, ciliegio, basilico,mentuccia olio e aceto</li>
			<li>Macedonia di verdure con polpo, calamaro, aguglia imperiale conestratto di carota olio e soia al bbq</li>
		    <li>Zacapa Etiqueta Negra</li>
			<li>Ricottamisà,  pan di spagna al cioccolato fondente bagnato al caffè conricotta vaccina</li>
			<li>Zacapa Etiqueta Negra</li>
		    <li>Pane e cioccolato con zabaione al Zacapa</li>
		
		</ol>
		<h2 class="cena">Cena prevista per Mercoledì 30 Giugno</h2>
		<p class="cena">Menù:</p>
		<ol>
			<li>Fiocco di prosciutto crudo di Parma e salame</li>
			<li>Insalata ricca</li>
			<li>Bresaola con uvetta, canditi e castelmagno</li>
			<li>Insalata di gamberi con funghi porcini</li>
			<li>Salmone affumicato con mele, finocchi e aceto balsamico</li>
			<li>Risotto con calamaretti, basilico e bottarga</li>
			<li>Ravioli verdi al caprino di fossa</li>
			<li>Carrà di vitello al rosmarino</li>
			<li>Tagliata di filetto di manzo al pepe</li>
			<li>Patate duchessa</li>
			<li>Sorbetto ai frutti di bosco</li>
			<li>Caffè </li>
		</ol>
</body>
</html>