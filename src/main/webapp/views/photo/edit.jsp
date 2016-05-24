<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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

		<table class="table table-striped">
			<c:if test="${personne.photos.size()>0}">

				<tbody>
					<c:forEach var="photo" items="${personne.photos}">
						<tr>
							<td><img src="images/${photo.nomPhoto}"	width="250" height="150"></td>
							<td><form method="post" action="${photo.URL}&delete"
									id="frm_delete_photo">
									<a class="btn btn-danger btn-xs" data-toggle="modal"
										data-target="#myModalPhoto" id="idBtbnDeletePhoto"><span
										class="glyphicon glyphicon-trash"></span></a>
								</form></td>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>
 			<tfoot>
				<tr>
					<th>
						<a class="btn btn-warning" href="${personne.URL}&view"><span class="glyphicon glyphicon-share-alt"></span> Retour</a>
					</th>
				</tr>
			</tfoot>
		</table>
		
		
		<!-- modal photo-->
		<div class="modal fade" id="myModalPhoto" tabindex="-1"
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
							onclick="$('#frm_delete_photo').submit();">Oui</button>

						<button type="button" class="btn btn-default" data-dismiss="modal">Non</button>
					</div>
				</div>
			</div>
		</div>
		<!-- End Modal -->

	</div>
</body>
</html>