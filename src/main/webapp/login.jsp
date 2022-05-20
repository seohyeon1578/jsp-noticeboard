<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link href="css/login.css" rel="stylesheet">
</head>
<body>
<section class="login-form">
    <h1>Login</h1>
    <form action="loginproc.jsp">
        <div class="int-area">
            <input type="text" name="username" id="id" autocomplete="off" required>
            <label for="id">사용자 이름 또는 이메일</label>
        </div>
        <div class="int-area">
            <input type="password" name="password" id="pw" autocomplete="off" required>
            <label for="pw">비밀번호</label>
        </div>
        <%
            String checked = (String) session.getAttribute("check");
            if(checked == "false"){
        %>
        <div class="id_pwCheck">아이디 또는 비밀번호를 잘못 입력했습니다.</div>
        <%
            }
        %>
        <div class="btn-area">
            <button type="submit">로그인</button>
        </div>
    </form>
    <div class="caption">
        <a href="">비밀번호를 잊으셨나요?</a>
        <a href="insert.jsp">회원가입</a>
    </div>
</section>
</body>
</html>
