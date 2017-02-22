<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href="IMG/logo.png">
<link href="../HomePage/CSS/homepage.css" rel="stylesheet">
<link href="../HomePage/CSS/News.css" rel="stylesheet">

<title>News del Nuovo Circolo Nocerino</title>
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
			<li class="selected"><a href="News.jsp">News</a></li>
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
			<li><a href="Contatti.jsp">Contatti</a></li>
			<%if(uadmin!=null) {%>
			<li><a href="ListaSoci.jsp">Lista Soci</a></li>
			<li><a href="../ordine.jsp">Ordini</a></li>
			<%} %>
		</ul>
	</div>
	<div><br><br><br>
	<h1 id="ti">News della settimana</h1><br><br>
	
	<img id="news1" src="../HomePage/IMG/news1.jpg" /><br><br>
	
	<p id="eve">Gli eventi e le News verranno postati qui</p><br><br>
	</div><h2 id="to">
	
<div id="uno" style="width:600px;background: rgba(80,80,80,0.2); border-radius:20px;box-shadow: 5px 5px 3px ;  text-align:center; height:100px; border:2px solid ;">
	NEWS Evento previsto per il giorno 16/08/2016:
                Si informano i partecipanti all'evento  previsto per il  giorno
                 16/06/2016 che il seguente evento è stato spostato al giorno 
                 17/06/2016 alla stessa ora.</div>
                 
<div id="due" style="width:600px;background: rgba(80,80,80,0.2); border-radius:20px;box-shadow: 5px 5px 3px ;text-align:center; height:100px; border:2px solid ;">
                NEWS Evento gita in montagna,sono state effettuate le 
                registrazioni dell'evento Vela che si terrà il giorno 
                30/08/2016 il seguente itinerario è stato aggiornato.</div>
                
<div id="tre" style="width:600px;background: rgba(80,80,80,0.2); border-radius:20px;box-shadow: 5px 5px 3px ; text-align:center; height:100px; border:2px solid ;">
	NEWS Evento previsto per il giorno 16/08/2016:
                Si informano i partecipanti all'evento  previsto per il  giorno
                 16/06/2016 che il seguente evento è stato spostato al giorno 
                 17/06/2016 alla stessa ora.</div>
                 
<div id="quattro" style="width:600px;background: rgba(80,80,80,0.2);border-radius:20px;box-shadow: 5px 5px 3px ; text-align:center; height:100px; border:2px solid ;">
                NEWS Evento gita previsto per il giorno 4/05/2017,la gita prevista per la località di Avellino,è stata 
				rimandata al giorno successivo per problemi riguardanti il trasporto</div>
				
<div id="cinque" style="width:600px;background: rgba(80,80,80,0.2); border-radius:20px;box-shadow: 5px 5px 3px ; text-align:center; height:100px; border:2px solid ;">
	NEWS Evento previsto per il giorno 16/08/2016:
                Si informano i partecipanti all'evento  previsto per il  giorno
                 16/06/2016 che il seguente evento è stato spostato al giorno 
                 17/06/2016 alla stessa ora.</div>
                 
 <div id="sei" style="width:600px;background: rgba(80,80,80,0.2); border-radius:20px;box-shadow: 5px 5px 3px ; text-align:center; height:100px; border:2px solid ;">
                NEWS Evento gita in montagna,sono state effettuate le 
                registrazioni dell'evento Vela che si terrà il giorno 
                30/08/2016 il seguente itinerario è stato aggiornato.</div>
                
 <div id="sette" style="width:600px;background: rgba(80,80,80,0.2); border-radius:20px;box-shadow: 5px 5px 3px ; text-align:center; height:100px; border:2px solid ;">
	NEWS Evento previsto per il giorno 16/08/2016:
                Si informano i partecipanti all'evento  previsto per il  giorno
                 16/06/2016 che il seguente evento è stato spostato al giorno 
                 17/06/2016 alla stessa ora.</div>
                 
<div id="otto" style="width:600px;background: rgba(80,80,80,0.2); border-radius:20px;box-shadow: 5px 5px 3px ; text-align:center; height:100px; border:2px solid ;">
                NEWS Evento gita in montagna,sono state effettuate le 
                registrazioni dell'evento Vela che si terrà il giorno 
                30/08/2016 il seguente itinerario è stato aggiornato.</div>
<div id="nove" style="width:600px;background: rgba(80,80,80,0.2); border-radius:20px; box-shadow: 5px 5px 3px ;text-align:center; height:100px; border:2px solid ;">
	NEWS Evento previsto per il giorno 16/08/2016:
                Si informano i partecipanti all'evento  previsto per il  giorno
                 16/06/2016 che il seguente evento è stato spostato al giorno 
                 17/06/2016 alla stessa ora.</div>
                 
<div id="dieci" style="width:600px;background: rgba(80,80,80,0.2); border-radius:20px;box-shadow: 5px 5px 3px ; text-align:center; height:100px; border:2px solid ;">
                NEWS Evento gita in montagna,sono state effettuate le 
                registrazioni dell'evento Vela che si terrà il giorno 
                30/08/2016 il seguente itinerario è stato aggiornato.</div>
<div id="undici" style="width:600px;background: rgba(80,80,80,0.2); border-radius:20px; box-shadow: 5px 5px 3px ;text-align:center; height:100px; border:2px solid ;">
	NEWS Evento previsto per il giorno 16/08/2016:
                Si informano i partecipanti all'evento  previsto per il  giorno
                 16/06/2016 che il seguente evento è stato spostato al giorno 
                 17/06/2016 alla stessa ora.</div>
                 
<div id="dodici" style="width:600px;background: rgba(80,80,80,0.2); border-radius:20px;box-shadow: 5px 5px 3px ; text-align:center; height:100px; border:2px solid ;">
                NEWS Evento gita in montagna,sono state effettuate le 
                registrazioni dell'evento Vela che si terrà il giorno 
                30/08/2016 il seguente itinerario è stato aggiornato.</div>
<div id="tredici" style="width:600px;background: rgba(80,80,80,0.2); border-radius:20px;box-shadow: 5px 5px 3px ; text-align:center; height:100px; border:2px solid ;">
	NEWS Evento previsto per il giorno 16/08/2016:
                Si informano i partecipanti all'evento  previsto per il  giorno
                 16/06/2016 che il seguente evento è stato spostato al giorno 
                 17/06/2016 alla stessa ora.</div>
                 
<div id="quattordici" style="width:600px;background: rgba(80,80,80,0.2);border-radius:20px;box-shadow: 5px 5px 3px ; text-align:center; height:100px; border:2px solid ;">
                NEWS Evento gita in montagna,sono state effettuate le 
                registrazioni dell'evento Vela che si terrà il giorno 
                30/08/2016 il seguente itinerario è stato aggiornato.</div>


                
 
	</h2>

</body>
</html>