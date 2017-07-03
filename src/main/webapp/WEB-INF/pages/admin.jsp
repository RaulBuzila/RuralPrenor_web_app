<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true"%>
<html>
<head>
  <title>Pagina de administrare</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/admin.css">
  <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<% String loggedUser= SecurityContextHolder.getContext().getAuthentication().getName();
  session.setAttribute( "loggedUser", loggedUser );
%>
<form action="${logoutUrl}" method="post" id="logoutForm">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

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

<div class="container page-content">
  <c:if test="${pageContext.request.userPrincipal.name != null}">
    <h3 class="text-succes text-center">
      Bun venit : ${pageContext.request.userPrincipal.name} !
    </h3>
    <h4 class="text-succes text-center">Esti liber sa gestionezi resursele din cadrul aplicatiei dupa bunul plac :)</h4>
  </c:if>

  <h4 class="text-primary text-center">Comentarii care necesita aprobare</h4>
  <div id="table-container" align="center">
    <table border="1" class="table table-responsive table-striped table-curved" cellpadding="1">
      <th>Nr</th>
      <th data-sort="true">Initiator comentariu</th>
      <th>Continut comentariu</th>
      <th>Actiune</th>
      <c:forEach var="unapprovedComment" items="${unapprovedCommentsList}" varStatus="status">
        <tr>
          <td>${status.index + 1}</td>
          <td>${unapprovedComment.name}</td>
          <td>${unapprovedComment.content}</td>
          <td>
            <a class="btn btn-primary btn-sm btn-actions" href="approveComment?id=${unapprovedComment.id}">Aproba</a>
            <a class="btn btn-danger btn-sm btn-actions" href="deleteComment?id=${unapprovedComment.id}">Sterge</a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>

  <div id="approvedTable" align="center">
    <h4 class="text-primary">Comentarii aprobate</h4>
    <table border="1" class="table table-responsive table-hover table-curved" cellpadding="1">
      <th>Nr</th>
      <th data-sort="true">Initiator comentariu</th>
      <th>Continut comentariu</th>
      <th>Actiune</th>
      <c:forEach var="approvedComment" items="${approvedCommentsList}" varStatus="status">
        <tr>
          <td>${status.index + 1}</td>
          <td>${approvedComment.name}</td>
          <td>${approvedComment.content}</td>
          <td>
            <a class="btn btn-danger btn-sm btn-actions" href="deleteComment?id=${approvedComment.id}">Sterge</a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>

  <div id="allProducts" align="center">
    <h4 class="text-primary">Produse de gestionat</h4>
    <table border="1" class="table table-responsive table-hover table-curved" cellpadding="1">
      <th>Nr</th>
      <th data-sort="true">Nume</th>
      <th>Descriere</th>
      <th>Pret</th>
      <th>Actiune</th>
      <c:forEach var="product" items="${productList}" varStatus="status">
        <tr>
          <td>${status.index + 1}</td>
          <td>${product.product_name}</td>
          <td>${product.description}</td>
          <td>${product.price}</td>
          <td>
            <a class="btn btn-danger btn-sm btn-actions" href="deleteProductAdmin?id=${product.product_id}">Sterge</a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>