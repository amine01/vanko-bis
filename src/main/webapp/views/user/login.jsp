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
		<div id="loginbox"
			class="mainbox col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3">

			<div class="row">
				<div class="iconmelon">
					<svg viewBox="0 0 60 32">
                <g filter="">
                  <use xlink:href="#git"></use>
                </g>
              </svg>
				</div>
			</div>



			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title text-center"><strong>Authentification</strong></div>
				</div>
				<div class="panel-body">

					<form name="loginForm" id="form" class="form-horizontal"
						method="POST" action="<c:url value='j_spring_security_check' />">


						<div class="input-group">
							<c:if test="${not empty param.error}">
								<div class="error"> Erreur d'identification. Reason : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</div>
							</c:if>
						</div>



						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input id="user"
								type="text" class="form-control" name='j_username' value=""
								placeholder="Login">
						</div>

						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="password"
								type="password" class="form-control" name='j_password'
								placeholder="Mot de passe">
						</div>

						<div class="form-group">
							<!-- Button -->
							<div class="col-sm-12 controls">
								<button type="submit" name="submit"
									class="btn btn-primary pull-right">
									<i class="glyphicon glyphicon-log-in"></i> Log in
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>