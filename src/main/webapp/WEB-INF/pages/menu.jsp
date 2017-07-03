<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 5/20/2017
  Time: 2:57 PM
  To change this template use File | Settings | File Templates.
--%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    function formSubmit() {
      document.getElementById("logoutForm").submit();
    }
</script>

<c:url value="/login?logout" var="logoutUrl" />
<!-- Navigation -->
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
        <sec:authorize access="isAnonymous()">
          <li>
            <a href="/product">Produse disponibile</a>
          </li>
          <li>
            <a href="#">Oferte turistice</a>
          </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_USER')">
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Vizualizare
              <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="/product">Produse disponibile</a></li>
              <li><a href="#">Oferte turistice</a></li>
            </ul>
          </li>
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestionare
              <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="/manageProducts">Gestionare produse</a></li>
              <li><a href="#">Gestionare oferte</a></li>
            </ul>
          </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
          <li>
            <a href="/admin">Admin</a>
          </li>
        </sec:authorize>

         <li><a href="/contact">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right dropdown-menu">
        <c:if test="${pageContext.request.userPrincipal.name != null}">
          <li>
            <a href="/account">Contul meu</a>
          </li>
          <li><a href="javascript:formSubmit()"><span class="glyphicon glyphicon-log-out"></span>Log Out</a></li>
        </c:if>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container -->
</nav>
<form action="${logoutUrl}" method="post" id="logoutForm">
  <input type="hidden" name="${_csrf.parameterName}"
         value="${_csrf.token}" />
</form>
