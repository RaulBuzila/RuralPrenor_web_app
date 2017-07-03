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
  <title>Acasa</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/home.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
          <li data-target="#carousel-example-generic" data-slide-to="3"></li>
          <li data-target="#carousel-example-generic" data-slide-to="4"></li>
        </ol>
        <div class="carousel-inner">
          <div class="item active">
            <img class="slide-image" src="${pageContext.request.contextPath}/resources/images/1.png">
            <div class="carousel-caption">
              <p>Oua proaspete din inima Ardealului</p>
            </div>
          </div>
          <div class="item">
            <img class="slide-image" src="${pageContext.request.contextPath}/resources/images/2.png">
            <div class="carousel-caption">
              <p>Produse traditionale oferite de fermieri</p>
            </div>
          </div>
          <div class="item">
            <img class="slide-image" src="${pageContext.request.contextPath}/resources/images/3.png">
            <div class="carousel-caption">
              <p>Produse din carne ideale pentru gratar</p>
            </div>
          </div>
          <div class="item">
            <img class="slide-image" src="${pageContext.request.contextPath}/resources/images/4.png">
            <div class="carousel-caption">
              <p>Lactate si produse asemanatoare la dispozitia oricui</p>
            </div>
          </div>
          <div class="item">
            <img class="slide-image" src="${pageContext.request.contextPath}/resources/images/5.png">
            <div class="carousel-caption">
              <p>Produse din panificatie</p>
            </div>
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
    <div class="col-md-11 col-md-offset-1">
      <div class="col-md-9 col-md-offset-1 row descriptionHome">
        <h3 class="text-primary">Scurta descriere</h3>
        <p class="text-justify"><span class="text-uppercase"><b>Platforma Ruralprenor</b></span> s-a nascut din dorinta de a promova antreprenorii din zona de Nord a judetului Harghita.Produsele pe care le vei gasi in cadrul aceste platforme sunt rezultatul muncii unor oameni simpli,harnici,talentati si iubitori de natura.</p>
        <p class="text-justify">Fie ca este vorba de produse provenite din carne,lactate, fructe, legume ,dulceturi sau alte servicii oferite, ai gasit locul perfect. Daca ti-am starnit interesul, mai multe produse poti vedea in link-ul asociat: <a href="/product" class="btn btn-link btn-md">Click aici</a></p>
      </div>
      <div class="col-md-9 col-md-offset-1 row descriptionHome">
        <h3 class="text-primary">Inregistrare</h3>
        <p class="text-justify"><span class="text-uppercase"><b>Platforma Ruralprenor</b></span> este deschisa oricarei persoane care doreste sa-si promoveze afacerea prin produsele proprii sau serviciile hoteliere oferite.</p>
        <p class="text-justify"> Inregistrarea pe platforma este destul de facila, nefiind nevoie de confirmari suplimentare. Doar 2 pasi de despart de promovarea afacerii tale in mediul online. Daca te consideri un antreprenor, iti poti crea cont rapid:  <a href="/register" class="btn btn-link btn-md">Click aici</a></p>
      </div>
      <div class="col-md-9 col-md-offset-1 row descriptionHome">
        <h3 class="text-primary">Autentificare</h3>
        <p class="text-justify">In cazul in care ai deja un cont creat, ne bucuram ca ai revenit si speram ca iti oferim o experienta cat mai placuta. Te poti autentifica rapid accesand link-ul:  <a href="/login" class="btn btn-link btn-md">Click aici</a></p>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <%@ include file="footer.jsp" %>
</body>
</html>