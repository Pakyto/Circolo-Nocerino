<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin" %>
   
<%
		HttpSession f=request.getSession();
		String uadmin=(String)f.getAttribute("username");
		String pwadmin=(String)f.getAttribute("password");
%>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page contentType="text/html; charset=UTF-8" import="java.sql.*,Model.*,java.util.*"%>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href="IMG/logo.png">
<link href="../HomePage/CSS/homepage.css" rel="stylesheet">
<link href="../HomePage/CSS/listasoci.css" rel="stylesheet">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista Soci</title>
</head>
<body>

<%if(uadmin==null){ %>
	<script>
		alert('Per accedere a questa pagina devi essere amministratore');
		window.open("http://localhost:8080/PROGETTO_CIRCOLO/HomePage/homepage.jsp","_self");
	</script>
<%}
else{ %>
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
		
		
		<%if(uadmin!=null){%>
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
					<li><a href="#">Ordini</a></li><br>
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
			<li class="selected"><a href="ListaSoci.jsp">Lista Soci</a></li>
			<li><a href="../ordine.jsp">Ordini</a></li>
			<%} %>
		</ul>
	</div>
	
	<br>
	<br>
	<br>
	<table>
		<tr>
			<th>Username</th>
			<th>Nome</th>
			<th>Cognome</th>
			<th>Data di nascita</th>
			<th>Codice Fiscale</th>
			<th>Email</th>
			<th>Tipo</th>
			<th>Telefono</th>
			<th>Città</th>
			<th>Indirizzo</th>
		</tr>
		
		<%  ProductModel model=new ProductModelDM();
		Collection<?> soci = (Collection<?>) model.doRetrieveAll("socio");
		Iterator<?> it = soci.iterator();
		
		while (it.hasNext()) {
			Socio sc = (Socio) it.next();
		%>
		<tr>
			<td><%=sc.getUsername()%></td>
			<td><%=sc.getNome()%></td>
			<td><%=sc.getCognome() %></td>
			<td><%=sc.getDatanascita()%></td>
			<td><%=sc.getCodicefiscale()%></td>
			<td><%=sc.getEmail() %></td>
			<td><%=sc.getTipo() %></td>
			<td><%=sc.getTelefono()%></td>
			<td><%=sc.getCittà() %></td>
			<td><%=sc.getIndirizzo()%></td>
		</tr>
		<%} %>
	</table>
<%} %>
</body>
</html>