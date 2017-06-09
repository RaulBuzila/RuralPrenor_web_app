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

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />" >
</head>
<body>

    <h1>Inregistrare pe site</h1>

    <div class="container col-md-4 col-md-offset-3">
    <form:form class="form-horizontal" action="saveUser" method="POST" modelAttribute="user">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <fieldset>
            <div class="control-group">
                <!-- Username -->
                <form:label path="username" class="control-lab">Nume utilizator:</form:label>
                <div class="controls">
                    <form:input path="username"/>
                    <p class="help-block">Numele de utilizator poate contine doar litere sau cifre</p>
                </div>
            </div>

            <div class="control-group">
                <!-- E-mail -->
                <form:label path="email" class="control-label">E-mail</form:label>
                <div class="controls">
                    <form:input path="email"/>
                    <p class="help-block">Introduceti o adresa de e-mail valida</p>
                </div>
            </div>

            <div class="control-group">
                <!-- Address -->
                <form:label path="address" class="control-label" >Adresa</form:label>
                <div class="controls">
                    <form:input path="address"/>
                    <p class="help-block">Introduceti adresa dvs. Format preferat: judet,localitate,strada,numar</p>
                </div>
            </div>

            <div class="control-group">
                <!-- Password-->
                <form:label path="password" class="control-label">Parola</form:label>
                <div class="controls">
                    <form:password path="password"/>
                    <p class="help-block">Introduceti o parola complexa pentru o securitate mai sporita</p>
                </div>
            </div>

            <div class="control-group">
                <!-- Button -->
                <div class="controls">
                    <button class="btn btn-primary">Creeaza cont</button>
                </div>
            </div>
        </fieldset>
    </form:form>
    </div>

</body>
</html>