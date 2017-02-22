<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin" %>
    
<% Abbigliamento abb = (Abbigliamento) request.getAttribute("abbigliamento");
   Cart carrello=(Cart) request.getAttribute("carrello");   
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page contentType="text/html; charset=UTF-8" import="java.util.*,Model.*" %>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href="HomePage/IMG/logo.png">
<link href="HomePage/CSS/Articoli.css" rel="stylesheet">
<link href="HomePage/CSS/homepage.css" rel="stylesheet">
<link href="HomePage/CSS/Abbigliamento.css" rel="stylesheet">

<title>Abbigliamento</title>
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
	
	<% if(CheckLogin.validate(u,pw)){%>
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
			<li><a href="Eventi.jsp">Eventi</a></li>
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
			<li class="selected"><a href="#">Catalogo Articoli</a>
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
	
<h2>Catalogo Abbigliamento</h2>
<%if(uadmin!=null){ %>
	<form method="post">
		<input id="b3" type="submit" name="insert" value="INSERISCI NUOVO ARTICOLO"/><br><br>
	</form>
	
	<%if(request.getParameter("insert")!=null){ %>  <!-- Se il pulsante inserisci è cliccato -->
		<div id="mod">
							<fieldset>
								<legend><b>INSERISCI ARTICOLO</b></legend>
								<form method="post" action="productab2?azione=inserisci"> <!-- Collegato a servlet ProductControlAb -->
								<label for="codice">Codice:</label><br>
								<input type="text" name="Codice" required placeholder="inserisci codice"><br><br>
								
								<label for="descrizione">Descrizione:</label><br> 
								<textarea name="Descrizione" maxlength="99" rows="3" required placeholder="inserisci descrizione"></textarea><br><br> 
							
								<label for="quantità">Quantità:</label><br>
								<input type="number" value="0" name="Quantita" required><br>
							
								<label for="prezzo">Prezzo:</label><br>
								<input type="number"  min="00.01" step="00.01" value="00.00" name="Prezzo" required><br>
								
								<input id="b2" type="submit" name="invia" value="invia">
							</form>
							</fieldset>
		</div>
	<%}} %>

	<table>
		<tr>
			<th>Codice</th>
			<th>Descrizione</th>
			<th>Prezzo</th>
			<th>Azione</th>
		</tr>
		<%  ProductModel model=new ProductModelDM();
		Collection<?> abbigliamento = (Collection<?>) model.doRetrieveAll("abbigliamento"); //Collegato a ProductModelIDM
		Iterator<?> it = abbigliamento.iterator();
		while (it.hasNext()) {
			 Abbigliamento bean = (Abbigliamento) it.next();      
		%>
		<tr>
			<td><%=bean.getCodice()%></td>                     <!-- Stampa codice di ogni prodotto, ecc -->
			<td><%=bean.getDescrizione()%></td>
			<td>&#8364; <%=bean.getPrezzo() %></td>
			
			<td>
			<%if (uadmin!=null){ %>
			<button id="d" onclick="window.location='productab2?azione=cancella&id=<%=bean.getCodice()%>'">Cancella</button>
			<form method="post" action="productab2?azione=modifica&id=<%=bean.getCodice()%>">
					<input id="d" type="submit" name="mod" value="Modifica"/>
			</form>			
			<%} %>
			
			<form method="post" action="productab2?azione=dettagli&id=<%=bean.getCodice()%>">
				<input id="d" type="submit" name="dettagli" value="Dettagli">
			</form>
			<%if(uadmin==null){ %>
			<form method="post" action="productab2?azione=aggiungialCarrello&id=<%=bean.getCodice()%>">
				<input id="add" type="submit" name="add" value="Aggiungi al carrello"><br><br>
				<br><br><label for="quantità">Qtà:</label> 
				<input type="text" name="quantita" maxlength="3"  size="1" required />
			</form>
			<%} %>	
			</td>
		</tr>
		<%} %>
	</table>
		
	<%if(request.getParameter("dettagli")!=null && abb!=null){%>  <!-- Pulsante cliccato -->
	<h2>Dettagli prodotto</h2>
	<table>
		<tr>
			<th>Codice</th>
			<th>Descrizione</th>
			<th>Prezzo</th>
			<th>Quantità</th>
		</tr>
		<tr>
			<td><%=abb.getCodice()%></td>               <!-- visualizzazione prodotti -->
			<td><%=abb.getDescrizione()%></td>
			<td>&#8364; <%=abb.getPrezzo()%></td>
			<td><%=abb.getQuantità()%></td>
			
		</tr>
	</table>
	<%}%>
	
	<%if(request.getParameter("mod")!=null && abb!=null){%>
		<div id="mod">
							<fieldset>
								<legend><b>Modifica Articolo <%=abb.getCodice()%>   </b></legend>
							<form method="post" action="productab2?azione=confermamodifica&id=<%=abb.getCodice()%>">
								
								<label for="descrizione">Descrizione:</label><br> 
								<textarea name="Descrizione" maxlength="100" rows="3" required placeholder="inserisci descrizione"></textarea><br><br> 
							
								<label for="quantità">Quantità:</label><br>
								<input type="number" value="0" name="Quantita" required><br>
							
								<label for="prezzo">Prezzo:</label><br>
								<input type="number"  min="00.01" step="00.01" value="00.00" name="Prezzo" required><br>
								
								<input id="b2" type="submit" name="invia" value="invia">
							</form>
							</fieldset>
		</div>
	
	<%} %>		
</body>
</html>
