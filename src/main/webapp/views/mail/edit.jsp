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

		<form:form method="POST" action="mail?edit&id=${mail.id}"
			class="form-horizontal" commandName="mail">

			<input type="hidden" name="edit">
			<input type="hidden" name="personne_id" value="${personne.id}">

			<spring:bind path="email">
				<div id="email" class="form-group">
					<label for="email" class="col-sm-2 control-label">E-mail</label>
					<div class="col-sm-6">
						<form:input id="email" class="form-control" type="text"
							path="email" placeholder="E-mail" />
					</div>
					<div class="col-sm-4">
						<span class="help-inline"><form:errors path="email" /></span>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="polar">
				<div id="polar" class="form-group">
					<label for="polar" class="col-sm-2 control-label">Polariser ?</label>
					<div class="col-sm-6">
						<form:select name="polariser" path="polar" class="form-control">
							<form:option value=""/>
							<form:option value="Oui"/>
							<form:option value="Non"/>
						</form:select>
					</div>
					<div class="col-sm-4">
						<span class="help-inline"><form:errors path="polar" /></span>
					</div>
				</div>
			</spring:bind>

			<button type="submit" class="btn btn-primary">Editer</button>
			<a class="btn btn-default" href="${personne.URL}&view">Back</a>

		</form:form>
	</div>
</body>
</html>