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
<link href="CSS/homepage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="JS/xfade2.js"></script>


<title>Benvenuto nel Nuovo Circolo Nocerino</title>
</head>
<body>
	<header class="top"><img src="IMG/logo.png"></header>
	<header class="top1"><h1>NUOVO CIRCOLO NOCERINO</h1></header>
	
	<%
		HttpSession s = request.getSession();
	
		String u = (String)s.getAttribute("Username");
		String pw=(String)s.getAttribute("Password");
	%>
	
	<% if(CheckLogin.validate(u, pw)){%>                 <!-- Classe checklogin -->
			<a href="../Cart.jsp"><img id="cart" src="IMG/cart.png"></a><br>
	<% } %>
	
	<% if(CheckLogin.validate(u,pw)){%>
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
			<li class="selected"><a href="../HomePage/homepage.jsp">Home</a></li>
			<li><a href="../BarraDiNavigazione/News.jsp">News</a></li>
			<li><a href="#">Attività</a>
				<ul>
					<li><a href="../BarraDiNavigazione/Sottomenu/cene.jsp">Cena</a></li>
					<li><a href="../BarraDiNavigazione/Sottomenu/gite.jsp">Gita</a></li>
					<li><a href="#">Partita <br>
									a <br>
									Carte</a>
									<ul>
										<li><a href="../BarraDiNavigazione/Sottomenu/scopa.jsp">Scopa</a></li><br>
										<li><a href="../BarraDiNavigazione/Sottomenu/poker.jsp">Poker</a></li><br>
										<li><a href="../BarraDiNavigazione/Sottomenu/scala40.jsp">Scala 40</a></li><br>
									</ul>
									</li>
				</ul>
			</li>
			<li><a href="../Eventi.jsp">Eventi</a></li>
			<li><a href="#">Chi siamo</a>
				<ul class="ev">
					<li><a href="../BarraDiNavigazione/Sottomenu/Storia.jsp">La storia</a></li>
					<li><a href="../BarraDiNavigazione/Sottomenu/Galleria.jsp">Galleria <br>
									immagini</a></li>
					<li><a href="../BarraDiNavigazione/Contatti.jsp">Dove siamo</a></li>
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
			<li><a href="../BarraDiNavigazione/Statuto.jsp">Statuto</a></li>
			<li><a href="../BarraDiNavigazione/Contatti.jsp">Contatti</a></li>
			<%if(uadmin!=null) {%>
			<li><a href="../BarraDiNavigazione/ListaSoci.jsp">Lista Soci</a></li>
			<li><a href="../ordine.jsp">Ordini</a></li>
			<%} %>
			
		</ul>
	</div>
	
		
	<div id="tableContainer">								<!-- CONTENITORE TABELLA -->
		<div id="tableRow">									<!-- CONTENITORE RIGA -->
		<section class="sect"><div id="slideshow">
	<img
		src="IMG/circolo1.jpg"
		alt="#"
	/>
	
	<img
		src="IMG/circolo2.jpg"
		alt="#"
	/>
	<img
		src="IMG/circolo3.jpg"
		alt="#"
	/></div>
	</section>
		<section>
		<%if(CheckLogin.validate(u, pw)){ %>
			<article id="log">										<!-- CONTENUTO ARTICLE -->
				<p id="socio"><b>BENTORNATO SOCIO!</b></p><br>
				<form action="../Logout">
					<input id="lo" type="submit" value="Logout">
				</form>
			</article>
		<%} %>
			<%if(!CheckLogin.validate(u, pw)){ %>
			<article id="login">										<!-- CONTENUTO ARTICLE -->
					<fieldset>
							<legend>Accedi/Registrati</legend>
								<form action="../userLogin" method="post">
									Username:<input type="text" name="Username" placeholder="username.." required/><br><br> 	<!-- placeholder:Suggerimento -->
									Password:<input type="password" name="Password" required/><br><br>
									<input type="submit" value="Accedi"/>
								</form>
								<br><br>
							<a href="../Form/form.jsp">
								<input type="button" value="Registrati"/>
							</a>
					</fieldset>
			</article>						
			<%}%>
			<hr>													<!-- DISEGNA RIGA ORIZZONTALE (BORDO) -->
			<footer class="calendar"><h3>Calendario Eventi</h3>
				<a href="../Eventi.jsp"><img src="IMG/calendario.jpg"></a>	
			</footer>
		</section>
		</div>
	</div>	
</body>
</html>