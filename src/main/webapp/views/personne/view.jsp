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
			<div class="col-sm-12" style="height: 40px;">
				<a href="personne?add" class="btn btn-primary">Add Personne</a> <a
					href="personnes" class="btn btn-primary">Liste des personnes</a>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<img src="http://lorempixel.com/180/130/people/"
					class="img-circle img-responsive img-center" />
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
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<hr>

		<div class="row">
			<div class="col-sm-5">


				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2" style="text-align: center"><h3
									style="margin: 0px 0px">Surnoms</h3></th>
						</tr>
					</thead>
					<c:if test="${personne.surnoms.size()>0}">

						<tbody>
							<c:forEach var="surnom" items="${personne.surnoms}">
								<tr>
									<td><c:out value="${surnom.surnom}" /></td>
									<td><a class="btn btn-warning btn-xs"
										href="${surnom.URL}&edit"><span
											class="glyphicon glyphicon-pencil"></span></a>
										<form method="post" action="${surnom.URL}&delete"
											id="frm_delete_surnom">
											<a class="btn btn-danger btn-xs" data-toggle="modal"
												data-target="#myModalSurnom" id="idBtbnDeleteSurnom"><span
												class="glyphicon glyphicon-trash"></span></a>
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
					<tfoot>
						<tr>
							<th colspan="2" style="text-align: center"><a
								href="surnom?id=${personne.id}&add"
								class="btn btn-success btn-xs"><span
									class="glyphicon glyphicon-plus"></span></a></th>
						</tr>
					</tfoot>

				</table>

			</div>
			<div class="col-sm-7">

				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="3" style="text-align: center;">
								<h3 style="margin: 0px 0px">E-mails</h3>
							</th>
						</tr>
					</thead>
					<c:if test="${personne.mails.size()>0}">
						<tbody>
							<c:forEach var="mail" items="${personne.mails}">
								<tr>
									<td><c:out value="${mail.email}" /></td>
									<td><c:out value="${mail.polar}" /></td>
									<td><a class="btn btn-warning btn-xs"
										href="${mail.URL}&edit"><span
											class="glyphicon glyphicon-pencil"></span></a>

										<form method="post" action="${mail.URL}&delete"
											id="frm_delete_mail">
											<a class="btn btn-danger btn-xs" data-toggle="modal"
												data-target="#myModalMail"><span
												class="glyphicon glyphicon-trash"></span></a>
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
					<tfoot>
						<tr>
							<th colspan="3" style="text-align: center"><a
								href="mail?id=${personne.id}&add" class="btn btn-success btn-xs"><span
									class="glyphicon glyphicon-plus"></span></a></th>
						</tr>
					</tfoot>
				</table>


			</div>
		</div>


		<hr>
		<%-- 		<div class="row">
			<div class="col-sm-12 text-center">
				<c:if test="${personne.personneFonctions.size()>0}">
					<h3 style="margin: 0px; text-align: center">Postes Occupés</h3>
				</c:if>
			</div>
		</div> --%>
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">


				<!-- 	<tr>
							<th colspan="3" style="text-align: center;">
								<h3 style="margin: 0px 0px">E-mails</h3>
							</th>
						</tr> -->




				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="3" style="text-align: center;"><h3>Postes
									Occupés</h3></th>
						</tr>
						<c:if test="${personne.personneFonctions.size()>0}">
							<tr>
								<th>Fonction</th>
								<th>De</th>
								<th>A</th>
								<th></th>
							</tr>
					</thead>

					<tbody>
						<c:forEach var="personneFonction"
							items="${personne.personneFonctions}">
							<tr>
								<td><c:out value="${personneFonction.fonction.fonction}" /></td>
								<td><c:out value="${personneFonction.dateDebut}" /></td>
								<td><c:out value="${personneFonction.dateFin}" /></td>
								<td><a href="${personneFonction.URL}&edit"
									class="btn btn-warning btn-xs"><span
										class="glyphicon glyphicon-pencil"></span></a>
									<form method="post" action="${personneFonction.URL}&delete"
										id="frm_delete_PersonneFonction">

										<a data-toggle="modal" data-target="#myModalPersonneFonction"
											class="btn btn-danger btn-xs"><span
											class="glyphicon glyphicon-trash"></span></a>
									</form></td>
							</tr>
						</c:forEach>
					</tbody>
					</c:if>
					<tfoot>
						<tr>
							<th colspan="3" style="text-align: center"><a
								href="personnefonction?id=${personne.id}&add"
								class="btn btn-success btn-xs"><span
									class="glyphicon glyphicon-plus"></span></a></th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>

		<!-- modal Surnom-->
		<div class="modal fade" id="myModalSurnom" tabindex="-1" role="dialog"
			aria-labelledby="myModalSurnomLabel" aria-hidden="true">
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
							onclick="$('#frm_delete_surnom').submit();">Oui</button>

						<button type="button" class="btn btn-default" data-dismiss="modal">Non</button>
					</div>
				</div>
			</div>
		</div>
		<!-- End Modal -->



		<!-- modal Mail-->
		<div class="modal fade" id="myModalMail" tabindex="-1" role="dialog"
			aria-labelledby="myModalMailLabel" aria-hidden="true">
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
							onclick="$('#frm_delete_mail').submit();">Oui</button>

						<button type="button" class="btn btn-default" data-dismiss="modal">Non</button>
					</div>
				</div>
			</div>
		</div>
		<!-- End Modal -->


		<!-- modal PersonneFonction-->
		<div class="modal fade" id="myModalPersonneFonction" tabindex="-1"
			role="dialog" aria-labelledby="myModalPersonneFonctionLabel"
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
							onclick="$('#frm_delete_PersonneFonction').submit();">Oui</button>

						<button type="button" class="btn btn-default" data-dismiss="modal">Non</button>
					</div>
				</div>
			</div>
		</div>
		<!-- End Modal -->

	</div>
</body>
</html>
