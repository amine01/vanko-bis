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

<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>

</head>
<body>
	<div class="container">
		
		<a class="btn btn-primary" href="personne?add">Add Personne</a>
		 <br>
		 <hr>
		<!-- Fin NavBar -->
		<c:if test="${personnes.size()>0}">
			<table id="entity"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="text-center">
						<th>Nom</th>
						<th>Prénom</th>
						<th>Date de Naissance</th>
						<th>Nombre d'Adresse Mail</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${personnes}" var="personne">
						<tr class="text-center">
							<td>${personne.nom}</td>
							<td>${personne.prenom}</td>
							<td>${personne.dateNaissance}</td>
							<td><c:out value="${personne.mails.size()}" /></td>
							<td><a class="btn btn-warning btn-xs"
								href="${personne.URL}&edit" title="Modifier"><span
									class="glyphicon glyphicon-pencil"></span></a> <a
								class="btn btn-primary btn-xs" href="${personne.URL}&view"
								title="Voir"><span class="glyphicon glyphicon-eye-open"></span></a>
								<form method="post" action="${personne.URL}&delete"
									id="frm_delete_personne">
									<a data-target="#myModalPersonne" data-toggle="modal"
										class="btn btn-danger btn-xs" title="Supprimer"><span
										class="glyphicon glyphicon-trash"></span></a>
								</form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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
		<script type="text/javascript">
			$(document).ready(function() {
				
				$('#entity').DataTable( {
			        "aLengthMenu": [[3, 9, 15, -1], [3, 9, 15, "All"]],

				})
		
			});
		</script>





	</div>
</body>
</html>

