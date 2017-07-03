<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/ViewProduct.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"  type="text/javascript"></script>
    <script>
        function formSubmit() {
            document.getElementById("logoutForm").submit();
        }
    </script>
</head>

<body>

<!-- Navigation menu --->
<jsp:include page="menu.jsp"/>

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
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>
<%@ include file = "footer.jsp" %>
</body>
</html>
