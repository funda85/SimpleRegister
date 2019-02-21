<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.time.temporal.*"%>
<%@page import="java.time.format.*"%>

<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,400i,600i,700,800&amp;subset=latin-ext" rel="stylesheet">
    <style>
        body{ font-family: 'Nunito', sans-serif;}

        .backtomenu{
            color: #008CBA;
            font-weight: bold;
        }
        .h2 {
            color: #008CBA;
            font-weight: bold;
        }
        #customers {
            border-collapse: collapse;
            width: 70%;
        }

        #customers td, #customers th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #customers tr:nth-child(even){background-color: #f2f2f2;}

        #customers tr:hover {background-color: #ddd;}

        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #008CBA;
            color: white;
        }
        .btn {
            border-radius: 8px;
            border: 2px solid black;
            background-color: white;
            color: black;
            padding: 0px 10px;
            font-size: 16px;
            cursor: pointer;
            transition-duration: 0.2s;
            text-decoration: none;
            display: inline-block;
        }

        .info {
            border-color: #008CBA;
            color: #008CBA
        }

        .info:hover {
            background: #008CBA;
            color: white;
        }
    </style>
    <title>Search Results</title>
</head>
<body>
<h2 class="h2">SEARCH RESULTS</h2>
<form:form method="post" action="/memberdetails">
<table id="customers">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Gender</th>
        <th>Register Date</th>
        <th>Register Time</th>
    </tr>
        <c:forEach var="member" items="${members}">
            <tr>
                <td><button type="submit" name="id" value="${member.id}" class="btn info">${member.id}</button></td>
                <td><c:out value="${member.name}"/></td>
                <td><c:out value="${member.surname}"/></td>
                <td><c:out value="${member.email}"/></td>
                <td><c:out value="${member.phone}"/></td>
                <td><c:out value="${member.gender}"/></td>
                <td><c:out value="${member.registertime.toLocalDate()}"/></td>
                <td><c:out value="${member.registertime.toLocalTime().truncatedTo(ChronoUnit.SECONDS).format(DateTimeFormatter.ISO_LOCAL_TIME)}"/></td>
            </tr>
        </c:forEach>
</table>
</form:form>
<br>
<a href="index" name="backtomenu" class="backtomenu" >Back to Menu</a>

</body>
</html>
