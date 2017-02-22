<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href="IMG/logo.png">
<link href="CSS/homepage.css" rel="stylesheet">
<script type="text/javascript" src="JS/xfade2.js"></script>

<title>Benvenuto nel Nuovo Circolo Nocerino</title>
</head>
<body>
	<header class="top"><img src="IMG/logo.png"></header>
	<header class="top1"><h1>NUOVO CIRCOLO NOCERINO</h1></header>
	
	<div id="nav">													<!-- NAVIGATION BAR -->
		<ul>
			<li class="selected"><a href="../HomePage/homepage.jsp">Home</a></li>
			<li><a href="../BarraDiNavigazione/News.jsp">News</a></li>
			<li><a href="#">Attività</a>
				<ul>
					<li><a href="#">Prenota</a></li>
					<li><a href="#">Cena</a></li>
					<li><a href="#">Gita</a></li>
					<li><a href="#">Partita <br>
									a <br>
									Carte</a>
									<ul>
										<li><a href="#">Scopa</a></li><br>
										<li><a href="#">Ramino</a></li><br>
										<li><a href="#">Poker</a></li><br>
										<li><a href="#">Scala 40</a></li><br>
									</ul>
									</li>
				</ul>
			</li>
			<li><a href="#">Eventi</a>
				<ul class="ev">
					<li><a href="#">Eventi <br> 
									Passati</a></li>
					<li><a href="#">Eventi 
									<br>in 
									<br>Corso</a></li>
					<li><a href="#">Prossimi 
									<br> Eventi</a></li>
				</ul>
			</li>
			<li><a href="#">Chi siamo</a>
				<ul class="ev">
					<li><a href="../BarraDiNavigazione/Sottomenu/Storia.jsp">La storia</a></li>
					<li><a href="../BarraDiNavigazione/Sottomenu/Galleria.jsp">Galleria <br>
									immagini</a></li>
					<li><a href="../BarraDiNavigazione/Contatti.jsp">Dove siamo</a></li>
				</ul>
			</li>
			<li><a href="#">Area Riservata</a>
				<ul>
					<li><a href="#">Area Socio</a></li><br>
					<li><a href="#">Profilo</a></li><br>
					<li><a href="#">Ordini</a></li><br>
					<li><a href="#">Lista <br>
									 prenotazioni</a></li><br>
					<li><a href="#">Carrello</a></li><br>
				</ul>
			</li>
			<li><a href="#">Catalogo Articoli</a>
				<ul>
					<li><a href="#">Articoli Scontati</a></li>
					<li><a href="#">Categorie</a>
						<ul>
							<li><a href="#">Abbigliamento</a></li><br>
							<li><a href="#">Accessori</a></li><br>
						</ul>
					</li>
				</ul>
			</li>
			<li><a href="../BarraDiNavigazione/Statuto.jsp">Statuto</a></li>
			<li><a href="../BarraDiNavigazione/Contatti.jsp">Contatti</a></li>
		</ul>
	</div>
	
		
	<div id="tableContainer">								<!-- CONTENITORE TABELLA -->
		<div id="tableRow">									<!-- CONTENITORE RIGA -->
		<section class="sect"><div id="slideshow">
	<img
		src="IMG/terra.jpg"
		alt="Terra"
	/>
	<img
		src="IMG/fuoco.jpg"
		alt="Fuoco"
	/>
	<img
		src="IMG/aria.jpg"
		alt="Aria"
	/>
	<img
		src="IMG/acqua.jpg"
		alt="Acqua"
	/></div>
	</section>
		<section>
			<article>										<!-- CONTENUTO ARTICLE -->
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
			<hr>													<!-- DISEGNA RIGA ORIZZONTALE (BORDO) -->
			<footer class="calendar"><h3>Calendario Eventi</h3>
				<a href="../BarraDiNavigazione/Eventi.jsp"><img src="IMG/calendario.jpg"></a>	
			</footer>
		</section>
		</div>
	</div>	
</body>
</html>