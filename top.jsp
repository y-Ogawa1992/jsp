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

<%-- 本社人事総務の場合 --%>
<c:if test="${user.departmentId == 1}">
	<a href="message">新規投稿</a>
	<a href="userControl">ユーザー管理</a>
	<a href="logout">ログアウト</a>
</c:if>

<%-- その他の場合 --%>
<c:if test="${user.departmentId != 1}">
	<a href="message">新規投稿</a>
	<a href="logout">ログアウト</a>
</c:if>




<%--ログイン成功後に自分の情報が表示されるようにする --%>
<c:if test="${not empty loginUser }">
	<div class="profile">
		<div class="name"><h2><c:out value="${loginUser.name}" /></h2></div>

		<%--<div class="branch"><c:out value="${loginUser.branchId}" /></div> --%>

	</div>
</c:if>

<br /><br /><br /><br /><br />

<%-- 投稿をカテゴリ、投稿日時で絞込（検索する？） --%>
	<form action="./" method="get"><br />
	<label for="categories">カテゴリ</label>
	<select name="category">
		<c:forEach items="${categories}" var="categories" >
			<option value="${categories.category}">${categories.category}</option>
		</c:forEach>
	</select>
	<input type="hidden" name="messageId" value="${message.messageId}">

	<label for="minInsertDate">投稿日時</label>

	<div class="minInsertDate">
		<input type="date" name="minInsertDate" value="${insertDate.insertDate}">
	</div>
	～
	<div class="maxInsertDate">
		<input type="date" name="maxInsertDate" value="${insertDate.insertDate}">
	</div>
	<input type="submit" value="検索">
	<br><br>
	</form>

<%-- トップ画面に投稿を表示する --%>
<div class="messages">
	<c:forEach items="${messages}" var="message">
		<div class="message">
		<div class="title"><c:out value="${message.title}" /></div>
		<div class="category"><c:out value="${message.category}" /></div>
		<span class="name"><c:out value="${message.name}"/></span>
		<div class="text"><c:out value="${message.text}" /></div>
		<div class="date"><fmt:formatDate value="${message.insertDate}" pattern="yyyy/MM/dd HH:mm:ss" /></div>

	<%--loginuserのbranchIdが2departmentIdが3で投稿したユーザーのbranchIdが2 --%>
	<form action="./" method="post">
	<c:if test="${loginUser.departmentId == 2}">
		<input type="hidden" name="messageId" value="${message.messageId}">
		<input type="submit" value="投稿を削除">
	</c:if>
	<c:if test="${loginUser.branchId == 2 && loginUser.departmentId == 3 &&
			message.branchId == 2 && message.departmentId == 4}">
		<input type="hidden" name="messageId" value="${message.messageId}">
		<input type="submit" value="投稿を削除">
	</c:if>
	<c:if test="${loginUser.branchId == 3 && loginUser.departmentId == 3 &&
			message.branchId == 3 && message.departmentId == 4}">
		<input type="hidden" name="messageId" value="${message.messageId}">
		<input type="submit" value="投稿を削除">
	</c:if>
	<c:if test="${loginUser.branchId == 4 && loginUser.departmentId == 3 &&
			message.branchId == 4 && message.departmentId == 4}">
		<input type="hidden" name="messageId" value="${message.messageId}">
		<input type="submit" value="投稿を削除">
	</c:if>
	<c:if test="${loginUser.id == message.userId}">
		<input type="hidden" name="messageId" value="${message.messageId}">
		<input type="submit" value="投稿を削除">
	</c:if>
	</form>


		<br />
		<%--ここに投稿に対するコメントを表示する --%>
		<c:forEach items="${comments}" var="comment">
			<c:if test="${message.messageId == comment.messageId}">
				<div class="comment">
				<div class="text"><c:out value="${comment.text}" /></div>
				<span class="name"><c:out value="${comment.name}"/></span>
				<div class="date"><fmt:formatDate value="${comment.insertDate }" pattern="yyyy/MM/dd HH:mm:ss" /></div>

				</div>
			</c:if>
		</c:forEach>

		<%--ここにコメントをDB格納する機能 --%>
		<form action="newComment" method="post">
		<input type="hidden" name="messageId" value="${message.messageId}">
		<label>コメント</label><br />
		<textarea name="text" cols="30" rows="5" class="tweet-box"></textarea>
		<input type="submit" value="投稿にコメント">(500文字まで)<br /><br />
		</form>
		</div>
	</c:forEach>
</div>

</div>
<div class="copyright">Copyright(c)Yutaro Ogawa</div>
</body>
</html>