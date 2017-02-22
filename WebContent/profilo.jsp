<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin,ConnectionPool.ConnessioneCircolo"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page contentType="text/html; charset=UTF-8" import="java.util.*,Model.*,java.sql.*,Control.*" %>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href=HomePage/IMG/logo.png>
<link href="HomePage/CSS/profilo.css" rel="stylesheet">
<link href="HomePage/CSS/homepage.css" rel="stylesheet">
<script type="text/javascript" src="HomePage/JS/formvalidation_profilo.js"></script>


<title>Profilo</title>
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
	
	<%
		ConnessioneCircolo conn = new ConnessioneCircolo();
		conn.getConnection();
		String select = "SELECT * FROM SOCIO where username=?";
		PreparedStatement pr = conn.prepareStatement(select);
		pr.setString(1, u);
		ResultSet rs = pr.executeQuery();
	%>
		
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
	<h1 id="t">Profilo Personale</h1>
	<br>
		<%
			while(rs.next()){
		%>
		
		<table id="prof">
			<tr>
				<th><span id="prof">UserName:&nbsp;</span><%=rs.getString("Username") %></th>
			</tr>
			<tr>
				<th><span id="prof">Nome:&nbsp;</span><%=rs.getString("Nome") %></th>
			</tr>
			<tr>
				<th><span id="prof">Cognome:&nbsp;</span><%=rs.getString("Cognome") %></th>
			</tr>
			<tr>
				<th><span id="prof">Data Nascita:&nbsp;</span><%=rs.getString("DataNascita") %></th>
			</tr>
			<tr>
				<th><span id="prof">Codice Fiscale:&nbsp;</span><%=rs.getString("CodiceFiscale") %></th>
			</tr>
			<tr>	
				<th><span id="prof">E-mail:&nbsp;</span><%=rs.getString("Email") %></th>
			</tr>
			<tr>
				<th><span id="prof">Tipo:&nbsp;</span><%=rs.getString("Tipo") %></th>
			</tr>
			<tr>
				<th><span id="prof">Telefono:&nbsp;</span><%=rs.getString("Telefono") %></th>
			</tr>
			<tr>
				<th><span id="prof">Città:&nbsp;</span><%=rs.getString("Città") %></th>
			</tr>
			<tr>
				<th><span id="prof">Indirizzo:&nbsp;</span><%=rs.getString("Indirizzo") %></th>
			</tr>
		</table>
		<br>
		
		<div id="add">
			<form method="post">
				<input id="add" type="submit" name="modi" value="Modifica"><br><br>
			</form>
		</div>
		
		<% if(request.getParameter("modi")!= null){ %>
			<div id="mod">
					<form name="profilo" method="post" action="update?azione=modifica&Username=<%=rs.getString("Username")%>" onSubmit="return formValidation_profilo();">
							<fieldset>
								<legend><b>Modifica Profilo</b></legend>
								
								<label for="Email">E-mail:</label><br> 
								<textarea name="Email" maxlength="100" rows="3" placeholder="inserisci e-mail"></textarea><br><br> 
							
								<label for="Password">Password:</label><br>
								<input type="Password" name="Password"><br>
								
								<input id="add" type="submit" name="add" value="invia">
						</fieldset>
						</form>
		</div>
		<%} }%>
	
</body>
</html>