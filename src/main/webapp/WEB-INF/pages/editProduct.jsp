<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 5/1/2017
  Time: 10:47 PM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>RuralPrenor | Editare produs</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/editProduct.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container">
  <h1 class="text-center text-primary">Editare produs</h1>
  <span><a href="/manageProducts"><h3 class="text-left glyphicon glyphicon-circle-arrow-left">Inapoi</h3></a></span>
  <div id="edit-product">
    <form:form class="form-horizontal" action="editingProduct" method="get" modelAttribute="product">
      <input type="hidden" name="product_id" value="${product.product_id}"/>
      <div class="form-group">
        <form:label class="control-label col-sm-2" path="product_name">Nume:</form:label>
        <div class="col-sm-10">
          <form:input placeholder="Introduceti numele produsului" class="form-control" type="text" path="product_name"/>
        </div>
      </div>

      <div class="form-group">
        <form:label class="control-label col-sm-2" path="description">Descriere:</form:label>
        <div class="col-sm-10">
          <form:textarea class="form-control" placeholder="Introduceti o descriere pentru produs" type="text"
                         path="description"/>
        </div>
      </div>

      <div class="form-group ">
        <label class="control-label col-sm-2" for="price">Pret:</label>
        <div class="col-sm-10">
          <input class="form-control" type="text" value="${product.price}" name="price"/>
        </div>
      </div>

      <div class="form-group">
        <form:label class="control-label col-sm-2" path="productType_id">Tip produs:</form:label>
        <div class="col-sm-10">
          <form:select class="form-control" path="productType_id">
            <c:forEach var="prodType" items="${productTypeList}">
              <form:option value="${prodType.id}">${prodType.type}</form:option>
            </c:forEach>
          </form:select>
        </div>
      </div>

      <button id="editButton" type="submit" class="btn btn-primary btn-md">Modifica</button>
    </form:form>
  </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>