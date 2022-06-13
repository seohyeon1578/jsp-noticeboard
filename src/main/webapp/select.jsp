<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.Member" %>
<%@ page import="com.example.demo.MemberDB" %>

<%
    MemberDB md = new MemberDB();
    List<Member> list = md.doselect();

    int dataCnt = list.size();

    int dataLimit = 16;

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
    System.out.println(pageNum);

    int currentPage = Integer.parseInt(pageNum);

    int start = (currentPage - 1) * dataLimit;
    if (start == 1) {
        start = 0;
    }

    int end = currentPage * dataLimit;
    if (end > dataCnt) {
        end = dataCnt;
    }
    System.out.println(start);
    System.out.println(end);
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - SeoHyeon</title>
    <link href="css/select.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp" %>
<section>
    <form action="delete.jsp">
        <div class="select-table">
            <table>
                <thead>
                <tr>
                    <th class="column1">
                        <input type="checkbox" name="checkedAll" id="checkedAll" onclick="checkAll(this)"/>
                        <label for="checkedAll"></label>
                    </th>
                    <th class="column2">번호</th>
                    <th class="column3">이름</th>
                    <th class="column4">이메일</th>
                    <th class="column5">비번</th>
                    <th class="column6">성별</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (int i = start; i < end; i++) {
                        Member member = list.get(i);
                %>
                <tr>
                    <td class="column1">
                        <input type="checkbox" name="id" id="<%=member.getId()%>" value="<%=member.getId()%>"
                               onclick="checkSelectAll()"/>
                        <label for="<%=member.getId()%>"></label>
                    </td>
                    <td class="column2"><%=member.getId()%>
                    </td>
                    <td class="column3"><%=member.getUsername()%>
                    </td>
                    <td class="column4"><%=member.getEmail()%>
                    </td>
                    <td class="column5"><%=member.getPassword()%>
                    </td>
                    <td class="column6"><%=member.getGender()%>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <div class="listBtn">
                <%
                    if (dataCnt != 0) {

                        int pageCount = dataCnt / dataLimit + (dataCnt % dataLimit == 0 ? 0 : 1);

                        int pageLimit = 10;

                        int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
                        int endPage = startPage + pageLimit - 1;
                        if (endPage > pageCount) {
                            endPage = pageCount;
                        }
                %>
                <%
                    if (startPage > pageLimit) {
                %>
                <a href="select.jsp?pageNum=<%=startPage-pageLimit%>" class="prev"></a>
                <%} %>
                <%
                    for (int i = startPage; i <= endPage; i++) {
                %>
                <a href="select.jsp?pageNum=<%=i %>" id="page"><%=i %>
                </a>
                <%} %>
                <%
                    if (endPage < pageCount) {
                %>
                <a href="select.jsp?pageNum=<%=startPage+pageLimit%>" class="next"></a>
                <%
                        }
                    }
                %>
            </div>
        </div>
        <input type="submit" value="삭제"/>
    </form>
</section>
<script type="text/javascript">
    function checkSelectAll() {

        const checkboxes = document.querySelectorAll('input[name="id"]');

        const checked = document.querySelectorAll('input[name="id"]:checked');

        const checkedAll = document.querySelector('input[name="checkedAll"]');

        if (checkboxes.length === checked.length) {
            checkedAll.checked = true;
        } else {
            checkedAll.checked = false;
        }

    }

    function checkAll(checkAll) {
        const checkboxes = document.getElementsByName('id');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = checkAll.checked;
        })
    }

    const pages = document.querySelectorAll('#page');
    const url = document.location.href.split('=')[1];

    pages.forEach((page) => {

        if (page.href.split('=')[1] == url) {
            page.style.cssText = " background-color: #42454c; color: #ffffff; border: 1px solid #42454c;"
        }
    })
</script>
</body>
</html>