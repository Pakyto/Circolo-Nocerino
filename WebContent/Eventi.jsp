<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin" %>
<%@ page import="ConnectionPool.ConnessioneCircolo" %>
 
<%	Evento evento = (Evento) request.getAttribute("evento");%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page contentType="text/html; charset=UTF-8" import="java.sql.*,Model.*,java.util.*"%>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href="../HomePage/IMG/logo.png">
<link href="HomePage/CSS/Eventi.css" rel="stylesheet">
<link href="HomePage/CSS/homepage.css" rel="stylesheet">

<title>Eventi del Nuovo Circolo Nocerino</title>
</head>
<body>
<header class="top"><img src="HomePage/IMG/logo.png"></header>
	<header class="top1"><h1>NUOVO CIRCOLO NOCERINO</h1></header>
	<%
		HttpSession s = request.getSession();
	
		String u = (String)s.getAttribute("Username");
		String pw=(String)s.getAttribute("Password");
	%>
		<% if(CheckLogin.validate(u,pw)){%>
		<a href="Cart.jsp"><img id="cart" src="HomePage/IMG/cart.png"></a><br>
		<% } %>
		
		<%if(CheckLogin.validate(u,pw)){%>
				<form action="Logout">
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
			<li><a href="HomePage/homepage.jsp">Home</a></li>
			<li><a href="BarraDiNavigazione/News.jsp">News</a></li>
			<li><a href="#">Attività</a>
				<ul>
					<li><a href="BarraDiNavigazione/Sottomenu/cene.jsp">Cena</a></li>
					<li><a href="BarraDiNavigazione/Sottomenu/gite.jsp">Gita</a></li>
					<li><a href="#">Partita <br>
									a <br>
									Carte</a>
									<ul>
										<li><a href="BarraDiNavigazione/Sottomenu/scopa.jsp">Scopa</a></li><br>
										<li><a href="BarraDiNavigazione/Sottomenu/poker.jsp">Poker</a></li><br>
										<li><a href="BarraDiNavigazione/Sottomenu/scala40.jsp">Scala 40</a></li><br>
									</ul>
									</li>
				</ul>
			</li>
			<li class="selected"><a href="Eventi.jsp">Eventi</a></li>			
			<li><a href="#">Chi siamo</a>
				<ul class="ev">
					<li><a href="BarraDiNavigazione/Sottomenu/Storia.jsp">La storia</a></li>
					<li><a href="BarraDiNavigazione/Sottomenu/Galleria.jsp">Galleria <br>
									immagini</a></li>
					<li><a href="BarraDiNavigazione/Contatti.jsp">Dove siamo</a></li>
				</ul>
			</li>
			<%if(CheckLogin.validate(u,pw)){%>
			<li><a href="#">Area Riservata</a>
				<ul>
					<li><a href="profilo.jsp">Profilo</a></li><br>
					<li><a href="ordine.jsp">Ordini</a></li><br>
					<li><a href="Cart.jsp">Carrello</a></li><br>
				</ul>
			</li>
			<%} %>
			<li><a href="#">Catalogo Articoli</a>
				<ul>
					<li><a href="#">Categorie</a>
						<ul class="cat">
							<li><a href="Abbigliamento.jsp">Abbigliamento</a></li><br>
							<li><a href="Gadget.jsp">Accessori</a></li><br>
							<li><a href="Biglietto.jsp">Biglietti</a></li><br>
						</ul>
					</li>
				</ul>
			</li>
			<li><a href="BarraDiNavigazione/Statuto.jsp">Statuto</a></li>
			<li><a href="BarraDiNavigazione/Contatti.jsp">Contatti</a></li>
			<%if(uadmin!=null) {%>
			<li><a href="BarraDiNavigazione/ListaSoci.jsp">Lista Soci</a></li>
			<li><a href="ordine.jsp">Ordini</a></li>
			<%} %>
		</ul>
	</div>

	<h1 id="t">Eventi previsti</h1>
	<%if(uadmin!=null){ %>
	<form method="post">
		<input id="b3" type="submit" name="insert" value="INSERISCI NUOVO EVENTO"/><br><br>
	</form>
	
	<%if(request.getParameter("insert")!=null) {%>   <!-- Quando il tasto è cliccato -->
		<div id="mod">
							<fieldset>
								<legend><b>INSERISCI EVENTO </b></legend>
							<form method="post" action="EventControl?azione=inserisci" >
								<label for="nome">Nome:</label><br> 
								<input type="text" name="Nome"  maxlength="20" required placeholder="inserisci nome"><br><br>
							
								<label for="descrizione">Descrizione:</label><br> 
								<textarea name="Descrizione" maxlength="100" rows="3" required placeholder="inserisci descrizione"></textarea><br><br> 
							
								<label for="data">Data:</label><br>
								<input type="date" name="Data" required><br><br>
							
								<input id="b2" type="submit" name="invia" value="invia">
							</form>
							</fieldset>
						</div>
	<%}} %>
	
	<table>
		<tr>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Data</th>
			<%if(uadmin!=null){ %>
				<th>Azione</th>
			<%} %>
			<th></th>
		</tr>
				                                            <!-- Visualizzazione eventi -->
		
	<%  ProductModel model=new ProductModelDM();
		Collection<?> eventi = (Collection<?>) model.doRetrieveAll("evento");   //Collegato a model:productmodelIDM
		Iterator<?> it = eventi.iterator();
		while (it.hasNext()) {
			Evento ev = (Evento) it.next();
	%>
		<tr>
			<td><%=ev.getNome()%></td>
			<td><%=ev.getDescrizione()%></td>
			<td><%=ev.getData()%></td> 
			<%if(uadmin!=null){ %>
				<td><form method="post" action="EventControl?azione=modifica&nome=<%=ev.getNome()%>">   <!-- Collegato a servlet EventControl-->
					<input id="b1" type="submit" name="mod" value="Modifica"/>
					</form>
					
					
					<button id="d" onclick="window.location='EventControl?azione=cancella&nome=<%=ev.getNome()%>'">Cancella</button>
				</td>
			<%}else{ %>
			<td><form method="post" action="Biglietto.jsp">
				<input id="pr" type="submit" name="acquisto" value="ACQUISTA BIGLIETTO"></form>
			</td>
			<%} %>
		</tr>
	<% } %>
	</table>
	
	<%if(request.getParameter("mod")!=null && evento!=null){%>      <!-- Se il pulsante modifica è cliccato -->
						<div id="mod">
							<fieldset>
								<legend><b>Modifica Evento <%=evento.getNome()%>   </b></legend>
							<form method="post" action="EventControl?azione=confermamodifica&nome=<%=evento.getNome()%>">
								<label for="nome">Nome:</label><br> 
								<input type="text" name="Nome"  maxlength="50" required placeholder="inserisci nome"><br><br>
							
								<label for="descrizione">Descrizione:</label><br> 
								<textarea name="Descrizione" maxlength="100" rows="3" required placeholder="inserisci descrizione"></textarea><br><br> 
							
								<label for="data">Data:</label><br>
								<input type="date" name="Data" required><br><br>
							
								<input id="b2" type="submit" name="invia" value="invia">
							</form>
							</fieldset>
						</div>
			<%} %>

		
</body>
</html>