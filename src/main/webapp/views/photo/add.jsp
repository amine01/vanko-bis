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

		<form:form method="POST" action="photo" class="form-horizontal" enctype="multipart/form-data"
			commandName="photo" >

			<input type="hidden" name="add">
			<input type="hidden" name="personne_id" value="${personne.id}">

			<spring:bind path="file">
				<div id="file" class="form-group">
					<label  class="col-sm-2 control-label">Photo</label>
					<div class="col-sm-6">
						<form:input id="file" class="form-control" type="file" path="file" />
					</div>
					<div class="col-sm-4">
						<span class="help-inline"><form:errors path="fileProvided" /></span>
					</div>
				</div>
			</spring:bind>
			<button type="submit" class="btn btn-primary">OK</button>
			<a class="btn btn-default" href="${personne.URL}&view">Retour</a>

		</form:form>
	</div>
</body>
</html>