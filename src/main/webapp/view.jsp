<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.demo.BoardManager" %>
<%@ page import="com.example.demo.Board" %>
<%
    String idx = request.getParameter("idx");
    if(idx == null) idx = "1";
    BoardManager bm = new BoardManager();
    bm.docount(Integer.parseInt(idx));
    Board board = bm.doselectrow( Integer.parseInt(idx) );
%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link href="css/view.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
<div class="center">
    <div class="container">
        <div class="head">
            <h3><%=board.getTitle()%></h3>
            <div class="il">
                <span><%=board.getName()%></span>
                <span class="date"><%=board.getWDate()%></span>
            </div>
            <div class="ir">
                <span>조회 <%=board.getCount()%></span>
            </div>
        </div>
        <div class="center">
            <div class="content">
                <%=board.getContent()%>
            </div>
        </div>
        <div class="btn-area">
            <button type="button" onclick="location.href='boardUpdatePassCheck.jsp?idx=<%=board.getIdx()%>'">수정</button>
            <button type="button" onclick="location.href='boardPasscheck.jsp?idx=<%=board.getIdx()%>'">삭제</button>
        </div>
    </div>
</div>
</body>
</html>