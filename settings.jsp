<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="./css/style.css" rel="stylesheet" type="text/css">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>の設定</title>
</head>
<body>
<div class="main-contents">

<h2>ユーザー編集画面</h2>

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

<form action="settings" method="post"><br />

	<label for="name">名前</label>
	<input name="name" value="${editUser.name}" id="name"/><br />

	<label for="loginId">ログインID</label>
	<input name="loginId" value="${editUser.loginId}" /><br />

	<label for="password">変更用パスワード</label>
	<input name="password" type="password" id="password"/><br />

	<label for="password2">確認用パスワード</label>
	<input name="password2" type="password2" id="password2"><br />

	<label for="branch">所属</label>
	<select name="branch">
		<c:forEach items="${branch}" var="branch" >
		<c:if test="${editUser.branchId == branch.id}">
			<option value="${editUser.branchId}" selected>${branch.name}</option>
		</c:if>
		<c:if test="${editUser.branchId != branch.id}">
			<option value="${branch.id}">${branch.name}</option>
		</c:if>
		</c:forEach>
	</select>

	<br>
	<label for="department">役職</label>
	<select name="department">
		<c:forEach items="${department}" var="department">
		<c:if test="${editUser.departmentId == department.id}">
			<option selected value="${editUser.departmentId}">${department.name}</option>
		</c:if>
		<c:if test="${editUser.departmentId != department.id}">
			<option value="${department.id}">${department.name}</option>
		</c:if>
		</c:forEach>
	</select>

	<br>
	<input type="submit" value="更新" /> <br />
	<a href="userControl">戻る</a>
</form>
<div class="copyright">&copy;Yutaro Ogawa</div>
</div>
</body>
</html>
