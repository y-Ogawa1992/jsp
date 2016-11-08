<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<link href="./css/style.css" rel="stylesheet" type="text/css">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ユーザー登録</title>
</head>
<body>
<div class="main-contents">
<c:if test="${not empty errorMessages}">
	<div class="errorMessages">
		<ul>
			<c:forEach items="${errorMessages}" var="message">
				<li><c:out value="${message}" />
			</c:forEach>
		</ul>
	</div>
	<c:remove var="errorMessages" scope="session"/>
</c:if>

<a href="login">ログイン</a>

<form action="signup" method="post"><br />
	<label for="name">名前</label>
	<input name="name" value="${user.name}" id="name" /><br />

	<label for="login_id">ログインID</label>
	<input name="login_id" value="${user.loginId}" id="login_id" /><br />

	<label for="password">パスワード</label>
	<input name="password" type="password" id="password" /><br />

	<%-- DB参照した部署、役職のセレクトボックス --%>

	<label for="branch">所属</label>
	<select name="branch">
		<c:forEach items="${branch}" var="branch" >
			<option value="${branch.id}">${branch.name}</option>
		</c:forEach>

	</select>
	<br>
	<label for="department">役職</label>
	<select name="department">
		<c:forEach items="${department}" var="department">
			<option value="${department.id}">${department.name}</option>
		</c:forEach>
	</select>


	<input type="submit" value="登録" /><br />

</form>
<div class="copyright">Copyright(c)Yutaro Ogawa</div>
</div>
</body>
</html>