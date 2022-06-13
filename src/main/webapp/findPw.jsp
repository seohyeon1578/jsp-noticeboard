<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/findPw.css" rel="stylesheet">
</head>
<body>
<section class="findPw-form">
    <h1>Forgot Password</h1>
    <form action="findPwResult.jsp">
        <div class="int-area">
            <input type="text" name="username" id="id" autocomplete="off" required>
            <label for="id">사용자 이름</label>
        </div>
        <div class="int-area">
            <input type="text" name="email" id="email" autocomplete="off" required>
            <label for="email">이메일</label>
        </div>
        <div class="btn-area">
            <button type="submit">찾기</button>
        </div>
    </form>
</section>
</body>
</html>
