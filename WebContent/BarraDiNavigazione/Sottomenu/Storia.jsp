<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href="IMG/logo.png">
<link href="../../HomePage/CSS/storia.css" rel="stylesheet">
<link href="../../HomePage/CSS/homepage.css" rel="stylesheet">
<script type="text/javascript" src="JS/xfade2.js"></script>

<title>Attività del Nuovo Circolo Nocerino</title>
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
			<li><a href="../../HomePage/homepage.jsp">Home</a></li>
			<li><a href="../News.jsp">News</a></li>
			<li><a href="#">Attività</a>
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
			<li class="selected"><a href="#">Chi siamo</a>
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
	</div>
	<h1 id="t">La Storia</h1>
	<br><br>
	<div id="testo" style="width:1000px; text-align:center;
  box-shadow:  7px 7px 3px ; height:70px; background-color: rgba(10,200,200,0.1); border:2px solid black;">
        Il “Nuovo Circolo Nocerino”fondato dal Senatore Sellitti e da altri soci nel 1991 situato a Nocera Inferiore(SA),<br>
		offre la possibilità ai propri iscritti  di svolgere diverse attività, a 
		fronte di piccole spese e nella collaborazione reciproca di tutti.<br>
		In esso è allestito l’ufficio di amministrazione, una zona bar/ristorazione, una zona con tavoli da gioco e una zona 
		dedicata alla visione delle partite, oltre lo shop online. Per utilizzare i servizi del circolo occorre iscriversi alla 
		piattaforma online.<br>
		</div>
	<img id="sede" src="../../HomePage/IMG/sede.jpg" alt="circolo" />
</body>
</html>