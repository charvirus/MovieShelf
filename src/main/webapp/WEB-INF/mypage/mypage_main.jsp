<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="../header_.jsp"></c:import>
<!-- Page header with logo and tagline-->
<main>
    <c:set var="" value="${requestScop}" scope="page"/>
    <c:set var="select" value="${requestScope.select}" scope="page"/>

    <button onclick="location.href='/main/mypage/1'">게시글</button>
    <button onclick="location.href='/main/mypage/2'">댓글</button>
    <button onclick="location.href='/main/mypage/3'">위시리스트</button>

    <section>
        <div class="small text-muted">MovieShelf</div>
        <h2>나의 마이페이지 목록</h2>
        <c:choose>
        <c:when test="#{select == 1}">
            <ul>
                <li><span onclick="location.href='/board/${post.talk_no}'">게시글 제목</span></li>
                <li><input type="submit" ></li>
            </ul>
        </c:when>
        <c:when test="#{select == 2}">
            <ul>
                <li><input type="submit" onclick="location.href=''"></li>
            </ul>
        </c:when>
        <c:when test="#{select == 3}">
            <ul>
            <li> <input type="submit" onclick="location.href=''"></li>
            </ul>
        </c:when>
        </c:choose>
    </section>
</main>
<c:import url="../footer_.jsp"></c:import>
