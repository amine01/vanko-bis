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

		<a class="btn btn-primary" href="personne?add">Add Personne</a> <br>
		<br>


		<form action="personnes" method="POST" class="form-horizontal">
			<div id="nom" class="form-group">
				<div class="col-sm-10">
					<input type="hidden" name="search"> <input type="text" value="${keywordsearch}"
						name="keywordsearch" class="form-control" placeholder="Recherche par Nom, Prénom, Surnom, E-mail ou Fonction">
				</div>
				<div class="col-sm-2">
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-search"></span>
					</button>
					<a href="personnes" class="btn btn-default"><span
						class="glyphicon glyphicon-refresh"></span></a>
				</div>
			</div>
		</form>

		<c:if test="${personnes.size()>0}">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="bg-primary">
						<th style="width:8%" class="text-center">Nom</th>
						<th style="width:8%" class="text-center">Prénom</th>
						<th style="width:14%" class="text-center">Mails</th>
						<th style="width:62%" class="text-center">Postes</th>
						<th  style="width:8%" class="text-center"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="personne" items="${personnes}">
						<tr class="text-center">
							<td><c:out value="${personne.nom}" /></td>
							<td><c:out value="${personne.prenom}" /></td>
							<td>
								<table style="width: 100%" class="table table-striped table-hover">
									<thead>
											<tr class="bg-info">
												<td class="text-center" style="width: 80%"><strong>E-mail</strong></td>
												<td class="text-center" style="width: 20%"><strong>Pola.?</strong></td>
											</tr>
										</thead>
									<c:forEach var="mail" items="${personne.mails}">
										<tr>
										<td><small>${mail.email}</small></td>
										<td>${mail.polar}</td>
										</tr>
									</c:forEach>
								</table>
							</td>

							<td>
								<table style="width: 100%" class="table table-striped table-hover">
									<thead>
											<tr class="bg-info">
												<td  class="text-center"  style="width: 15%"><strong>DE</strong></td>
												<td  class="text-center"  style="width: 15%"><strong>A</strong></td>
												<td  class="text-center"  style="width: 70%"><strong>POSTE</strong></td>
											</tr>
										</thead>
									<c:forEach var="personnefonction" items="${personne.personneFonctions}">
										
										<tr>
											<td>${personnefonction.dateDebut}</td>
											<td>${personnefonction.dateFin}</td>
											<td><small>${personnefonction.fonction.fonction}</small></td>
										</tr>
									</c:forEach>
								</table>
							</td>

							<%-- <td><c:out value="${personne.mails.size()}" /></td> --%>
							<%-- <td><c:out value="${personne.personneFonctions.get(0).fonction.fonction}" /></td> --%>

							<td><a class="btn btn-warning btn-xs"
								href="${personne.URL}&view" title="Voir"><span
									class="glyphicon glyphicon-pencil"></span></a>
								<form method="post" action="${personne.URL}&delete"
									id="frm_delete_personne">
									<a data-target="#myModalPersonne" data-toggle="modal"
										class="btn btn-danger btn-xs" title="Supprimer"><span
										class="glyphicon glyphicon-trash"></span></a>
								</form></td>


							<%-- 		
								<form method="post" action="${surnom.URL}&delete"
											id="frm_delete_surnom">
											<a class="btn btn-danger btn-xs" data-toggle="modal"
												data-target="#myModalSurnom" id="idBtbnDeleteSurnom"><span
												class="glyphicon glyphicon-trash"></span></a>
										</form> --%>

						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="pagination">
				<ul class="pagination">
					<!-- previous -->
					<c:if test="${currentPage !=1}">
						<li><a href="personnes?page=${currentPage -1 }">
								Précédent</a></li>
					</c:if>

					<!-- Liens pagination -->
					<c:forEach begin="1" end="${noOfPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<li class="active"><a> <strong>${i}</strong></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="personnes?page=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!-- next pagination -->
					<c:if test="${currentPage lt noOfPages}">
						<li><a href="personnes?page=${currentPage + 1}"> Suivant</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<!-- modal PersonneFonction-->
		<div class="modal fade" id="myModalPersonne" tabindex="-1"
			role="dialog" aria-labelledby="myModalPersonneLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Confirmation Suppression</h4>
					</div>
					<div class="modal-body">
						<p>êtes-vous sûr ?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							onclick="$('#frm_delete_personne').submit();">Oui</button>


						<button type="button" class="btn btn-default" data-dismiss="modal">Non</button>
					</div>
				</div>
			</div>
		</div>
		<!-- End Modal -->
	</div>
</body>
</html>

