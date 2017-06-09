<%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 4/8/2017
  Time: 7:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Home page</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    .carousel-holder{
      margin-top: 80px;
    }
  </style>
</head>
<body>
<!-- Navigation menu --->
<jsp:include page="menu.jsp"/>

<div class="container">
    <div class="row carousel-holder">
      <div class="col-md-8 col-md-offset-2">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="item active">
              <img class="slide-image" src="http://placehold.it/800x300" alt="">
            </div>
            <div class="item">
              <img class="slide-image" src="http://placehold.it/800x300" alt="">
            </div>
            <div class="item">
              <img class="slide-image" src="http://placehold.it/800x300" alt="">
            </div>
          </div>
          <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
          </a>
          <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
        </div>
      </div>
      <div class="col-md-12 col-md-offset-1">
        <div class="col-md-4 row">
          <form action="/product">
            <h4><input class="btn btn-primary" type="submit" value="Vezi mai multe"></h4>
          </form>
        </div>
        <div class="col-md-4 row">
          <form action="register">
            <h4><input class="btn btn-primary" type="submit" value="Inregistreaza-te pe site"></h4>
          </form>
        </div>
        <div class="col-md-4 row">
          <form action="login">
            <h4><input class="btn btn-primary" type="submit" value="Esti deja membru? Login aici"></h4>
          </form>
        </div>
      </div>
    </div>

<!-- Footer -->
<%@ include file = "footer.jsp" %>
</body>
</html>