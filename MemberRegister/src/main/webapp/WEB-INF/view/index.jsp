
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,400i,600i,700,800&amp;subset=latin-ext" rel="stylesheet">
    <style>
        body{ font-family: 'Nunito', sans-serif;}

        .btn {
            border-radius: 8px;
            border: 2px solid black;
            background-color: white;
            color: black;
            padding: 14px 28px;
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
        .center{
            position: absolute;
            width: 100%;
            height: 100%;
            top: 25%;
            left: 45%;
            margin-top: -150px;
            margin-left: -150px;
        }
        .h2 {
            color: #008CBA;
            font-weight: bold;
            padding-left: 125px;
            padding-bottom: 10px;
            font-size: 35px;
        }
        .bold{
            font-weight: bold;
        }
    </style>
    <title>INDEX</title>
</head>
<body>
<div class="center">
    <h2 class="h2">MAIN MENU</h2>
    <a href="register" class="btn info bold">REGISTER</a>
    <a href="members" class="btn info bold">ALL MEMBERS</a>
    <a href="findmember" class="btn info bold">SEARCH</a>
</div>
</body>
</html>
