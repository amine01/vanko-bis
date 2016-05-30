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
<script src="assets/js/bootstrap-datepicker.js"></script>
<script>
	$(function() {
		$('[class*=" dp"]').datepicker();
	});
</script>
</head>
<body>
	<div class="container">

		<!-- NavBar -->
		<%@ include file="/views/menu/menu.jsp"%>
		<!-- Fin NavBar -->

		<form:form method="POST" action="personne?edit&id=${personne.id}"
			class="form-horizontal" commandName="personne">

			<input type="hidden" name="edit">
<%-- 			<input type="hidden" name="personne_id" value="${personne.id}"> --%>

			<spring:bind path="nom">
				<div id="nom" class="form-group">
					<label for="nom" class="col-sm-2 control-label">Nom</label>
					<div class="col-sm-6">
						<form:input id="nom" class="form-control" type="text"
							path="nom" placeholder="Nom" />
					</div>
					<div class="col-sm-4">
						<span class="help-inline error"><form:errors path="nom" /></span>
					</div>
				</div>
			</spring:bind>
			
			<spring:bind path="prenom">
				<div id="prenom" class="form-group">
					<label for="prenom" class="col-sm-2 control-label">Prénom</label>
					<div class="col-sm-6">
						<form:input id="prenom" class="form-control" type="text"
							path="prenom" placeholder="Prénom" />
					</div>
					<div class="col-sm-4">
						<span class="help-inline error"><form:errors path="prenom" /></span>
					</div>
				</div>
			</spring:bind>
			
			
			<spring:bind path="dateNaissance">
				<div id="dateNaissance" class="form-group">
					<label for="dateNaissance" class="col-sm-2 control-label">Date
						de Naissance</label>
					<div class="col-sm-6">
						<div class="input-group date">
							<form:input class="form-control dp" type="text" path="dateNaissance"
								placeholder="Date de Naissance" readonly="false"
								data-date-format="dd/mm/yyyy" />
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span>
						</div>
					</div>
					<div class="col-sm-4">
						<span class="help-inline error"> <form:errors
								path="dateNaissance" />
						</span>
					</div>
				</div>
			</spring:bind>
			
			
			<button type="submit" class="btn btn-primary">OK</button>
			<a class="btn btn-default" href="${personne.URL}&view">Retour</a>

		</form:form>
	</div>
</body>
</html>