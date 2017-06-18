<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 5/20/2017
  Time: 2:57 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
  <script>
    function formSubmit() {
      document.getElementById("logoutForm").submit();
    }
  </script>
</head>

<body>
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
        <li>
          <a href="/product">Produse disponibile</a>
        </li>
        <li>
          <a href="#">Oferte turistice</a>
        </li>
        <li>
          <a href="#">Contact</a>
        </li>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
          <li>
            <a href="admin.jsp">Admin</a>
          </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_USER')">
          <li>
            <a href="account">Contul meu</a>
          </li>
        </sec:authorize>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <c:if test="${pageContext.request.userPrincipal.name != null}">
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

</body>
</html>