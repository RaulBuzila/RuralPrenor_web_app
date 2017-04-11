<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>


!-- Navigation -->
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
                    <a href="#">Produse disponibile</a>
                </li>
                <li>
                    <a href="#">Oferte turistice</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>




<style>
    .prod-list{
        margin-top: 50px;
    }

</style>

<div class="prod-list container">
<c:forEach var="product" items="${listProduct}" varStatus="status">

        <div class="col-sm-4 col-lg-4 col-md-4">
            <div class="thumbnail">
                <img src="http://placehold.it/320x150" alt="">
                <div class="caption">
                    <h4 class="pull-right">${product.price} RON</h4>
                    <h4><a href="#">${product.product_name}</a>
                    </h4>
                    <p>Vezi mai multe despre acest produs aici <a href="#">Link</a>.</p>
                </div>
                <%--<div class="ratings">--%>
                    <%--<p class="pull-right">15 reviews</p>--%>
                    <%--<p>--%>
                        <%--<span class="glyphicon glyphicon-star"></span>--%>
                        <%--<span class="glyphicon glyphicon-star"></span>--%>
                        <%--<span class="glyphicon glyphicon-star"></span>--%>
                        <%--<span class="glyphicon glyphicon-star"></span>--%>
                        <%--<span class="glyphicon glyphicon-star"></span>--%>
                    <%--</p>--%>
                <%--</div>--%>
            </div>
        </div>

</c:forEach>
</div>


</body>
</html>
