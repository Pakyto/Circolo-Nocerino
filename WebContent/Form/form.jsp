<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href="../IMG/logo.png">
<link href="form.css" rel="stylesheet">
<link href="../HomePage/CSS/homepage.css" rel="stylesheet">
<script type="text/javascript" src="../HomePage/JS/formvalidation.js"></script>
<title>Registrazione</title>
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
			<form action="Logout">
					<input id="qwe" type="submit" value="Logout" >
				</form>
			<p class="log">Benvenuto amministratore <%=uadmin %> &nbsp;</p>
	<%}%>
	
	<div id="nav">													<!-- NAVIGATION BAR -->
		<ul>
			<li><a href="../HomePage/homepage.jsp">Home</a></li>
			<li><a href="../BarraDiNavigazione/News.jsp">News</a></li>
			<li><a href="#">Attività</a>
				<ul>
					<li><a href="Sottomenu/cene.jsp">Cena</a></li>
					<li><a href="Sottomenu/gite.jsp">Gita</a></li>
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
					<li><a href="../Ordine.jsp">Ordini</a></li><br>
					<li><a href="#">Lista <br>
									 prenotazioni</a></li><br>
					<li><a href="../Cart.jsp">Carrello</a></li><br>
				</ul>
			</li>
			<%} %>
			
			<li><a href="#">Catalogo Articoli</a>
				<ul>
					<li><a href="#">Articoli Scontati</a></li>
					<li><a href="#">Categorie</a>
						<ul class="cat">
							<li><a href="../Abbigliamento.jsp">Abbigliamento</a></li><br>
							<li><a href="../Gadget.jsp">Accessori</a></li><br>
							<li><a href="../Biglietti.jsp">Biglietti</a></li><br>
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
		<div id="for">
		<h2 class="form">Registrazione al Circolo Nocerino</h2>
		<form name="registration" action="../Registrationservlet" onSubmit="return formValidation();"  method="post" > <!--JS -->
				Username: <input type="text" name="Username" /><br>
				<br>Nome: <input type="text" name="Nome"/><br>
				<br> Cognome: <input type="text" name="Cognome" /><br>
				<br> Data di nascita: <input type="date" name="Data di nascita" required /><br>
				<br> Codice Fiscale: <input type="text" name="CodiceFiscale" /><br>
				<br> Email: <input type="text" name="Email"/><br>
				<br>Tipo:<br> 
						<select name="Tipo">
   	    					<option value="Socio Semplice">Socio Semplice<br></option>
   	    					<option value="Socio Azionista">Socio Azionista<br></option>
   	    				</select><br>
				<br> Telefono: <input type="text" name="Telefono"/><br>
				<br> Citta': <input type="text" name="Citta"/><br>
				<br> Indirizzo: <input type="text" name="Indirizzo"/><br>
				<br> Password: <input type="password" name="Password" /><br>
				<br> Conferma Password: <input type="password" name="Confermapassword" /><br>
				
				<br>
				<input type="submit" name="invia" value="Invia"/><br><br>
				<input type="reset" value="Reset">
		</form>
		
		</div>
		
			
		<div id="for1">
		<h2 class="form1">Se sei già registrato loggati</h2>
			<form action="../userLogin" method="post">
					Username:<input type="text" name="Username" value="" placeholder="username.." required/><br><br> 	<!-- placeholder:Suggerimento -->
					Password:<input type="password" name="Password" value="" required/><br><br>
					<input type="submit" value="Accedi"/></a>
			</form>
		</div>
</body>
</html>