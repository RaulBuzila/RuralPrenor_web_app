<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 4/9/2017
  Time: 1:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product page</title>
    <link rel="stylesheet" href="${styleCSS}">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"  type="text/javascript"></script>
    <script>
        function formSubmit() {
            document.getElementById("logoutForm").submit();
        }
    </script>
    <!-- For style purpose -->
    <style>
        .prod-list,.categories{
            margin-top: 100px;
        }
    </style>
</head>

<body>
<!-- For login user -->
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
<!-- For login purpose -->
<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}" />
</form>

<div class="container">
  <div class="col-md-3">
    <div class="list-group categories">
      <a href="/product" class="list-group-item">Toate produsele</a>
      <a href="/category?id=1" class="list-group-item">Fructe</a>
      <a href="/category?id=2" class="list-group-item">Legume</a>
      <a href="/category?id=3" class="list-group-item">Lactate</a>
      <a href="/category?id=4" class="list-group-item">Alte tipuri...</a>
    </div>
  </div>
  <div class="col-md-9">
    <div class="prod-list row">
      <c:forEach var="product" items="${listProduct}" varStatus="status">
        <div class="col-sm-4 col-lg-4 col-md-4">
          <div class="thumbnail">
            <img src="http://placehold.it/320x150" alt="">
            <div class="caption">
              <h4 class="pull-right">${product.price} RON</h4>
              <h4 >${product.product_name}</h4>
              <p>Vezi mai multe despre acest produs aici <a href="/viewDetails?id=${product.product_id}"><span class="glyphicon glyphicon-plus"></span></a></p>
            </div>
              <div class="ratings">
            <p class="pull-right">15 reviews</p>
            <p>
              <span class="glyphicon glyphicon-star"></span>
              <span class="glyphicon glyphicon-star"></span>
              <span class="glyphicon glyphicon-star"></span>
              <span class="glyphicon glyphicon-star"></span>
              <span class="glyphicon glyphicon-star"></span>
            </p>
          </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>
<%@ include file = "footer.jsp" %>
</body>
</html>
