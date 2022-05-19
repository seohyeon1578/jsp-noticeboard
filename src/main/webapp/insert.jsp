<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - SeoHyeon</title>
    <link href="css/insert.css" rel="stylesheet"/>
</head>
<body>
<section class="insert-form">
    <h1>Sign Up</h1>
    <form action="insertproc.jsp">
        <div class="int-area">
            <input type="text" name="username" id="id" autocomplete="off" required/>
            <label for="id">사용자 이름 또는 이메일</label>
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
</body>
</html>