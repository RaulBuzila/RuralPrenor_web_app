<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 4/10/2017
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>

<html>

<head>
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
<c:url value="/login?logout" var="logoutUrl" />


<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="">Platforma RuralPrenor</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Vizualizare
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/product">Produse disponibil</a></li>
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
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li>
                        <a href="admin.jsp">Admin</a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_USER')">
                <li>
                    <a href="#">Contul meu</a>
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

<div style="margin-top:200px;" class="col-md-3">
    <h3>Hello <span id="menu-username"><%=SecurityContextHolder.getContext().getAuthentication().getName()%></span></h3>
    <sec:authorize access="hasAnyRole()">
        <div>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta eos est minus necessitatibus nemo, quia recusandae! Accusamus beatae deleniti distinctio eum fuga, in magnam, necessitatibus, neque nesciunt sapiente tempore vitae.
        </div>
    </sec:authorize>
    <sec:authorize access="isAnonymous()">
        <div>
            <h4>Inainte de a incerca sa accesezi site-ul trebuie sa iti creezi un cont!</h4>
        </div>
    </sec:authorize>
</div>
<%@ include file = "footer.jsp" %>
</body>
</html>