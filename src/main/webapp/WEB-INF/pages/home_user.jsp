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
    <title>Pagina utilizator</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/homeUser.css">
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
<% String loggedUser=SecurityContextHolder.getContext().getAuthentication().getName();
    session.setAttribute( "loggedUser", loggedUser );
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
                        <a href="/contact">Contact</a>
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
                <li class="dropdown" >
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-user"></span>
                        <strong><%=loggedUser%></strong>
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

<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}" />
</form>

<div class="container" style="margin-top:100px;">

    <h3>Salut, <span id="menu-username"><%=loggedUser%>!</span></h3>
    <sec:authorize access="hasRole('ROLE_USER')">
        <div class="row">
            Bine ai (re)venit! Ne face mare placere sa lucram impreuna si speram sa ai parte de o experienta cat mai placuta.
            Meniul de mai sus iti arata facilitatile de care dispui in cadrul platformei, te indemnam sa fii curios.
        </div>

        <div class="row">
            In cadrul sectiunii de Vizualizare poti vede ofertele celorlalti antreprenori, cat si pe cea personala.
            Acolo sunt disponibile cele mai noi Produse sau Oferte turistice, care sunt actualizate zilnic de catre utilizatori.
            In cadrul sectiunii de Gestionare, poti sa iti administrezi oferta proprie, fie ca este vorba de produse sau ai o anumita oferta turistica disponibila.
        </div>

        <div class="row">
            Editarea profilului propriu se face prin deschiderea dropdown-ului de langa numele tau de utilizator.
            Daca ai orice fel de intrebare formularul si informatiile din pagina Contact iti stau la dispozitie oricand.
            <span class="text-primary">Nu ezita sa ne contactezi!</span>
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