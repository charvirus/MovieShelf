<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="../header_.jsp"></c:import>
<!-- Page header with logo and tagline-->
<main>
    <c:set var="log" value="${sessionScope.log}"/>
    <c:set var="select" value="${requestScope.select}" scope="page"/>
    <c:set var="ta" value="${requestScope.ta}" scope="page"/>
    <c:set var="ca" value="${requestScope.ca}" scope="page"/>
    <c:set var="wa" value="${requestScope.wa}" scope="page"/>
    <c:choose>
        <c:when test="${log != null}">
            <button onclick="location.href='/mypage/mypage_check'">개인정보수정</button>
            <button onclick="location.href='/main/mypage/2'">게시글</button>
            <button onclick="location.href='/main/mypage/3'">댓글</button>
            <button onclick="location.href='/main/mypage/4'">위시리스트</button>

            <section>
                <div class="small text-muted">MovieShelf</div>
                <h2>나의 마이페이지 목록</h2>
                <c:choose>
                    <c:when test="${select == 1}">

                    </c:when>
                    <c:when test="${select == 2}">
                        <h4>나의 게시글 수 : <c:out value="${ta.size()}"/> </h4>
                        <h4>게시글 목록</h4>
                        <table class="type22">
                            <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>좋아요</th>
                                <th>작성일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="post" items="${ta}">
                                <tr>
                                    <td><c:out value="${post.talk_no}"/></td>
                                    <td onclick="location.href='/board/${post.talk_no}'"><c:out
                                            value="${post.talk_title}"/></td>
                                    <td><c:out value="${post.talk_likes}"/></td>
                                    <td><c:out value="${post.talk_regdate}"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table><br>
                    </c:when>
                    <c:when test="${select == 3}">
                        <h4>나의 댓글 수 : <c:out value="${ca.size()}"/> </h4>
                        <h4>댓글 목록</h4>
                        <table class="type22">
                            <thead>
                            <tr>
                                <th>번호</th>
                                <th>댓글</th>
                                <th>대댓글수</th>
                                <th>작성일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="comment" items="${ca}">
                                <tr>
                                    <td><c:out value="${comment.talk_no}"/></td>
                                    <td onclick="location.href='/board/${comment.talk_no}'"><c:out value="${comment.comment_content}"/></td>
                                    <td><c:out value="${comment.depth}"/></td>
                                    <td><c:out value="${comment.comment_date}"/> </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table><br>
                    </c:when>
                    <c:when test="${select == 4}">
                        <h4>나의 볼영화 수 : <c:out value="${wa.size()}"/> </h4>
                        <h4>찜 목록</h4>
                        <c:forEach var="wish" items="${wa}">
                            <c:out value="${wish}"/>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </section>
        </c:when>
        <c:otherwise>
            <h2>메인페이지 이동</h2>
            <c:redirect url="../main.jsp"></c:redirect>
        </c:otherwise>
    </c:choose>

</main>
<c:import url="../footer_.jsp"></c:import>
