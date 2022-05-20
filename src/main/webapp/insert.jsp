<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - SeoHyeon</title>
    <link href="css/insert.css" rel="stylesheet"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<section class="insert-form">
    <h1>Sign Up</h1>
    <form action="insertproc.jsp">
        <div class="int-area">
            <input type="text" name="username" id="id" class="id" autocomplete="off" required/>
            <label for="id">사용자 이름</label>
            <div id="checkWarningId" style="display: none"></div>
        </div>
        <div class="int-area">
            <input type="text" name="email" id="email" class="email" autocomplete="off" required/>
            <label for="email">이메일</label>
            <div id="checkWarningEmail" style="display: none"></div>
        </div>
        <div class="int-area">
            <input type="password" name="password" id="pw" autocomplete="off" required/>
            <label for="pw">비밀번호</label>
        </div>
        <div class="gender-area">
            <select id="gender" name="gender">
                <option value></option>
                <option value="남성">남성</option>
                <option value="여성">여성</option>
                <option value="선택 안함">선택 안함</option>
            </select>
            <label for="gender" id="gd-label">성별</label>
        </div>
        <div class="btn-area">
            <button type="submit">가입하기</button>
        </div>
    </form>
</section>
<script type="text/javascript">
    const selectElement = document.querySelector("select");
    const label = document.getElementById("gd-label");

    selectElement.onfocus = () => {
        label.style.cssText = "top: -2px; font-size: 13px; color: #166caa;"
    }
    selectElement.onblur = () => {
        if(selectElement.options[document.querySelector("select").selectedIndex].value !== ''){
            label.style.cssText = "top: -2px; font-size: 13px; color: #166caa;"
        }else {
            label.style.cssText = "top: 15px; font-size: 18px; color: #000000;"
        }

    }
    selectElement.onchange = () => {
        label.style.cssText = "top: -2px; font-size: 13px; color: #166caa;"
    }

</script>
<script>
    $('.id').focusout(function () {
        let userId = $('.id').val();

        $.ajax({
            url : "IdCheck",
            type : "post",
            data : {userId: userId},
            dataType : 'json',
            success : function (result) {
                if (result == 0) {
                    $('#checkWarningId').attr('style','display:flex');
                    $('button').attr('style','pointer-events: none');
                } else {
                    $('#checkWarningId').attr('style','display:none');
                    $('button').attr('style','pointer-events: auto');
                }
            },
            error : function() {
                alert("서버요청실패");
            }
        })
    })
    $('.email').focusout(function () {
        let userEmail = $('.email').val();

        $.ajax({
            url : "EmailCheck",
            type : "post",
            data : {userEmail: userEmail},
            dataType : 'json',
            success : function (result) {
                if (result == 0) {
                    $('#checkWarningEmail').attr('style','display:flex');
                    $('button').attr('style','pointer-events: none');
                } else {
                    $('#checkWarningEmail').attr('style','display:none');
                    $('button').attr('style','pointer-events: auto');
                }
            },
            error : function() {
                alert("서버요청실패");
            }
        })
    })
</script>
</body>
</html>