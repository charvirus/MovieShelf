<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jhe
  Date: 2022-01-03
  Time: 오전 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Movie Shelf - Sign Up</title>
</head>
<body>
<div id="grid">
    <header id="subheader1"></header>
    <header id="mainheader"><c:import url="../header.jsp"></c:import></header>
    <header id="subheader2"></header>
    <nav></nav>
    <main>
        <section>
            <form onSubmit="return false;">
                <article id="idpws">
                    <p>ID&#9;<input type="text" name="id" id="idInput" required></p>
                    <p id="pId"></p>
                    <p>PW&#9;<input type="password" name="pw" id="pwInput" required></p>
                    <p id="pPw"></p>
                    <p>이름&#9;<input type="text" name="name" id="nameInput" required></p>
                    <p id="pName"></p>
                    <p>닉네임&#9;<input type="text" name="nickname" id="nicknameInput" required></p>
                    <p id="pNickname"></p>
                    <input id="submit" type="submit" value="가입" onclick="signUpUser(form)">
                </article>
            </form>
        </section>
    </main>
    <aside></aside>
    <footer id="subfooter1"></footer>
    <footer id="mainfooter"><c:import url="../footer.jsp"></c:import></footer>
    <footer id="subfooter2"></footer>
</div>
<c:set var="signUpError" value="${sessionScope.signUpError}"></c:set>
<c:choose>
    <c:when test="${signUpError == 1}">
        <script>
            alert("중복되는 ID 입니다.");
        </script>
    </c:when>
</c:choose>
<script type="text/javascript" src="script/signUp.js"></script>

</body>
</html>
