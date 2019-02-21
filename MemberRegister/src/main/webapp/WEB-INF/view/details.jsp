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
    <script>
        function control() {
            var str = "Are you sure want to delete this (id = ${member.id}) member?"

            if(confirm(str)){
                location.href = "deletemember/${member.id}";
            }
            else{
                location.href = "members";
            }

        }
    </script>
    <title>Member Details</title>
</head>
<body>
<h2 class="h2">MEMBER DETAILS</h2>
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
        <th>EDIT</th>
        <th>DELETE</th>
    </tr>
    <tr>
        <td><c:out value="${member.id}"/></td>
        <td><c:out value="${member.name}"/></td>
        <td><c:out value="${member.surname}"/></td>
        <td><c:out value="${member.email}"/></td>
        <td><c:out value="${member.phone}"/></td>
        <td><c:out value="${member.gender}"/></td>
        <td><c:out value="${member.registertime.toLocalDate()}"/></td>
        <td><c:out value="${member.registertime.toLocalTime().truncatedTo(ChronoUnit.SECONDS).format(DateTimeFormatter.ISO_LOCAL_TIME)}"/></td>
        <td><a href="editmember/${member.id}" type="button" name="id" value="Edit" style="font-size: larger"/>Edit</td>
        <td><a href="#" type="button" value="Delete" name="id" onclick="control()" style="font-size: larger"/>Delete</td>
    </tr>
</table>
<br>
<a href="index" name="backtomenu" class="backtomenu" >Back to Menu</a>

</body>
</html>

