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

</head>
<body>

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
            <a class="navbar-brand" href="">Platforma RuralPrenor</a>
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
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>


<div class="container">



    <form action="#" style="margin-top: 100px;">
        <h2><input type="submit" value="View more"></h2>
    </form>

    <form action="register">
        <h2><input type="submit" value="Register as an entrepreneur"></h2>
    </form>

    <form action="login">
        <h2><input type="submit" value="Already a member? Login here"></h2>
    </form>
</div>







</body>
</html>