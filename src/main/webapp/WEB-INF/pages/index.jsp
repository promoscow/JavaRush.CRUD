<%--
  Created by IntelliJ IDEA.
  User: promoscow
  Date: 20.06.17
  Time: 21:32
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
    <meta charset="UTF-8">
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
            font-weight: lighter;
            padding: 20px 15px;
            border-style: solid;
            border-width: 0;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #777;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 30px 15px;
            border-style: solid;
            border-width: 0;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }

        .header {
            font-family: Arial, sans-serif;
            font-size: 20px;
            font-weight: lighter;
            padding: 10px 5px;
            border-width: 0px;
            align-content: center;
            align-items: center;
        }

        .form {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: lighter;
            padding: 10px 15px;
            border-width: 0;
            align-content: center;
            align-items: center;
            background-color: #ffffff;
        }

        .font {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: lighter;
            font-style: italic;
            padding: 0 15px;
            border-width: 0;
            align-content: center;
            align-items: center;
            background-color: #ffffff;
        }

        .material {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: lighter;
            padding: 10px 15px;
            border: 1px solid #eeeeee;
            align-content: center;
            align-items: center;
            word-spacing: 20px;
        }

        .btn {
            width: 100%;
            height: 44px;
            font-size: 14px;
            border: 0px solid #253737;
            background: #dddddd;
            padding: 10px 21px;
            -webkit-border-radius: 0px;
            -moz-border-radius: 0px;
            border-radius: 0px;
            color: #333333;
        }
        .btn:hover {
            width: 100%;
            height: 44px;
            font-size: 14px;
            border: 0px solid #253737;
            background: #dedede;
            padding: 10px 21px;
            -webkit-border-radius: 0px;
            -moz-border-radius: 0px;
            border-radius: 0px;
            color: #333333;
        }
        .btn:active {
            width: 100%;
            height: 44px;
            font-size: 14px;
            border: 0px solid #253737;
            background: #eeeeee;
            padding: 10px 21px;
            -webkit-border-radius: 0px;
            -moz-border-radius: 0px;
            border-radius: 0px;
            color: #333333;
        }

        .field {
            width: 100%;
            height: 30px;
            font-size: 14px;
            border: 1px solid #dddddd;
            background: #ffffff;
            margin-bottom: 20px;
            padding: 10px 21px;
            -webkit-border-radius: 0px;
            -moz-border-radius: 0px;
            border-radius: 0px;
            color: #333333;
        }

        .link {
            text-decoration: none;
            background-color: #78909C;
            color: #ffffff;
            padding: 5px;
            border: 0 #78909C;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
        }
    </style>
</head>
<body bgcolor="#eeeeee">
<table width="95%" align="center">
    <tr>
            <%--Sider--%>
        <td width="20%" valign="top">

            <table class="header" align="center">
                <tr class="header" align="center">
                    <td class="header" align="center" height="100px">
                    </td>
                </tr>
            </table>

                        <%--Add form--%>
            <table width="300px">
                <tr>
                    <td>
                        <c:url var="addAction" value="/users/add" />
                        <form:form action="${addAction}" commandName="user">
                            <%--Add form--%>
                            <table class="form" align="center" width="100%">
                                <tr>
                                    <td>
                                        <table class="header" align="center">
                                            <tr class="header" align="center">
                                                <td class="header" align="center">
                                                    <c:if test="${!empty user.name}">
                                                        EDIT USER
                                                    </c:if>
                                                    <c:if test="${empty user.name}">
                                                        ADD NEW USER
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="form" width="100%">
                                                <%--ID--%>
                                            <c:if test="${!empty user.name}">
                                                <tr>
                                                    <td class="form">
                                                        <form:label path="id">
                                                            <spring:message text="ID"/>
                                                        </form:label>
                                                    </td>
                                                    <td class="form">
                                                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                                                        <form:hidden path="id"/>
                                                    </td>
                                                </tr>
                                            </c:if>
                                                        <%--name--%>
                                                    <tr>
                                                        <td class="font">
                                                            <form:label path="name">
                                                                <spring:message text="Name:"/>
                                                            </form:label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="form" colspan="2">
                                                            <form:input placeholder="Enter user name" cssClass="field" width="250px" path="name"/>
                                                        </td>
                                                    </tr>
                                                        <%--age--%>
                                                    <tr>
                                                    <tr>
                                                        <td class="font">
                                                            <form:label path="name">
                                                                <spring:message text="Age:"/>
                                                            </form:label>
                                                        </td>
                                                    </tr>
                                                    </tr>
                                                    <tr>
                                                        <td class="form" colspan="2">
                                                            <form:input placeholder="Enter user age" cssClass="field" path="age"/>
                                                        </td>
                                                    </tr>
                                                        <%--isAdmin--%>
                                                    <tr>
                                                        <td class="font">
                                                            <form:label path="admin">
                                                                <spring:message text="Admin?"/>
                                                            </form:label>
                                                        </td>
                                                        <td class="form" align="right">
                                                            <form:checkbox path="admin" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" class="form">
                                                            <c:if test="${!empty user.name}">
                                                                <input class="btn" type="submit"
                                                                       value="<spring:message text="SUBMIT CHANGES"/>"/>
                                                            </c:if>
                                                            <c:if test="${empty user.name}">
                                                                <input class="btn" type="submit"
                                                                       value="<spring:message text="ADD USER"/>"/>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </form:form>
                    </td>
                </tr>
                <tr>
                    <td>
                                    <%--<form:form action="/">--%>
                                        <table class="form" width="100%">
                                                <%--search field--%>
                                            <tr>
                                                <td class="form">
                                                    <form action="/">
                                                        <input class="field" type="text" name="userName" />
                                                        <input class="btn" type="submit" value="Search" />
                                                    </form>
                                                    <%--<form:input type=""/>--%>
                                                <%--</td>--%>
                                                <%--<td class="form">--%>
                                                    <%--<input class="btn" type="submit"--%>
                                                           <%--value="<spring:message text="S"/>"/>--%>
                                                </td>
                                            </tr>
                                        </table>
                                    <%--</form:form>--%>


                                </td>
                </tr>
            </table>
        </td>
            <%--Vertical divider--%>
        <td width="2%">

        </td>
            <%--Main table--%>
        <td width="78%" valign="top">
            <table width="100%">
                <tr>
                    <td>
                        <table class="header" align="center">
                            <tr class="header" align="center">
                                <td class="header" align="center" height="100px">
                                    USERS
                                </td>
                            </tr>
                        </table>
                        <c:if test="${!empty listUsers}">
                            <table class="tg" align="center" width="100%">
                                <tr>
                                    <th width=10%>ID</th>
                                    <th width=25%>User name</th>
                                    <th width=10%>Age</th>
                                    <th width=10%>Admin</th>
                                    <th width=30%>Registration / update date</th>
                                    <th width=5%></th>
                                    <th width=10%></th>
                                </tr>
                                <tr height="10px" bgcolor="#eeeeee">

                                </tr>
                                <c:forEach items="${listUsers}" var="user">
                                    <tr>
                                        <td align="center">${user.id}</td>
                                        <td>${user.name}</td>
                                        <td align="center">${user.age}</td>
                                        <c:if test="${user.admin}">
                                            <td align="center"><img src="../../resources/checkcircle.png"></td>
                                        </c:if>
                                        <c:if test="${!user.admin}">
                                            <td align="center"></td>
                                        </c:if>
                                        <%--<td align="center">${user.admin}</td>--%>
                                        <td align="center">${user.createdDate}</td>
                                            <%--<td align="center"><form:button path="/edit/${user.id}" value="EDIT" /></td>--%>
                                        <td align="center"><a href="<c:url value='/edit/${user.id}'/>"><img src="../../resources/pencilcircle.png"></a></td>
                                        <td align="center"><a href="<c:url value='/remove/${user.id}'/>"><img src="../../resources/closecircle2.png"></a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:if>
                        <c:if test="${empty listUsers}"><center>List of users is empty.</center></c:if>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="material" align="center">
                            <tr align="center">
                                <td align="center">
                                    <c:url value="/" var="prev">
                                        <c:param name="page" value="${page-1}"/>
                                    </c:url>
                                    <c:if test="${page > 1}">
                                        <a href="<c:out value="${prev}" />" class="link">Previous</a>
                                    </c:if>

                                    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                                        <c:choose>
                                            <c:when test="${page == i.index}">
                                                <span>${i.index}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <c:url value="/" var="url">
                                                    <c:param name="page" value="${i.index}"/>
                                                </c:url>
                                                <a href='<c:out value="${url}" />' class="link">${i.index}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:url value="/" var="next">
                                        <c:param name="page" value="${page + 1}"/>
                                    </c:url>
                                    <c:if test="${page + 1 <= maxPages}">
                                        <a href='<c:out value="${next}" />' class="link">Next</a>
                                    </c:if>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br>
</body>
</html>
