<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
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
    <title>New Product</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container" align="center">
    <h1>Produs nou</h1>
    <form:form action="saveProduct" method="get" modelAttribute="product">
        <table>
            <form:hidden path="product_id"/>
            <tr>
                <td>Nume:</td>
                <td><form:input type="text" path="product_name"/></td>
            </tr>
            <tr>
                <td>Descriere:</td>
                <td><form:input type="text" path="description"/></td>
            </tr>
            <tr>
                <td>Pret:</td>
                <td><input type="text" value="${product.price}" name="price"/></td>
            </tr>
            <tr>
                <td>Tip de produs:</td>
                <td>
                    <form:select path="productType_id">
                        <c:forEach var="prodType" items="${productTypeList}">
                            <form:option  value="${prodType.id}">${prodType.type}</form:option>
                        </c:forEach>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-info btn-lg" data-toggle="modal" data-target="#questionModal">Salveaza</button>
                </td>
            </tr>
        </table>
    </form:form>
</div>
<%@ include file = "footer.jsp" %>
</body>
</html>