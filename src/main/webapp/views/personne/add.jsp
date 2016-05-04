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
	
	
	
		<a class="btn btn-primary" href="personnes">Liste de Recherche</a>


		<form:form method="POST" action="personne" id="add-personne-form" class="form-horizontal"  commandName="personne">

			<fieldset>
				<legend>Personne:</legend>
				<input type="hidden" name="add" />
				
				<spring:bind path="nom">
					<div id="nom" class="form-group">
						<label for="nom" class="col-sm-2 control-label">Nom</label>
						<div class="col-sm-6">
							<form:input id="nom" class="form-control" type="text" path="nom"
								placeholder="Nom" />
						</div>
						<div class="col-sm-4">
							<span class="help-inline"><form:errors path="nom" /></span>
						</div>
					</div>
				</spring:bind>

				<spring:bind path="prenom">
					<div id="prenom" class="form-group">
						<label for="prenom" class="col-sm-2 control-label">Prénom</label>
						<div class="col-sm-6">
							<form:input id="prenom" class="form-control" type="text" path="prenom"
								placeholder="Prénom" />
						</div>
						<div class="col-sm-4">
							<span class="help-inline"><form:errors path="prenom" /></span>
						</div>
					</div>
				</spring:bind>


				<spring:bind path="dateNaissance">
					<div id="dateNaissance" class="form-group">
						<label for="dateNaissance" class="col-sm-2 control-label">Date De Naissance</label>
						<div class="col-sm-6">
							<form:input id="dateNaissance" class="form-control" type="text"
								path="dateNaissance" placeholder="Date de Naissance" />
						</div>
						<div class="col-sm-4">
							<span class="help-inline"><form:errors path="dateNaissance" /></span>
						</div>
					</div>
				</spring:bind>
			</fieldset>

			<!--  information generales sur le surnom -->

			<fieldset id="sr">

				<legend>Surnom:</legend>

				<button class="btn btn-success" type="button" onclick="addSurnom(); return false;">
				<span class="glyphicon glyphicon-plus"></span>
				</button>
			
				<spring:bind path="surnoms[0].surnom">
					<div id="surnoms[0].surnom" class="form-group">
						<label for="surnoms[0].surnom" class="col-sm-2 control-label">Surnom</label>
						<div class="col-sm-6">
							<form:input id="surnoms[0].surnom" class="form-control" type="text" path="surnoms[0].surnom"
								placeholder="Surnom" />
						</div>
						<div class="col-sm-4">
							<span class="help-inline"><form:errors path="surnoms[0].surnom" /></span>
						</div>
					</div>
				</spring:bind>

			</fieldset>

			<!-- sur ses emails -->
			<fieldset id="emails">
				<legend>Email:</legend>
				
				<button class="btn btn-success" type="button" onclick="addEmail(); return false;">
				<span class="glyphicon glyphicon-plus"></span>
				</button>				
								
				<spring:bind path="emails[0].email">
					<div id="emails[0].email" class="form-group">
						<label for="emails[0].email" class="col-sm-2 control-label">E-mail</label>
						<div class="col-sm-6">
							<form:input id="emails[0].email" class="form-control" type="text" path="emails[0].email"
								placeholder="E-mail" />
						</div>
						<div class="col-sm-4">
							<span class="help-inline"><form:errors path="emails[0].email" /></span>
						</div>
					</div>
				</spring:bind>				
				
				<spring:bind path="emails[0].pola">
					<div id="emails[0].pola" class="form-group">
						<label for="emails[0].pola" class="col-sm-2 control-label">Polariser ?</label>
						<div class="col-sm-2">
							<form:select name="polariser" path="emails[0].pola" class="form-control">
								<form:option value="true">Oui</form:option>
								<form:option value="false">Non</form:option>
							</form:select>
						</div>
						<div class="col-sm-8">
							<span class="help-inline"><form:errors path="emails[0].pola" /></span>
						</div>
					</div>
				</spring:bind>	

			</fieldset>

			<!-- sur ses Fonction -->
			<fieldset id="fonctions">
				<legend>Fonctions:</legend>
				<button class="btn btn-success" type="button" onclick="addFonction(); return false;">
					<b><span class="glyphicon glyphicon-plus"></span></b>
				</button>
				
				<spring:bind path="personneFonctions[0].fonction.fonction">
					<div id="personneFonctions[0].fonction.fonction" class="form-group">
						<label for="personneFonctions[0].fonction.fonction"
							class="col-sm-2 control-label">Fonction</label>
						<div class="col-sm-6">
							<form:input type="text" placeholder="Fonction"
								path="personneFonctions[0].fonction.fonction" name="fonction"
								value=""  class="form-control"/>
						</div>
						<div class="col-sm-4">
							<span class="help-inline"> <form:errors
									path="personneFonctions[0].fonction.fonction" />
							</span>
						</div>
					</div>
				</spring:bind>


				<spring:bind path="personneFonctions[0].dateDebut">
					<div id="personneFonctions[0].dateDebut" class="form-group">
						<label for="personneFonctions[0].dateDebut"
							class="col-sm-2 control-label">Date de début</label>
						<div class="col-sm-6">
							<form:input type="text"
								path="personneFonctions[0].dateDebut" name="personneFonctions[0].dateDebut"
								value=""  class="form-control"/>
						</div>
						<div class="col-sm-4">
							<span class="help-inline"> <form:errors
									path="personneFonctions[0].dateDebut" />
							</span>
						</div>
					</div>
				</spring:bind>



				<spring:bind path="personneFonctions[0].dateFin">
					<div id="personneFonctions[0].dateFin" class="form-group">
						<label for="personneFonctions[0].dateFin"
							class="col-sm-2 control-label">Date de fin</label>
						<div class="col-sm-6">
							<form:input type="text"
								path="personneFonctions[0].dateFin" name="personneFonctions[0].dateFin"
								value=""  class="form-control"/>
						</div>
						<div class="col-sm-4">
							<span class="help-inline"> <form:errors
									path="personneFonctions[0].dateFin" />
							</span>
						</div>
					</div>
				</spring:bind>


			</fieldset>
			<button type="submit" class="btn btn-primary">Save changes</button>

		</form:form>
	</div>
</body>
</html>