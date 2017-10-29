<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %><%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 6/17/2017
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>RuralPrenor | Contul dvs</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/account.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
    function formSubmit() {
      document.getElementById("logoutForm").submit();
    }
  </script>
</head>
<body>
<!-- For login user -->
<c:url value="/login?logout" var="logoutUrl"/>
<% String loggedUser = SecurityContextHolder.getContext().getAuthentication().getName();
  session.setAttribute("loggedUser", loggedUser);
%>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">

    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/home">Platforma RuralPrenor</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Vizualizare
            <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/product">Produse disponibile</a></li>
            <li><a href="#">Oferte turistice</a></li>
          </ul>
        </li>
        <sec:authorize access="hasRole('ROLE_USER')">
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestionare
              <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="/manageProducts">Gestionare produse</a></li>
              <li><a href="#">Gestionare oferte</a></li>
            </ul>
          </li>
          <li>
            <a href="#">Contact</a>
          </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
          <li>
            <a href="/admin">Admin</a>
          </li>
        </sec:authorize>
      </ul>
      <sec:authorize access="hasRole('ROLE_USER')">
        <ul class="nav navbar-nav" id="profileNav">
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
              <span class="glyphicon glyphicon-user"></span>
              <strong><%=loggedUser%>
              </strong>
              <span class="glyphicon glyphicon-chevron-down"></span>
            </a>
            <ul class="dropdown-menu">
              <c:if test="${pageContext.request.userPrincipal.name != null}">
                <li>
                  <a href="/account?username=<%=loggedUser%>"><span class="glyphicon glyphicon-edit"></span> Contul meu</a>
                </li>
                <li><a href="javascript:formSubmit()"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
              </c:if>
            </ul>
          </li>
        </ul>
      </sec:authorize>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container -->
</nav>

<sec:authorize access="hasRole('ROLE_USER')">
<form action="${logoutUrl}" method="post" id="logoutForm">
  <input type="hidden" name="${_csrf.parameterName}"
         value="${_csrf.token}"/>
</form>
<div class="account-container">

  <h2 class="text-center text-primary">Editare informatii ale contului dvs</h2>
  <form:form class="form-horizontal" action="updateUserInfo" method="POST" modelAttribute="user">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <fieldset>

      <div class="form-group">
        <div class="controls">
          <form:input path="username" class="form-control" placeholder="Username" readonly="true" />
          <p class="help-block">Numele dvs de utilizator nu poate fi schimbat</p>
        </div>
      </div>

      <div class="form-group">
        <div class="controls">
          <form:input path="email" pattern="[^ @]*@[^ @]*" title="Introduceti o adresa e-mail valida" class="form-control" placeholder="E-mail" required="true"/>
          <p class="help-block">Introduceti adresa e-mail noua</p>
        </div>
      </div>

      <div class="form-group">
        <div class="controls">
          <form:input path="address" class="form-control" placeholder="Adresa" required="true"/>
          <p class="help-block">Introduceti adresa dvs. noua Format preferat: judet,localitate,strada,numar</p>
        </div>
      </div>

      <div class="form-group">
        <div class="controls">
          <form:password path="password" class="form-control" placeholder="Parola" required="true" />
          <p class="help-block">Parola dvs noua</p>
        </div>
      </div>

      <div class="form-group">
        <!-- Button -->
        <div class="controls">
          <button id="modifyButton" class="btn btn-primary">Modifica detalii</button>
        </div>
      </div>
    </fieldset>
  </form:form>
  </sec:authorize>
</div>
</body>
</html>
