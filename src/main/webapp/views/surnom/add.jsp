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

		<form:form method="POST" action="surnom" class="form-horizontal"
			commandName="surnom">

			<input type="hidden" name="add">
			<input type="hidden" name="personne_id" value="${personne.id}">

			<spring:bind path="surnom">
				<div id="surnom" class="form-group">
					<label for="surnom" class="col-sm-2 control-label">Surnom</label>
					<div class="col-sm-6">
						<form:input id="surnom" class="form-control" type="text"
							path="surnom" placeholder="Surnom" />
					</div>
					<div class="col-sm-4">
						<span class="help-inline"><form:errors path="surnom" /></span>
					</div>
				</div>
			</spring:bind>
			<button type="submit" class="btn btn-primary">OK</button>
			<a class="btn btn-default" href="${personne.URL}&view">Retour</a>

		</form:form>
	</div>
</body>
</html>