<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 4/10/2017
  Time: 10:39 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Register to RuralPrenor</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/register.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />" >
</head>
<body>
<div class="container">
    <h3 class="text-center text-primary">Inregistrare pe platforma RuralPrenor </h3>
    <span><a href="/home"><h3 class="text-left glyphicon glyphicon-circle-arrow-left">Home</h3></a></span>

    <div id="register-box">

    <form:form class="form-horizontal" action="saveUser" method="POST" modelAttribute="user">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <fieldset>
            <div class="form-group">
                <div class="controls">
                    <form:input path="username" class="form-control" placeholder="Nume utilizator"/>
                    <p class="help-block">Numele de utilizator poate contine doar litere sau cifre</p>
                </div>
            </div>

            <div class="form-group">
                <div class="controls">
                    <form:input path="email" class="form-control" placeholder="E-mail" />
                    <p class="help-block">Introduceti o adresa de e-mail valida</p>
                </div>
            </div>

            <div class="form-group">
                <div class="controls">
                    <form:input path="address" class="form-control" placeholder="Adresa" />
                    <p class="help-block">Introduceti adresa dvs. Format preferat: judet,localitate,strada,numar</p>
                </div>
            </div>

            <div class="form-group">
                <div class="controls">
                    <form:password path="password" class="form-control" placeholder="Parola" />
                    <p class="help-block">Introduceti o parola complexa pentru o securitate mai sporita</p>
                </div>
            </div>

            <div class="form-group">
                <!-- Button -->
                <div class="controls">
                    <button class="btn btn-primary btn-block">Creeaza cont</button>
                </div>
            </div>
        </fieldset>
    </form:form>
    </div>
</div>
</body>
</html>