<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link href="css/boardInsert.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
<div class="center">
    <div class="container">
        <form action="boardInsertproc.jsp">
            <div class="row">
                <div class="area">
                    <input class="insert-name" type="text" id="name" name="name" autocomplete="off" onclick="labelNone('name')" required>
                    <label for="name" id="nameLabel">닉네임</label>
                </div>
                <div class="area">
                    <input class="insert-title" type="text" id="title" name="title" autocomplete="off" onclick="labelNone('title')" required>
                    <label for="title" id="titleLabel">제목을 입력해 주세요.</label>
                </div>
                <textarea class="content" name="content" placeholder="내용을 입력해 주세요."></textarea>
            </div>
            <div class="btn-area">
                <button type="reset">취소</button>
                <button type="submit">등록</button>
            </div>
        </form>
    </div>
</div>
<script>
    function labelNone(id) {
        let label = null;
        if(id == 'name'){
            label = document.getElementById("nameLabel");
        }else if(id == 'title'){
            label = document.getElementById('titleLabel');
        }

        label.innerText = "";
    }
</script>
</body>
</html>