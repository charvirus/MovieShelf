<%--
  Created by IntelliJ IDEA.
  User: BrandonJ
  Date: 2021-12-31-031
  Time: 오후 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Movie Shelf</title>
</head>
<body>
<div id="grid">
    <header id="subheader1"></header>
    <header id="mainheader">
        <c:import url="../header.jsp"></c:import>
    </header>
    <header id="subheader2"></header>
    <nav></nav>
    <main>
        <section>
            <form method="post" action="loginPro">
                <article id="idpws">
                    <span>ID&#9;<input type="text" name="id" required></span>
                    <span>PW&#9;<input type="password" name="pw" required></span>
                    <input id="submit" type="submit" value="로그인">
                </article>
            </form>
        </section>
    </main>
    <aside></aside>
    <footer id="subfooter1"></footer>
    <footer id="mainfooter"><c:import url="../footer.jsp"></c:import></footer>
    <footer id="subfooter2"></footer>
</div>
<c:set var="logError" value="${sessionScope.logError}"></c:set>
<c:choose>
    <c:when test="${logError == 1}">
        <script>
            alert("ID, 비밀번호가 틀리거나 존재하지 않는 회원입니다.");
        </script>
    </c:when>
</c:choose>
</body>
</html>
