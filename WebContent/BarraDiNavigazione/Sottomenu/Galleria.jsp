<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href="../../HomePage/IMG/logo.png">
<link href="../../HomePage/CSS/homepage.css" rel="stylesheet">
<link href="../../HomePage/CSS/Galleria.css" rel="stylesheet">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../../HomePage/JS/animation.js"></script>

<title>Galleria del Nuovo Circolo Nocerino</title>
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
	<div>
	<h1 id="t">Galleria</h1>
	</div>
	<div id="gall">
       		<img class="img-zoom" src="../../HomePage/IMG/circolo1.jpg" alt="circolo" />
       		
       		<img class="img-zoom" src="../../HomePage/IMG/circolo2.jpg" alt="circolo" /><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   
   		 	<img class="img-zoom" src="../../HomePage/IMG/circolo3.jpg" alt="circolo" />
 
   		 	<img class="img-zoom" src="../../HomePage/IMG/circolo4.jpg" alt="circolo" /><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  
   		 	<img class="img-zoom" src="../../HomePage/IMG/circolo5.jpg" alt="circolo" />
    
   		 	<img class="img-zoom" src="../../HomePage/IMG/circolo6.jpg" alt="circolo" /><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   
   		 	<img class="img-zoom" src="../../HomePage/IMG/circolo7.jpg" alt="circolo" />

   		 	<img class="img-zoom" src="../../HomePage/IMG/circolo8.jpg" alt="circolo" />
   	</div>
   		 	

		
</body>
</html>