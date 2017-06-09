<%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 4/15/2017
  Time: 5:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Detaliile unui produs</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    .productItem,.categories{
      margin-top: 100px;
    }
  </style>
</head>
<body>
<!-- Navigation menu --->
<jsp:include page="menu.jsp"/>

<div class="container">
  <!-- product item -->
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
    <div class="thumbnail productItem">
      <img class="img-responsive" src="http://placehold.it/800x300" >
      <div class="caption-full">
        <h4 class="pull-right">${product.price} RON</h4>
        <h4><c:out value="${product.product_name}"/></h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
        <p><b>Oferit de : </b>NumeAntreprenor</p>
        <p><b>Adresa:</b> Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
      </div>
      <div class="ratings">
        <p class="pull-right">3 reviews</p>
        <p>
          <span class="glyphicon glyphicon-star"></span>
          <span class="glyphicon glyphicon-star"></span>
          <span class="glyphicon glyphicon-star"></span>
          <span class="glyphicon glyphicon-star"></span>
          <span class="glyphicon glyphicon-star-empty"></span>
          4.0 stars
        </p>
      </div>
    </div>
    <!-- comments -->
    <div class="well">
      <div class="text-right">
        <btn type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">Adauga comentariu</btn>
      </div>

      <!-- Modal -->
      <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Impresia ta despre produsul ales:</h4>
            </div>
            <div class="modal-body">
              <form:form class="form-horizontal" action="/saveComment" method="GET" modelAttribute="comment" role="form">
                <input type="hidden" value="${product.product_id}" name="productId">
                <div class="form-group">
                  <label  class="col-sm-2 control-label" for="inputName">Numele dvs: </label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputName" name="name" placeholder="Nume"/>
                  </div>
                </div>
                <div class="form-group">
                  <label  class="col-sm-2 control-label" for="inputContent">Comentariu:</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" id="inputContent" name="content" placeholder="Comentariul dvs"></textarea>
                  </div>
                </div>
                <input type="submit" align="center" class="btn btn-primary" value="Adauga"/>
              </form:form>
            </div>
            <div class="modal-footer">
              <button align="center" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>

        </div>
      </div>

      <hr>

      <div class="row">
        <div class="col-md-12">
          <span class="glyphicon glyphicon-star"></span>
          <span class="glyphicon glyphicon-star"></span>
          <span class="glyphicon glyphicon-star"></span>
          <span class="glyphicon glyphicon-star"></span>
          <span class="glyphicon glyphicon-star-empty"></span>
          <%--<c:forEach var="commentItem" items="${listComment}" varStatus="status">--%>
            <%--<span>${commentItem.name}</span>--%>
            <%--<span class="pull-right">10 days ago</span>--%>
            <%--<p>${commentItem.content}</p>--%>
          <%--</c:forEach>--%>
        </div>
      </div>

    </div>
  </div>
</div>



<!-- Footer -->
<jsp:include page="footer.jsp"/>
</body>
</html>