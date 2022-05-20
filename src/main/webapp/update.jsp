<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.demo.Member" %>
<%@ page import="com.example.demo.MemberDB" %>
<html>
<head>
    <title>JSP - SeoHyeon</title>
    <link href="css/update.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
<main>
    <%
        MemberDB md = new MemberDB();
        Member member = md.doselectId(username);
        md.doselectId(username);


        int id = member.getId();
        String username1 = member.getUsername();
        String email = member.getEmail();
        String password = member.getPassword();
        String gender = member.getGender();
    %>
    <section class="update-form">
        <form action="updateproc.jsp">
            <input type="hidden" name="id" value="<%=id%>" />
            <div class="int-area">
                <div class="title">
                    <h3>이름</h3>
                </div>
                <input type="text" name="username" value="<%=username1%>"/>
            </div>
            <div class="int-area">
                <div class="title">
                    <h3>이메일</h3>
                </div>
                <input type="text" name="email" value="<%=email%>"/>
            </div>
            <div class="int-area">
                <div class="title">
                    <h3>비밀번호</h3>
                </div>
                <input type="text" name="password" value="<%=password%>"/>
            </div>
            <div class="gender-area">
                <div class="title">
                    <h3>성별</h3>
                </div>
                <select id="gender" name="gender">
                    <option selected><%=gender%></option>
                    <option value="남성">남성</option>
                    <option value="여성">여성</option>
                    <option value="선택 안함">선택 안함</option>
                </select>
            </div>
            <div class="btn-area">
                <button type="reset" class="reset">취소</button>
                <button type="submit" class="submit">저장</button>
            </div>
        </form>
        <form action="deleteId.jsp">
            <div class="secession">
                <div class="title">
                    <h3>회원 탈퇴</h3>
                </div>
                <button type="submit" name="id" value="<%=id%>">회원 탈퇴</button>
            </div>
        </form>
    </section>
</main>
</body>
</html>