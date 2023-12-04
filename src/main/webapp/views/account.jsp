<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<%@ taglib tagdir="/WEB-INF/tags/common/account" prefix="account" %>
<%@ taglib tagdir="/WEB-INF/tags/common/bill" prefix="bill" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>个人信息 - 荷包记账</title>
    <link rel="icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="../public/css/reset.css">
    <link rel="stylesheet" type="text/css" href="../public/css/theme.css">
    <link rel="stylesheet" href="../public/icon/iconfont.css">
    <script type="text/javascript" src="../public/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../public/js/math.js"></script>
    <script type="text/javascript" src="../public/js/utils.js"></script>
    <script type="text/javascript" src="../public/js/router.js"></script>
</head>
<body>
<common:Header/>
<common:Sidebar/>
<account:Main/>
<account:ChangeNickName/>
<bill:AddBill/>
<common:TabBar/>
<common:Footer/>
</body>
</html>
