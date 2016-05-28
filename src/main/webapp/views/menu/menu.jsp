<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- NavBar -->
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">BRAND</a>
		</div>
		<div>

			<c:set var="absoluteUrl"
				value="${pageContext.request.getRequestURI()}" />

			<c:set var="length"
				value="${pageContext.request.getRequestURI().length()}" />

			<c:set var="url" value="${fn:substring(absoluteUrl,13,length)}" />

			<ul class="nav navbar-nav">
				<li <c:if test="${url=='personne/list.jsp'}">class="active"</c:if>><a
					href="personnes">Accueil</a></li>
				<li class="dropdown"
					<c:if test="${url=='/personnes'}">class="active"</c:if>><a
					href="#" class="dropdwon-toggle" data-toggle="dropdown">Pola.<b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li <c:if test="${url=='personne/add.jsp'}">class="active"</c:if>><a
							href="personne?add">Nouveau</a></li>
						<li <c:if test="${url=='personne/list.jsp'}">class="active"</c:if>><a
							href="personnes">Recherche</a></li>
					</ul></li>
				<!-- 

				<li><a href="#">Choix 2</a></li>
				<li><a href="#">Choix 3</a></li>
				<li><a href="#">Choix 4</a></li>
			 -->
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value="/j_spring_security_logout" />"><span
						class="glyphicon glyphicon-log-out"></span>Se Déconnecter</a></li>
			</ul>

		</div>
	</div>
</nav>
<!-- Fin NavBar -->