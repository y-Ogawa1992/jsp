<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="./css/style.css" rel="stylesheet" type="text/css">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>掲示板</title>
</head>
<body>
<div class="main-contents">

	<div class="header">
		<a href="./">ホーム</a>
		<a href="logout">ログアウト</a>
	</div>

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

<%-- 掲示板への書き込み機能(DB格納) --%>
<div class="form-area">
	<form action="message" method="post">
		<br />
		<label>タイトル(50文字以下)</label><br />
		<textarea name="title"cols="30" rows="1" ></textarea><br /><br />
		<%-- カテゴリー入力、とりあえず直接入力のみ --%>
		<label>カテゴリー(10文字以下)</label><br />
		<textarea name="category" cols="20" rows="1"></textarea><br /><br />
		<label>本文(1000文字まで)</label><br />
		<textarea name="text" cols="70" rows="10" class="tweet-box" wrap="hard"></textarea>
		<br />
		<br />
		<input type="submit" value="投稿">
	</form>
</div>
<br />
<div class="copyright">&copy;Yutaro Ogawa</div>
</div>
</body>
</html>