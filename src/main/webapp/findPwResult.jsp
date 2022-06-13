<%@ page import="com.example.demo.MemberDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/findPw.css" rel="stylesheet">
</head>
<body>
<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");

    MemberDB memberdb = new MemberDB();
    String findPw = memberdb.dofindPw(username, email);
%>
<form method="post">
    <%
        if(findPw != null){
    %>
    <div class="container">
        <h4>회원님의 비밀번호는 <%=findPw%> 입니다.<h4/>
    </div>
    <div class="btn-area find">
        <button type="button" onclick="location.href='login.jsp'">로그인</button>
    </div>
    <%
        }else {
    %>
    <div class="container">
        <h4>등록된 정보가 없습니다.</h4>
    </div>
    <div class="btn-area find">
        <button type="button" onclick="location.href='findPw.jsp'">다시 찾기</button>
    </div>
    <%
        }
    %>
</form>
</body>
</html>
