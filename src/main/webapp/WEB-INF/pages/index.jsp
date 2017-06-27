<%--
  Created by IntelliJ IDEA.
  User: promoscow
  Date: 20.06.17
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>USERS</title>
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
            font-weight: lighter;
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
<table><br/><br/><br/></table>
<h1><center>USERS</center></h1>

<c:if test="${!empty listUsers}">
    <table class="tg" width="90%" align="center">
        <tr>
            <th width=10%>ID</th>
            <th width=30%>User name</th>
            <th width=10%>Age</th>
            <th width=10%>isAdmin</th>
            <th width=20%>Date of registration</th>
            <th width=10%>Edit</th>
            <th width=10%>Delete</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td align="center">${user.id}</td>
                <td>${user.name}</td>
                <td>${user.age}</td>
                <td>${user.admin}</td>
                <td>${user.createdDate}</td>
                <td align="center"><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                <td align="center"><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${empty listUsers}"><center>List of users is empty.</center></c:if>
<br>
<h2>Add new user</h2>
<c:url var="addAction" value="/users/add" />
<form:form action="${addAction}" commandName="user">
        <table>
            <c:if test="${!empty user.name}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="name">
                        <spring:message text="Name"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="name"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="age">
                        <spring:message text="Age"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="age"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="admin">
                        <spring:message text="Admin?"/>
                    </form:label>
                </td>
                <td>
                    <form:radiobutton path="admin" value="1" label="Yes" />
                    <form:radiobutton path="admin" value="0" label="No" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty user.name}">
                        <input type="submit"
                               value="<spring:message text="Edit user data"/>"/>
                    </c:if>
                    <c:if test="${empty user.name}">
                        <input type="submit"
                               value="<spring:message text="Add user"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
</body>
</html>
