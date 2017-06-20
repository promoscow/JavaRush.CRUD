<%--
  Created by IntelliJ IDEA.
  User: promoscow
  Date: 20.06.17
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Users List</title>
    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>

</head>
<body>
<a href="../../index.jsp">Back to main menu</a>
<br />
<br />
<h1>USERS</h1>

<c:if test="${!empty listUsers}">
    <table class="tg">
        <tr >
            <th width="100">ID</th>
            <th width="100">User name</th>
            <th width="100">Age</th>
            <th width="100">isAdmin</th>
            <th width="100">Date of registration</th>
            <th width="100">Edit</th>
            <th width="100">Delete</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.age}</td>
            <td>${user.admin}</td>
            <td>${user.createdDate}</td>
            <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
            <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
        </tr>
        </c:forEach>
    </table>
</c:if>

<h1>Add new user</h1>

<br/>
<br/>
<%--<c:url var="addAction" value="/users/add">--%>

    <%--<form:form action="${addAction}" commandName="user">--%>
        <%--<table>--%>
            <%--<c:if test="${!empty user.name}">--%>
                <%--<tr>--%>
                    <%--<td>--%>
                        <%--<form:label path="id">--%>
                            <%--<spring:message text="ID"/>--%>
                        <%--</form:label>--%>
                    <%--</td>--%>
                    <%--<td>--%>
                        <%--<form:input path="id" readonly="true" size="8" disabled="true"/>--%>
                        <%--<form:hidden path="id"/>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</c:if>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--<form:label path="name">--%>
                        <%--<spring:message text="User name"/>--%>
                    <%--</form:label>--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<form:input path="name"/>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--<form:label path="age">--%>
                        <%--<spring:message text="Age"/>--%>
                    <%--</form:label>--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<form:input path="age"/>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--<form:label path="admin">--%>
                        <%--<spring:message text="isAdmin"/>--%>
                    <%--</form:label>--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<form:input path="admin"/>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--<form:label path="date">--%>
                        <%--<spring:message text="createDate"/>--%>
                    <%--</form:label>--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<form:input path="date"/>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</table>--%>
    <%--</form:form>--%>
<%--</c:url>--%>

</body>
</html>
