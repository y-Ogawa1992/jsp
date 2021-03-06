<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ユーザーの設定</title>


	<script type="text/javascript">
	<!--
	function check(stop){
		switch (stop){
		case (stop = false):
			if(window.confirm('このアカウントを停止しますか？')){ // 確認ダイアログを表示
				return true; // 「OK」時は送信を実行
			}
			else{ // 「キャンセル」時の処理
				window.alert('キャンセルされました'); // 警告ダイアログを表示
				return false; // 送信を中止
			} break;
		case (stop = true):
			if(window.confirm('このアカウントを稼動しますか？')){ // 確認ダイアログを表示
				return true; // 「OK」時は送信を実行
			}
			else{ // 「キャンセル」時の処理
				window.alert('キャンセルされました'); // 警告ダイアログを表示
				return false; // 送信を中止
			} break;
		}
	}
	// -->
	</script>

	<style type="text/css">
	.table4 {
		border-collapse: collapse;
		width: 450px;
	}
	.table4 th {
		background-color: #cccccc;
	}
	</style>
</head>

<body>
<div class="main-contents">
	<div class="header">
		<a href="logout">ログアウト</a>
	</div>

		<a href="./">ホーム</a>
		<a href="signup">ユーザー新規登録</a>
		<br /><br />

<c:if test="${ not empty errorMessages }">
	<div class="errorMessages">
		<ul>
			<c:forEach items="${errorMessages}" var="message">
				<li><c:out value="${message}" />
			</c:forEach>
		</ul>
	</div>
	<c:remove var="errorMessages" scope="session"/>
</c:if>

<h2>ユーザー管理</h2>

<%-- ユーザー管理画面にユーザー一覧を表示する --%>
<%-- テーブルを作る --%>

<div class="table">
<table border=1>
 <tr><th>名前</th><th>ログインID</th><th>所属</th><th>役職</th><th>ON/OFF</th><th>編集</th></tr>

		<c:forEach items="${Users}" var="User">
		<form action="userControl" method="post" onSubmit="return check(${User.stop})">
		<input type="hidden" name="id" value="${User.id}">
		<input type="hidden" name="stop" value="${User.stop}">
			<tr>
				<td>${User.name}</td>
				<td>${User.loginId}</td>
				<td>
				<c:forEach items="${branch}" var="branch">
					<c:if test="${User.branchId == branch.id}">
					<c:out value="${branch.name}" />
					</c:if>
				</c:forEach>
				</td>
				<td>
					<c:forEach items="${department}" var="department">
					<c:if test="${User.departmentId == department.id}">
					<c:out value="${department.name}" />
					</c:if>
					</c:forEach>
				</td>
				<td>

				<c:if test="${loginUser.id != User.id}">
				<c:choose>
					<c:when test="${User.stop == true}"><FONR color="red"><input name="stop" type="submit" value="停止" /></FONR></c:when>
					<c:when test="${User.stop == false}"><input name="stop" type="submit" value="稼働中" /></c:when>
				</c:choose>
				</c:if>
				</td>
				<td><a href="settings?id=${User.id}">編集</a></td>
			</tr>
		</form>
		</c:forEach>
</table>
</div>


<div class="copyright">&copy;Yutaro Ogawa</div>
</div>
</body>
</html>
