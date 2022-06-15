<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.BoardManager" %>
<%@ page import="com.example.demo.Board" %>

<%
  String pageNum = request.getParameter("pageNum");
  if(pageNum == null) pageNum = "1";

  BoardManager bm = new BoardManager();
  List<Board> list = bm.doselect( Integer.parseInt(pageNum) );
  int pagecnt = bm.getPageCnt();

%>
<link href="css/board.css" rel="stylesheet">
<div class="container">
  <div class="board-table">
      <table class="table">
        <thead>
        <tr class="table-primary">
          <th class="column1" scope="col">번호</th>
          <th class="column2" scope="col">제목</th>
          <th class="column3" scope="col">글쓴이</th>
          <th class="column4" scope="col">작성일</th>
          <th class="column5" scope="col">조회수</th>
        </tr>
        </thead>
        <tbody>
        <% for(Board board : list) { %>
        <tr>
          <td class="column1"><%=board.getIdx()%></td>
          <td class="column2 title1"><a href="view.jsp?idx=<%=board.getIdx()%>"><%=board.getTitle()%></a></td>
          <td class="column3"><%=board.getName()%></td>
          <td class="column4"><%=board.getWDate()%></td>
          <td class="column5"><%=board.getCount()%></td>
        </tr>
        <% } %>
        </tbody>
      </table>
  </div>
  <div class="listBtn">
    <% if( Integer.parseInt(pageNum) != 1) {%>
    <a class="prev" href="?pageNum=<%=Integer.parseInt(pageNum)-1%>"></a>
    <% } %>
    <% for(int i=1;i<pagecnt+1; i++) {%>
    <a href="?pageNum=<%=i%>" id="page"><%=i%></a>
    <% } %>
    <% if( pagecnt > 1 && Integer.parseInt(pageNum) < pagecnt) {%>
    <a class="next" href="?pageNum=<%=Integer.parseInt(pageNum)+1%>"></a>
    <% } %>
  </div>
  <div class="btn-area">
    <button type="button" onclick="location.href='boardInsert.jsp'">글 쓰기</button>
  </div>
</div>

<script type="text/javascript">
  window.onload = function (){
    const pages = document.querySelectorAll('#page');
    let url = document.location.href.split('=')[1];
    if(url == null){
      url = 1;
    }

    pages.forEach((page) => {

      if (page.href.split('=')[1] == url) {
        page.style.cssText = " background-color: #42454c; color: #ffffff; border: 1px solid #42454c;"
      }
    })
  }
</script>
