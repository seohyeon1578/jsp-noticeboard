<%@ page import="com.example.demo.BoardManager" %>
<%@ page import="com.example.demo.Board" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String idx = request.getParameter("idx");
    if(idx == null) idx = "1";
    BoardManager bm = new BoardManager();
    Board board = bm.doselectrow( Integer.parseInt(idx) );
%>
<html>
<head>
    <title>Title</title>
    <link href="css/boardPasscheck.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
<form action="passCheckproc.jsp">
    <div class="center">
        <div class="container">
            <div class="border">
                <div class="inner">
                    <b class="text">비밀번호를 입력하세요.</b>
                    <input class="inner-pw" type="password" name="pass">
                    <div class="btn-box">
                        <button type="button" class="reset" onclick="location.href = 'view.jsp?idx=<%=board.getIdx()%>'">취소</button>
                        <button type="submit" class="submit" name="idx" value="<%=idx%>">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
