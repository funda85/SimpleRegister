<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </style>
    <title>Result</title>
</head>
<body>
<table id="customers">
    <h2 class="h2">You Register Succesfully</h2>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Gender</th>
        <th>Register Date</th>
        <th>Register Time</th>
    </tr>
    <tr>
        <td>${id}</td>
        <td>${name}</td>
        <td>${surname}</td>
        <td>${email}</td>
        <td>${phone}</td>
        <td>${gender}</td>
        <td>${registertime.toLocalDate()}</td>
        <td>${registertime.toLocalTime().truncatedTo(ChronoUnit.SECONDS).format(DateTimeFormatter.ISO_LOCAL_TIME)}</td>
    </tr>
</table>
<br>
<a href="index" name="backtomenu" class="backtomenu" >Back to Menu</a>

</body>
</html>

