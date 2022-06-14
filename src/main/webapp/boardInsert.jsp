<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>

</head>
<body>
<%@include file="head.jsp"%>
<div class="container mt-3">
    <form action="boardInsertproc.jsp">
        <h1 class="bg-success text-white">
            insert.jsp
        </h1>
        <div class="row">
            <div class="col">
                제목
                <input class="form-control" type="text" name="title">
                내용
                <textarea class="form-control" rows="15" name="content"></textarea>
                작성자
                <input class="form-control" type="text" name="name">
            </div>
        </div>
        <div class="row">
            <div class="col">
                <input class="btn btn-primary" type="submit" value="저장">
            </div>
        </div>
    </form>
</div>
</body>
</html>