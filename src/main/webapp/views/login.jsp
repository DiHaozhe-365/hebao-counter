<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>登录 - 荷包记账</title>
    <link rel="icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="../public/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../public/css/theme.css">
    <script type="text/javascript" src="../public/js/router.js"></script>
    <script type="text/javascript" src="../public/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../public/js/math.js"></script>
    <script type="text/javascript" src="../public/js/utils.js"></script>
</head>
<body>
<common:Login/>
</body>
</html>

<%--  最后删掉  --%>
<script>
    document.getElementById("login-form-username").value = "admin";
    document.getElementById("login-form-password").value = "123456";
    document.getElementById("login-button").click();
</script>
<%--  最后删掉  --%>
