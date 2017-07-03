<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<h1>HTTP Status 403 - Accesul este interzis!</h1>

	<c:choose>
		<c:when test="${empty username}">
			<h2>Ne pare rau, nu aveti permisiunea de a accesa aceasta pagina!</h2>
		</c:when>
		<c:otherwise>
			<h2>Utilizator : ${username} <br/>Ne pare rau, nu aveti permisiunea de a accesa aceasta pagina!</h2>
		</c:otherwise>

	</c:choose>
	<p><a href="/home" class="btn btn-primary">Inapoi</a></p>
</body>
</html>