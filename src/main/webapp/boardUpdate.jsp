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
    <link href="css/boardUpdate.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
<div class="center">
    <div class="container">
        <form action="boardUpdateproc.jsp" style="margin-block-end: 0;">
            <div>
                <div class="area">
                    <input class="insert-name" type="text" name="name" value="<%=board.getName()%>">
                    <span>닉네임</span>
                </div>
                <div class="area area-title">
                    <input class="insert-title" type="text" name="title" value="<%=board.getTitle()%>">
                    <span class="span-title">제목</span>
                </div>
                <textarea class="content" name="content" placeholder="내용을 입력해 주세요."><%=board.getContent()%></textarea>
            </div>
            <div class="btn-area">
                <button type="reset">취소</button>
                <button type="submit" name="idx" value="<%=idx%>">저장</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
