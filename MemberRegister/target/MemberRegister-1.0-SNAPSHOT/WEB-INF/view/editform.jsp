<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,400i,600i,700,800&amp;subset=latin-ext" rel="stylesheet">
    <style>
        body{ font-family: 'Nunito', sans-serif;}

        * {
            box-sizing: border-box;
        }
        .container {
            padding: 16px;
            background-color: white;
        }

        input[type=text] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        input[type=text]:focus {
            background-color: #ddd;
            outline: none;
        }

        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

        .btn {
            border-radius: 8px;
            border: 2px solid black;
            background-color: white;
            color: black;
            font-size: 20px;
            cursor: pointer;
            transition-duration: 0.2s;
            text-decoration: none;
            display: inline-block;
            padding: 8px 20px;
            width: 100%;
        }

        .info {
            border-color: #008CBA;
            color: #008CBA
        }

        .info:hover {
            background: #008CBA;
            color: white;
        }
        .h2 {
            color: #008CBA;
            font-weight: bold;
            padding-left: 230px;
        }
        .backtomenu{
            color: #008CBA;
            font-weight: bold;
            position: relative;
            top: 530px;
            left: 886px;
        }
        .error {
            color: #ff0000;
            font-weight: bold;
        }
        .center{
            position: absolute;
            width: 45%;
            top: 20%;
            left: 36%;
            margin-top: -150px;
            margin-left: -150px;
        }
        .btag{
            color: #008CBA;
        }
        .ptag{
            color: red;
        }
        .row {
            display: -ms-flexbox; /* IE10 */
            display: flex;
            -ms-flex-wrap: wrap; /* IE10 */
            flex-wrap: wrap;
            margin: 0 -16px;
        }

        .col-25 {
            -ms-flex: 25%; /* IE10 */
            flex: 25%;
        }

        .col-50 {
            -ms-flex: 50%; /* IE10 */
            flex: 50%;
        }

        .col-75 {
            -ms-flex: 75%; /* IE10 */
            flex: 75%;
        }
        .col-25,
        .col-50,
        .col-75 {
            padding: 0 16px;
        }
    </style>
    <title>Edit Form</title>
</head>
<body>
<div class="row">
    <div class="col-75">
        <div class="container center">
            <h2 class="h2">EDIT FORM</h2>
            <hr>
    <form:form method="post" action="/editsave" modelAttribute="command">
            <div class="row">
                <div class="col-50">
                    <form:input type="hidden" path="id" id="id"/>
            <div>
                <form:label path="name"><b class="btag">Name</b></form:label><span class="ptag">*</span>
                <form:input path="name"></form:input>
                <form:errors path="name" cssClass="error"></form:errors>
            </div>

            <div>
                <form:label path="surname"><b class="btag">Surname</b></form:label><span class="ptag">*</span>
                <form:input path="surname" id="surname" ></form:input>
                <form:errors path="surname" cssClass="error" ></form:errors>
            </div>
            <div>
                <form:label path="gender"><b class="btag">Gender</b></form:label><span class="ptag">*</span><br>
                <form:radiobutton path="gender" value="female" checked="cheched"/>Female
                <form:radiobutton path="gender" value="male" />Male
            </div>

            <div class="row">
                <div class="col-50"></div>
                <div class="col-50"></div>
             </div>
            </div>

             <div class="col-50">
                 <div>
                     <form:label path="email"><b class="btag">Email</b></form:label><span class="ptag">*</span>
                     <form:input path="email" id="email"></form:input>
                     <form:errors path="email" cssClass="error" ></form:errors>
                 </div>

                 <div>
                     <form:label path="phone"><b class="btag">Phone</b></form:label><span class="ptag">*</span>
                     <form:input path="phone" id="phone" maxlength="11"></form:input>
                     <form:errors path="phone" cssClass="error"></form:errors>
                 </div>

                 <div class="row">
                     <div class="col-50">

                     </div>
                     <div class="col-50">
                     </div>
                 </div>
             </div>
            </div>
            <hr>
            <input type="submit" value="Send" class="btn info"/>
    </form:form>
        </div>
    </div>
</div>
</div>
</div>
<div>
    <a href="index" name="backtomenu" class="backtomenu" >Back to Menu</a>
</div>
</body>
</html>
