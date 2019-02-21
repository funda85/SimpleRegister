<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,400i,600i,700,800&amp;subset=latin-ext" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{ font-family: 'Nunito', sans-serif;}
        * { box-sizing: border-box; }

        form.example input[type=text] {
            padding: 10px;
            border-radius: 4px;
            font-size: 17px;
            border: 1px solid grey;
            float: left;
            width: 40%;
            background: #f1f1f1;
        }

        .btn {
            transition-duration: 0.2s;
            border-radius: 4px;
            background-color: white;
            color: black;
            width: 8%;
            padding: 12px;
            border: 1px solid grey;
            font-size: 16px;
            cursor: pointer;
        }

        .info {
            border-color: #008CBA;
            color: #008CBA
        }

        .info:hover {
            background: #008CBA;
            color: white;
        }

        form.example::after {
            content: "";
            clear: both;
            display: table;
        }
        .center{
            position: absolute;
            width: 100%;
            height: 100%;
            top: 30%;
            left: 35%;
            margin-top: -150px;
            margin-left: -150px;
        }
        .h2 {
            color: #008CBA;
            font-weight: bold;
            padding-left: 250px;
            padding-bottom: 20px;
        }

    </style>
</head>
<body>
<div class="center">
    <h2 class="h2">SEARCH FORM</h2>

<form class="example" method="post" action="/searchmember">

    <input name="search_text" type="text" placeholder="Search.." required />
    <button class="btn info fa fa-search" type="submit" value="Search"></button>
</form>
</div>
</body>
</html>
