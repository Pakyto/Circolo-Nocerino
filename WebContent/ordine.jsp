<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Control.CheckLogin" %>
<%@ page import="ConnectionPool.ConnessioneCircolo" %>
<%@page contentType="text/html; charset=UTF-8" import="java.util.*,Model.*,java.sql.*,java.sql.ResultSet" %>
<%@ page session="true"%>

<%!
ArrayList<Integer> getNumfatt(String username)throws SQLException{   //restituisce la lista degli id delle fatture di un determinato utente
		ArrayList<Integer>nfatt=new ArrayList<Integer>();
		ConnessioneCircolo conn=new ConnessioneCircolo();
		String select="SELECT ID FROM FATTURA WHERE USERNAME=?";
		PreparedStatement ps=conn.prepareStatement(select);
		ps.setString(1, username);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			nfatt.add(rs.getInt("id"));
		}
		return nfatt;
}

ResultSet query(int id)throws SQLException{
	ConnessioneCircolo con=new ConnessioneCircolo();
	String select="SELECT art.codice,art.descrizione,f.importo,f.spedito FROM FATTURA as f,Articolo as art,HA as h where f.id=? and f.id=h.id and h.codice=art.codice";
	PreparedStatement prd=con.prepareStatement(select);
	prd.setInt(1, id);
	ResultSet rs=prd.executeQuery();
	return rs;
}

ResultSet query2(int id)throws SQLException{
	ConnessioneCircolo con=new ConnessioneCircolo();
	String select="SELECT h.Quantità,h.ID,f.Data FROM FATTURA as f,HA as h where f.id=? and f.id=h.id";
	PreparedStatement prd=con.prepareStatement(select);
	prd.setInt(1, id);
	ResultSet rs=prd.executeQuery();
	return rs;
}

float getTotal(int id)throws SQLException{
	ConnessioneCircolo con=new ConnessioneCircolo();
	String select="SELECT IMPORTO FROM FATTURA WHERE id=?";
	PreparedStatement prd=con.prepareStatement(select);
	prd.setInt(1, id);
	ResultSet rs=prd.executeQuery();
	float tot=0;
	while(rs.next()){
		tot=rs.getFloat("Importo");
	}
	return tot;
}

%>

<html>
<meta charset="UTF-8">
<meta name="description" content="circolo nocerino">
<meta name="author" content="Nuovo circolo nocerino,Nocera Inferiore">
<link rel="icon" href="HomePage/IMG/logo.png">
<link href="HomePage/CSS/ordine.css" rel="stylesheet">
<link href="HomePage/CSS/homepage.css" rel="stylesheet">
<link href="HomePage/CSS/Cart.css" rel="stylesheet">


<title>Ordini</title>
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
			<li class="selected"><a href="ordine.jsp">Ordini</a></li>
			<%} %>
		</ul>
	</div>		
	<h2>		
	<div id="left" style="margin-left:auto; margin-right:auto; width: 48%;">
				<%if(uadmin == null){%>
					<p><i>ORDINI UTENTE:"<%=u %>"</u></i></p>
				
				<%for(int n: getNumfatt(u)){%>
				
				<p>FATTURA N.<%=n %></p>
				
				<table class="formdata">
					<tr>
						<th style="width: 25%">Codice Articolo</th>
						<th style="width: 25%">Descrizione</th>
						<th style="width: 25%">Prezzo</th>
						<th style="width: 25%">Data</th>
						<th style="width: 25%">Quantità scelta</th>
						<th style="width: 25%">Spedito</th>
					</tr>
					<%ResultSet rs=query(n);
					  ResultSet rs2=query2(n);
					  	while(rs.next()&& rs2.next()){%>
					<tr> 
						<td><%=rs.getString("codice") %></td>
						<td><%=rs.getString("descrizione") %></td>
						<td><%=rs.getString("Importo") %></td>
						<td><%=rs2.getString("Data")%> </td>
						<td><%=rs2.getString("Quantità") %></td>
						<td><%=rs.getString("Spedito") %></td>
					</tr>
					<% }%>					
				</table>
				Totale: <span style="font-size: x-large; color: red;"><%=getTotal(n)%> &#8364;</span>
				<br><br>
				<%}%>
				<%} %>
						
				<% if(uadmin != null) { %>
					<table class="formdata">
					<tr>
						<th>Codice Articolo</th>
						<th>ID Fattura</th>
						<th>Quantità scelta</th>
						<th>Data</th>
						<th>Importo</th>
						<th>Spedito</th>
						<th>Username</th>
						
					</tr>
						<%
						ConnessioneCircolo conn = new ConnessioneCircolo();
						conn.getConnection();
						String select = "SELECT * FROM ha AS h,FATTURA as f where h.id=f.id";
						PreparedStatement pr = conn.prepareStatement(select);
						ResultSet rs = pr.executeQuery();
						while(rs.next()){%>
						<tr> 
							<td><%=rs.getString("codice") %></td>
							<td><b><u><%=rs.getString("ID") %></u></b></td>
							<td><%=rs.getString("Quantità") %></td>
							<td><%=rs.getString("Data")%></td>
							<td><%=rs.getString("Importo") %></td>
							<td><%=rs.getString("Spedito") %></td>
							<td><b><u><%=rs.getString("Username") %></u></b></td>
						</tr>
					<% } %>
					</table>
										
					<h2><u>ORDINI DA CONFERMARE</u></h2><br>
					
					<table class="formdata">
					<tr>
						<th>ID Fattura</th>
						<th>Data</th>
						
					</tr>
					<%
						ConnessioneCircolo connect = new ConnessioneCircolo();
						connect.getConnection();
						String select1 = "select distinct id,data from fattura where spedito='NO'";
						PreparedStatement pr1 = conn.prepareStatement(select1);
						ResultSet rs1 = pr1.executeQuery();
						while(rs1.next()){%>
						<tr> 
							<td><b><u><%=rs1.getString("ID")%></u></b></td>
							<td><%=rs1.getString("Data")%></td>
							<td >
								<button id="d" onclick="window.location='Ordine?azione=modifica&id=<%=rs1.getString("ID")%>'">CONFERMA SPEDIZIONE</button>
							</td>
						</tr>
					<% } %>
					</table>
					
					<br><br>
										
					<% }%>					
				</div>
			
	</h2>

</body>
</html>