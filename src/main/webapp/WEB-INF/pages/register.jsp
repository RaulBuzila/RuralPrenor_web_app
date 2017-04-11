<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%--
  Created by IntelliJ IDEA.
  User: raulbuzila
  Date: 4/10/2017
  Time: 10:39 PM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Register to RuralPrenor</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/resources/style.css" />" >
</head>
<body>
<div align="center">
    <h1>Register on our site</h1>
    <form:form action="saveUser" method="post" modelAttribute="user">
        <table>

            <tr>
                <td>Username</td>
                <td><form:input path="username"/></td>
            </tr>

            <tr>
                <td>Address</td>
                <td><form:input path="address"/></td>
            </tr>

            <tr>
                <td>Email</td>
                <td><form:input path="email"/></td>
            </tr>


            <tr>
                <td>Password</td>
                <td><input type="password" name="parola"></td>
            </tr>

            <tr>
                <td colspan="2" align="center"><input type="submit" value="Register"></td>
            </tr>

        </table>
    </form:form>
</div>

</body>
</html>