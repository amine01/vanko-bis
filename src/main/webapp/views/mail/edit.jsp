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
		<%@ include file="/views/menu/menu.jsp"%>
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
						<span class="help-inline error"><form:errors path="email" /></span>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="polar">
				<div id="polar" class="form-group">
					<label for="polar" class="col-sm-2 control-label">Polariser
						?</label>
					<div class="col-sm-6">
						<form:select name="polariser" path="polar" class="form-control">
							<form:option value="" />
							<form:option value="Oui" />
							<form:option value="Non" />
						</form:select>
					</div>
					<div class="col-sm-4">
						<span class="help-inline error"><form:errors path="polar" /></span>
					</div>
				</div>
			</spring:bind>

			<button type="submit" class="btn btn-primary">
				<span class="glyphicon glyphicon-thumbs-up"></span> Enregistrer
			</button>
			<a class="btn btn-warning" href="${personne.URL}&view"><span
				class="glyphicon glyphicon-share-alt"></span> Retour</a>

		</form:form>
	</div>
</body>
</html>