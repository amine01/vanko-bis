<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/custom_app.css">

<!--JS -->
<script src="assets/jquery/jquery.js"></script>
<script src="assets/js/customapp.js"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>
	<div class="container">


		<!-- NavBar -->
		<nav class="navbar navbar-inverse">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">BRAND</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Choix 1</a></li>
					<li><a href="#">Choix 2</a></li>
					<li><a href="#">Choix 3</a></li>
					<li><a href="#">Choix 4</a></li>
					<li class="dropdown"><a href="#" class="dropdwon-toggle"
						data-toggle="dropdown">Choix 5 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Choix 5.1</a></li>
							<li><a href="#">Choix 5.2</a></li>
							<li><a href="#">Choix 5.3</a></li>

						</ul></li>

				</ul>
			</div>

		</nav>
		<!-- Fin NavBar -->



		<div class="row">
			<div class="col-sm-12" style="height:40px;">
				<a href="personne?add" class="btn btn-primary">Add Personne</a>
				<a href="personnes" class="btn btn-primary">Liste des personnes</a>
			</div>
		</div>
		<div class="row"> 
			<div class="col-sm-4">
				<img src="http://lorempixel.com/180/130/people/" class="img-circle img-responsive img-center" />
			</div>
			<div class="col-sm-6 ">
				<table class="table table-striped">
					<tbody>
						<tr>
							<td><strong>Nom Complet</strong></td>
							<td><c:out value="${personne.nom} ${personne.prenom}" /></td>
						</tr>

						<tr>
							<td><strong>Date de Naissance</strong></td>
							<td><c:out value="${personne.dateNaissance}" /></td>
						</tr>

						<tr>
							<td><strong>Poste Occupé</strong></td>
							<td><c:out
									value="${personne.personneFonctions.get(0).fonction.fonction}" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<hr>
		
		<div class="row">
			<div class="col-sm-5">
				<%-- <c:if test="${personne.surnoms.size()>0}"><h3 style="margin:0px;text-align:center">Surnoms</h3></c:if> --%>
				<c:if test="${personne.surnoms.size()>0}">

					<table class="table table-striped" >
						<thead>
							<tr >
								<th colspan="2" style="text-align: center;"><h3 style="margin: 0px 0px">Surnoms</h3></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="surnom" items="${personne.surnoms}">

								<tr>
									<td><c:out value="${surnom.surnom}" /></td>
									<td><a class="btn btn-warning btn-xs" href="${surnom.URL}&edit"><span class="glyphicon glyphicon-pencil"></span></a>
									<a href="${surnom.URL}&delete" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
			<div class="col-sm-7">
				<c:if test="${personne.emails.size()>0}">
						<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="3" style="text-align: center;">
									<h3 style="margin: 0px 0px">E-mails</h3>
								</th>
							</tr>
						</thead>
						<c:forEach var="email" items="${personne.emails}">
							<tr>
								<td><c:out value="${email.email}" /></td>
								<td><c:out value="${email.pola}" /></td>
								<td><a class="btn btn-warning btn-xs"
									href="${email.URL}&edit"><span
										class="glyphicon glyphicon-pencil"></span></a> <a
									href="${email.URL}&delete" class="btn btn-danger btn-xs"><span
										class="glyphicon glyphicon-trash"></span></a></td>
							</tr>
						</c:forEach>
						</table>
			
				</c:if>
			</div>
		</div>

		
		<hr>
		<div class="row">
			<div class="col-sm-12 text-center">
				<c:if test="${personne.personneFonctions.size()>0}"><h3 style="margin:0px;text-align:center">Postes Occupés</h3></c:if>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<c:if test="${personne.personneFonctions.size()>0}">
					<table class="table table-striped">
						<tr>
							<th>Fonction</th>
							<th>De</th>
							<th>A</th>
							<th></th>
						</tr>
						<c:forEach var="personneFonction"
							items="${personne.personneFonctions}">
							<tr>
								<td><c:out value="${personneFonction.fonction.fonction}" /></td>
								<td><c:out value="${personneFonction.dateDebut}" /></td>
								<td><c:out value="${personneFonction.dateFin}" /></td>
								<td>
									<a href="${personneFonction.URL}&edit" class="btn btn-warning btn-xs"><span class="glyphicon glyphicon-pencil"></span></a> 
									<a class="btn btn-danger btn-xs"  href="${personneFonction.URL}&delete"> <span class="glyphicon glyphicon-trash"></span></a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
		</div>

		<!-- 	<hr>
		<h2>Photos</h2> -->
		<%-- 	<c:if test="${personne.photos.size()>0}">
		<table border="1">
			<tr>
				<th>Photo</th>
				<th></th>
			</tr>
			<c:forEach var="photo" items="${personne.photos}">
				<tr>
					<td><img src="images/${photo.nomPhoto}" alt="Smiley face"
						width="42" height="42"></td>
					<td><a href="${photo.URL}&delete"> Delete </a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if> --%>
	</div>
</body>
</html>
