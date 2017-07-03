<%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 7/1/2017
  Time: 3:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>RuralPrenor | Contact</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/contact.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
<!-- Navigation menu --->
<jsp:include page="menu.jsp"/>

<div id="contactContainer" class="container">
  <div class="row">
    <div class="col-md-8">
      <div class="well well-sm">
        <form action="https://script.google.com/macros/s/AKfycbx4MtGOj8uwIRwTLIHTi553zvPSRBaNWZaJUkHOd9onii1-n4AX/exec" method="POST" id = "gform">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="name">
                  Nume</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Introduceti numele" required="required" />
              </div>
              <div class="form-group">
                <label for="email">
                  Adresa email</label>
                <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                </span>
                  <input type="email"  class="form-control" id="email" name="email" placeholder="Introduceti adresa dvs email" required="required" /></div>
              </div>
              <div class="form-group">
                <label for="subject">
                  Subiect</label>
                <select id="subject" name="subject" class="form-control" required="required">
                  <option value="na" selected="">Alegeti subiect:</option>
                  <option value="service">Reclamatii</option>
                  <option value="suggestions">Sugestii</option>
                  <option value="product">Informatii produse</option>
                  <option value="users">Utilizatori</option>
                </select>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="name">
                  Mesaj</label>
                            <textarea name="message" id="message" class="form-control" rows="9" cols="25" required="required"
                                      placeholder="Mesajul dvs"></textarea>
              </div>
            </div>
            <div class="col-md-12">
              <button type="submit" class="btn btn-primary pull-right" id="btnContactUs">
                Trimite mesaj</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <div class="col-md-4">
      <form>
        <legend><span class="glyphicon glyphicon-globe"></span> Unde ne gasiti?</legend>
        <address>
          <strong>RuralPrenor</strong><br>
          37 Podirei<br>
          Subcetate, Harghita, 537300<br>
          <abbr title="Phone">
            T:</abbr>
          +40 749 970 825
        </address>
        <address>
          <strong>Buzila Raul Eugen</strong><br>
          <a href="mailto:#">raul95b@yahoo.com</a>
        </address>
      </form>
    </div>
  </div>
</div>
<div style="display:none" id="thankyou_message">
<h3><em>Multumim </em>ca ne-ai contactat!
Incercam sa revenim cat mai repede!
</h3>
</div>
<script data-cfasync="false" type="text/javascript"
        src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js"></script>
</body>
</html>
