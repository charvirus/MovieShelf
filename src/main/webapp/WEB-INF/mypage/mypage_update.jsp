<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="../header_.jsp"></c:import>
<main>
    <c:set var="log" value="${sessionScope.log}"/>
    <c:set var="select" value="${requestScope.select}" scope="page"/>
    <c:set var="ta" value="${requestScope.ta}" scope="page"/>
    <c:set var="ca" value="${requestScope.ca}" scope="page"/>
    <c:set var="wa" value="${requestScope.wa}" scope="page"/>

    <c:choose>
        <c:when test="${log != null}">
    <h2>나의 마이페이지 목록</h2>
    <button onclick="location.href='/main/mypage/update'">개인정보수정</button>
    <button onclick="location.href='/main/mypage/1'">게시글</button>
    <button onclick="location.href='/main/mypage/2'">댓글</button>
    <button onclick="location.href='/main/mypage/3'">위시리스트</button>
            <section>
                <div class="small text-muted">MovieShelf</div>
                <h2>개인정보 수정</h2>
            <ul>
                <li>아이디 : <c:out value="${pwC.user_id}"/></li>
                <li>비밀번호 : <input type="password" name="pw"></li>
                <li>이름 : <input type="text" name="name" value="${pwC.user_name}"></li>
                <li>닉네임 : <input type="text" name="nick_name" value="${pwC.user_nickname}"></li>
            </ul>
            <input type="submit" value="수정">
        </c:when>
    </c:choose>
    <c:set var="pwC" value="${sessionScope.log}"/>

</main>
<c:import url="../footer_.jsp"></c:import>
