<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Pagina de autentificare</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/login.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body onload='document.loginForm.username.focus();'>
<div class="container">
	<h3 class="text-center text-primary">Pagina de autentificare a platformei RuralPrenor </h3>
	<span><a href="/home"><h3 class="text-left glyphicon glyphicon-circle-arrow-left">Home</h3></a></span>
	<div id="login-box">

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='loginForm'
			action="<c:url value='/login' />" method='POST'>

				<div class="form-group">
						<input class="form-control" placeholder="Username" type='text' name='username'>
				</div>
				<div class="form-group">
						<input class="form-control" placeholder="Parola" type='password' name='password' />
				</div>

				<input class="btn btn-primary btn-block" name="submit" type="submit" value="Login" />

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<p>Membru nou? <a href="/register" class="">Inregistrare</a></p>
		</form>
	</div>
</div>
</body>
</html>