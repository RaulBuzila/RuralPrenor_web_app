<%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 7/3/2017
  Time: 10:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>RuralPrenor | Profil Utilizator</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/userProfile.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <script async defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAeEjAC5bw9tG4Pin9ZHl3SCnuTioXbdLE&callback=initMap">
  </script>

  <style>
    #map {
      height: 400px;
      width: 100%;
    }
  </style>
</head>
<body>
  <!-- Navigation menu --->
  <jsp:include page="menu.jsp"/>
  <div class="container">
    <div class="userContainer col-md-6 col-md-offset-3 text-center">
      <h4 class="text-center">Nume utilizator: ${currentUser.username}</h4>
      <h4 class="text-center">Adresa: <span id="adresa">${currentUser.address}</span></h4>
      <h4 class="text-center">E-mail: <span></span>${currentUser.email}</h4>
      <p id="latitudine"></p>
      <p id="longitudine"></p>

      <button class="btn btn-sm btn-primary" type="submit" onclick="initMap()">Arata adresa</button>
      <div id="map"></div>

    </div>
  </div>



  <script type="text/javascript">
    var latitude;
    var longitude;

    var geocoder = new google.maps.Geocoder();
    var address = document.getElementById("adresa").textContent;
    console.log(address);

    geocoder.geocode( { 'address': address}, function(results, status) {

      if (status == google.maps.GeocoderStatus.OK) {
        latitude = results[0].geometry.location.lat();
        longitude = results[0].geometry.location.lng();

        document.getElementById("latitudine").innerHTML=latitude;
        document.getElementById("longitudine").innerHTML=longitude;

        console.log(latitude);
        console.log(longitude);
      }
    });

    function initMap() {
      var uluru = {lat: parseFloat(latitude), lng: parseFloat(longitude)};
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 4,
        center: uluru
      });
      var marker = new google.maps.Marker({
        position: uluru,
        map: map
      });
    }
  </script>


</body>
</html>
