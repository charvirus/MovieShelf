<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../header_.jsp"></c:import>
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
<c:set var="logError" value="${sessionScope.logError}"></c:set>
<c:set var="logPlz" value="${sessionScope.logPlz}"></c:set>
<c:choose>
    <c:when test="${logError == 1}">
        <script>
            alert("ID, 비밀번호가 틀리거나 존재하지 않는 회원입니다.");
        </script>
        <c:remove var="logError" scope="session"/>
    </c:when>
    <c:when test="${logPlz == 1}">
        <script>
            alert("로그인 후 사용 가능합니다");
        </script>
        <c:remove var="logPlz" scope="session"/>
    </c:when>
</c:choose>
<c:import url="../footer_.jsp"></c:import>

