<%--
  Created by IntelliJ IDEA.
  User: BrandonJ
  Date: 2021-12-31-031
  Time: 오후 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<main id="headerMain">
    <ul id="headerMenu1">
        <li><a href="service?command=academy">아카데미 작품상</a></li>
        <li><a href="service?command=boxOffice">극장 상영작 영화</a></li>
        <li><a href='service?command=talkList'>영화 게시판</a></li>
        <li><a href="service?command=myPage">마이페이지</a></li>
    </ul>
    <ul id="headerMenu2">

        <li id="headerLogin"><a href="login">로그인</a></li>
        <li id="headerSignUp"><a href="signUp">회원가입</a></li>

    </ul>
</main>
</body>
</html>
