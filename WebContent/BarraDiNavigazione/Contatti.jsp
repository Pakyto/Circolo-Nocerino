<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="Control.CheckLogin" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href="../HomePage/IMG/logo.png">
<link href="../HomePage/CSS/Contatti.css" rel="stylesheet">
<link href="../HomePage/CSS/homepage.css" rel="stylesheet">

<title>Contatti del Nuovo Circolo Nocerino</title>
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
			<li><a href="#">Attività</a>
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
			<li><a href="Statuto.jsp">Statuto</a></li>
			<li class="selected"><a href="Contatti.jsp">Contatti</a></li>
			<%if(uadmin!=null) {%>
			<li><a href="ListaSoci.jsp">Lista Soci</a></li>
			<li><a href="../ordine.jsp">Ordini</a></li>
			<%} %>
		</ul>
	</div>
	<br>
	<br>
	<br>
	<div id="contatti">
	<h1 id="t">Nuovo Circolo Nocerino</h1>
	<h4>
	<table>
			<tr><th><img alt="Home" src="../HomePage/IMG/con_address.png"></th><td>Via Giacomo Canale, 25</td>
			<tr><th></th><td>Nocera Inferiore <br> SA <br> 84014 <br> Italia</td>
			<tr><th><img alt="Email" src="../HomePage/IMG/emailButton.png"></th><td>segreteria@nuovocircolonocerino.it</td>
			<tr><th><img alt="Tel" src="../HomePage/IMG/con_tel.png"></th><td>081917122</td>
			<tr><th><img alt="Cell" src="../HomePage/IMG/con_mobile.png"></th><td>3737528856</td>
			<tr><th><img alt="Site" src="../HomePage/IMG/con_info.png"></th><td>Per informazioni contattare il Presidente
			<tr><th></th><td> Enzo Cuccurullo, inviare un email a enzocuc@libero.it</td>
	</table>
	</h4>
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1511.4037059031866!2d14.6405033654993!3d40.74426307128887!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bb8b4b0408a35%3A0x6727d0eb2ad35b2c!2sVia+Giacomo+Canale%2C+25%2C+84014+Nocera+Inferiore+SA!5e0!3m2!1sit!2sit!4v1463406527396" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
	</div>
	

	
</body>
</html>