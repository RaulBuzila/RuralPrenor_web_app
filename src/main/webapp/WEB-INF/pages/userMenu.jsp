<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 6/22/2017
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>

<!-- For login user -->
<c:url value="/login?logout" var="logoutUrl" />
<% String loggedUser= SecurityContextHolder.getContext().getAuthentication().getName();
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
        <ul class="nav navbar-nav " id="profileNav">
          <li class="dropdown" >
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
              <span class="glyphicon glyphicon-user"></span>
              <strong><%=loggedUser%></strong>
              <span class="glyphicon glyphicon-chevron-down"></span>
            </a>
            <ul class="dropdown-menu">
              <c:if test="${pageContext.request.userPrincipal.name != null}">
                <li>
                  <a href="/account"><span class="glyphicon glyphicon-edit"></span> Contul meu</a>
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