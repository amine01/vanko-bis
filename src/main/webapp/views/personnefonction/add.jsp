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

		<form:form method="POST" action="personnefonction"
			class="form-horizontal" commandName="personnefonction">

			<input type="hidden" name="add">
			<input type="hidden" name="personne_id" value="${personne.id}">

			<spring:bind path="fonction.fonction">
				<div id="fonction.fonction" class="form-group">
					<label for="email" class="col-sm-2 control-label">Fonction</label>
					<div class="col-sm-6">
						<form:input class="form-control" type="text"
							path="fonction.fonction" placeholder="Fonction" />
					</div>
					<div class="col-sm-4">
						<span class="help-inline"><form:errors
								path="fonction.fonction" /></span>
					</div>
				</div>
			</spring:bind>

			<spring:bind path="dateDebut">
				<div id="dateDebut" class="form-group">
					<label for="dateDebut" class="col-sm-2 control-label">Date
						de d�but</label>
					<div class="col-sm-6">
						<div class="input-group date">
							<form:input class="form-control dp" type="text" path="dateDebut"
								placeholder="Date de D�but" readonly="false"
								data-date-format="dd/mm/yyyy" />
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span>
						</div>

					</div>
					<div class="col-sm-4">
						<span class="help-inline"> <form:errors path="dateDebut" />
						</span>
					</div>
				</div>
			</spring:bind>



			<spring:bind path="dateFin">
				<div id="dateFin" class="form-group">
					<label for="dateFin" class="col-sm-2 control-label">Date de
						fin</label>
					<div class="col-sm-6">
						<div class="input-group date">
							<form:input class="form-control dp" type="text" path="dateFin"
								placeholder="Date de D�but" readonly="false"
								data-date-format="dd/mm/yyyy" />
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span>
						</div>
					</div>
					<div class="col-sm-4">
						<span class="help-inline"> <form:errors path="dateFin" />
						</span>
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