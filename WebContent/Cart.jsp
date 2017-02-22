<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin,ConnectionPool.*,com.mysql.jdbc.PreparedStatement,java.sql.*,Control.*" %>
<%@ page session="true"%>
<%!
float total(Cart cart) {
	float total = 0;
	for ( Articolo item : cart.getItems() ) {
		total += item.getPrezzo() * cart.getOrder(item);
	}
	return total;
}

%>  
      
<% Cart cart=(Cart)request.getSession().getAttribute("carrello"); %>

<html>
<%@page contentType="text/html; charset=UTF-8" import="java.util.*,Model.*,Control.*" %>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href="HomePage/IMG/logo.png">
<link href="HomePage/CSS/Articoli.css" rel="stylesheet">
<link href="HomePage/CSS/homepage.css" rel="stylesheet">
<link href="HomePage/CSS/Cart.css" rel="stylesheet">


<title>Carrello</title>
</head>
<body>
<%
HttpSession s = request.getSession();
String u = (String)s.getAttribute("Username");
String pw=(String)s.getAttribute("Password");

%>
<header class="top"><img src="HomePage/IMG/logo.png"></header>
	<header class="top1"><h1>NUOVO CIRCOLO NOCERINO</h1></header>
	
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
					<li class="selected"><a href="Cart.jsp">Carrello</a></li><br>
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
<%if(cart==null){ %>     
	<h2>CARRELLO VUOTO</h2>
<%}
else{%>
	
	<h2>		
	<div id="left" style="margin-left:auto; margin-right:auto; width: 48%;">
			
				<p>CARRELLO</p>
				<table class="formdata">
					<tr>
						<th style="width: 25%">Descrizione</th>
						<th style="width: 25%">Prezzo</th>
						<th style="width: 25%">Quantità scelta</th>
						<th style="width: 25%"></th>
						<th style="width: 25%">Totale parziale</th>
					</tr>
					<% 
					Articolo[] catalogueItems = cart.getItems().toArray(new Articolo[0]); //array di articoli all'interno del carrello
					for( Articolo aCatalogueItem : catalogueItems ){  
					%> 
							<tr>
								<td><%= aCatalogueItem.getDescrizione() %></td>
								<td> &#8364; <%= aCatalogueItem.getPrezzo() %> </td>
								<td><%= cart.getOrder(aCatalogueItem) %></td>  <!-- restituisce la quantità scelta -->
								<td>
									<form method="post" action="Ordine?azione=cancella&id=<%=aCatalogueItem.getDescrizione()%>">                
										<input id="del" type="submit" name="delete" value="Elimina dal carrello">
									</form>	
								</td>
								<td>&#8364; <%=(float)aCatalogueItem.getPrezzo()*cart.getOrder(aCatalogueItem) %> </td>							
							</tr>
					<% } %>
					
				</table>			
				<p><br>
				Totale: <span style="font-size: x-large; color: red;"><%=total(cart) %> &#8364;</span>
				<%if(CheckLogin.validate(u,pw)){ %>
				<form name="ord" method="post" action="Ordine?azione=checkout&Username=<%=u%>&Totale=<%=total(cart) %>">
					<input id="del1" type="submit" name="check" value="Conferma ordine">
				</form>
				<%}else{%>
					<br><br><h5>PER CONFERMARE IL TUO ORDINE DEVI ACCEDERE AL SITO</h5>
				<%} %>
				</p>			
			</div>
	</h2>
<%} %>

<%if(request.getParameter("check")!=null){  //se conferma ordine è cliccato
		Articolo[] catalogueItems = cart.getItems().toArray(new Articolo[0]);
		ConnessioneCircolo con=new ConnessioneCircolo();
		con.getConnection();
		PreparedStatement prd=null;
		
		for( Articolo aCatalogueItem : catalogueItems ){ 
			int qt=cart.getOrder(aCatalogueItem);
			String update="UPDATE ARTICOLO set Quantità=Quantità-? WHERE Codice=?";
			prd=con.prepareStatement(update);
			prd.setInt(1, qt);
			prd.setString(2, aCatalogueItem.getCodice());
			prd.executeUpdate();
		}
		con.close();
		request.getSession().removeAttribute("carrello");  //svuota carrello
		%>
	<script>
		alert('ORDINE CONFERMATO!');
		alert('Stai per essere reindirizzato nella sezione ORDINI per vedere il suo stato');
		window.open("http://localhost:8080/PROGETTO_CIRCOLO/ordine.jsp","_self");
	</script>
	<%}%>
	

</body>
</html>