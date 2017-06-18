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
  <title>Pagina de gestionare a produselor proprii</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/manageProducts.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
  <script>
    function formSubmit() {
      document.getElementById("logoutForm").submit();
    }
  </script>
</head>

<body>
<!-- For login user -->
<c:url value="/login?logout" var="logoutUrl"/>

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
            <li><a href="/services">Oferte turistice</a></li>
          </ul>
        </li>
        <sec:authorize access="hasRole('ROLE_USER')">
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestionare
              <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#">Gestionare produse</a></li>
              <li><a href="/manageServices">Gestionare oferte</a></li>
            </ul>
          </li>
          <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li>
              <a href="admin.jsp">Administrare</a>
            </li>
          </sec:authorize>
          <li>
            <a href="/account">Contul meu</a>
          </li>
        </sec:authorize>
        <li>
          <a href="#">Contact</a>
        </li>
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
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>


<h3>Hello <%=session.getAttribute("loggedUser")%>
</h3>
<div class="container">
  <div id="table-container" align="center">
    <h1>Lista ta de produse</h1>
    <h3><a class="btn btn-primary btn-sm" href="newProduct">Adauga produs</a></h3>
    <table border="1" class="table table-responsive table-striped table-curved" cellpadding="1">
      <th>Nr</th>
      <th data-sort="true">Nume</th>
      <th>Descriere</th>
      <th>Pret</th>
      <th>Actiune</th>
      <c:forEach var="product" items="${listProduct}" varStatus="status">
        <tr>
          <td>${status.index + 1}</td>
          <td>${product.product_name}</td>
          <td>${product.description}</td>
          <td>${product.price}</td>
          <td>
            <a class="btn btn-info btn-sm btn-actions" href="editProduct?id=${product.product_id}">Editeaza</a>
            <a class="btn btn-danger btn-sm btn-actions" href="deleteProduct?id=${product.product_id}">Sterge</a>
          </td>

        </tr>
      </c:forEach>
    </table>
  </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>