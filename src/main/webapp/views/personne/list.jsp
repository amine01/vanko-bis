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
				<li ><a href="#">Choix 2</a></li>
				<li ><a href="#">Choix 3</a></li>
				<li ><a href="#">Choix 4</a></li>
				<li class="dropdown">
					<a href="#" class="dropdwon-toggle" data-toggle="dropdown">Choix 5 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li ><a href="#">Choix 5.1</a></li>
						<li ><a href="#">Choix 5.2</a></li>
						<li ><a href="#">Choix 5.3</a></li>
					
					</ul>
				
				</li>
				
			</ul>
		</div>
	
	</nav>
	<!-- Fin NavBar -->
		
	<a class="btn btn-primary" href="personne?add">Add Personne</a>
	<br>
	<br>


		
		<form action="" method="POST" class="form-horizontal">
				<div id="nom" class="form-group">
					<div class="col-sm-11">
						<input type="text" name="worksearch" class="form-control"
							placeholder="Mot-clé">
					</div>
					<div class="col-sm-1">
					<a class="btn btn-primary" ><span class="glyphicon glyphicon-search"></span></a>
						<!-- <input type="submit" value="search" class="btn btn-primary"> -->
					</div>
				</div>
			</form>
		
	<c:if test="${personnes.size()>0}">
		<table class="table table-striped table-bordered table-hover">
			<thead >
				<tr class="bg-info text-center" style="text-align: center;">
					<th >Nom</th>
					<th >Prénom</th>
					<th >Date de Naissance</th>
					<th >Nombre d'Adresse Mail</th>
					<th >Dernière fonction occupée/Actuelle</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="personne" items="${personnes}">
					<tr class="text-center">
						<td><c:out value="${personne.nom}" /></td>
						<td><c:out value="${personne.prenom}" /></td>
						<td><c:out value="${personne.dateNaissance}" /></td>
						
						<td><c:out value="${personne.mails.size()}" /></td>
						<%-- <td><c:out value="${personne.personneFonctions.get(0).fonction.fonction}" /></td> --%>
						
						<td>
							<a class="btn btn-warning btn-xs" href="${personne.URL}&edit" title="Modifier"><span class="glyphicon glyphicon-pencil"></span></a>  
							<a class="btn btn-primary btn-xs" href="${personne.URL}&view" title="Voir"><span class="glyphicon glyphicon-eye-open"></span></a>
							<a class="btn btn-danger btn-xs" href="${personne.URL}&delete" title="Supprimer"><span class="glyphicon glyphicon-trash"></span></a>    
						
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="pagination">
				<ul class="pagination">
					<!-- previous -->
					<c:if test="${currentPage !=1}">
						<li><a href="personnes?page=${currentPage -1 }"> Précédent</a></li>
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
	</div>
</body>
</html>

