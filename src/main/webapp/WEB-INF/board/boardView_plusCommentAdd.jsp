<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="../header_.jsp"></c:import>
<!-- Page header with logo and tagline-->
<header class="py-5 bg-light border-bottom mb-4">
    <div class="container">
        <div class="text-center my-5">
            <h1 class="fw-bolder">나만의 영화 선반</h1>
            <p class="lead mb-0">Movie Shelf</p>
        </div>
    </div>
</header>
<main>
    <section>
        <div class="small text-muted">MovieShelf</div>
        <h2>게시글</h2>
        <hr>
        <c:set var="log" value="${sessionScope.log}" scope="page"/>
        <c:set var="post" value="${requestScope.post}" scope="page"/>
        <c:set var="comments" value="${requestScope.comments}" scope="page"/>
        <c:set var="plusComment" value="${requestScope.plusComment}" scope="page"/>

        <table class="type22">
            <tbody>
            <tr>
                <td rowspan="4">
                    <img src="${post.movie_poster}"/>
                </td>
            </tr>
            <tr>
                <th>영화명 :</th>
                <td colspan="3">
                    <span id="movieText"><c:out value="${post.movie_name}"/></span>
                </td>
            </tr>
            <tr>
                <td>제목</td>
                <td><c:out value="${post.talk_title}"/></td>
                <td>작성자</td>
                <td><c:out value="${post.user_id}"/></td>
            </tr>
            <tr>
                <td>좋아요 수</td>
                <td><c:out value="${post.talk_likes}"/></td>

                <td>작성일</td>
                <td><c:out value="${post.talk_regdate}"/></td>
            </tr>
            <tr>
                <td height="500px" colspan="4"><c:out value="${post.talk_content}"/></td>
            </tr>
        </table>

        <%-- 로그인 되어있지만 아이디 다르면 => 좋아요(자기게시물 좋아요 불가)--%>
        <c:if test="${log != null && !log.user_id.equals(post.user_id)}">
            <button onclick="location.href='${pageContext.request.contextPath}/board/${post.talk_no}/increaseLike'">
                좋아요+1
            </button>

        </c:if>
        <%-- 로그인 되어있고 아이디 같으면 => 수정/삭제--%>
        <c:if test="${log != null && log.user_id.equals(post.user_id)}">
            <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/boardUpdateForm/${post.talk_no}'">게시글
                수정
            </button>
            <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/boardDelete/${post.talk_no}'">게시글
                삭제
            </button>
        </c:if>

        <table class="comments">
            <tr>
                <td width="200px">작성자</td>
                <td width="300px">댓글</td>
                <td>@</td>
                <td>+</td>
                <td>-</td>
            </tr>
            <c:forEach var="comment" items="${comments}">
                <tr>
                    <c:choose>
                        <c:when test="${log != null && comment.depth == 0}">
                            <td><c:out value="${comment.user_id}"/></td>
                            <td><c:out value="${comment.comment_content}"/></td>
                            <td></td>
                        </c:when>
                        <%-- comment comment_id가 받아온 객체(dto)와 같을 경우 내용 입력받음--%>
                        <c:when test="${log != null && comment.depth == 1 && comment.sort_no == plusComment.sort_no}">
                            &nbsp;<td>ㄴ<c:out value="${comment.user_id}"/></td>
                            <form action="/board/comment/setPlusComment/${post.talk_no}/${comment.comment_id}">
                                <td><input type="text" name="plusComment" id="plusComment"></td>
                                <td><input class="btn btn-primary" type="submit" value="작성"></td>
                            </form>
                        </c:when>

                        <c:when test="${log != null && comment.depth == 1 && comment.sort_no != plusComment.sort_no}">
                            &nbsp;<td>ㄴ<c:out value="${comment.user_id}"/></td>
                            <td><c:out value="${comment.comment_content}"/></td>
                            <td></td>
                        </c:when>
                    </c:choose>

                    <c:choose>
                        <c:when test="${log != null && log.user_id.equals(comment.user_id)}">
                            <td>
                                <button class="btn btn-primary" onclick="location.href='/board/${post.talk_no}/updateComment/${comment.comment_id}'">
                                    수정
                                </button>
                            </td>
                            <td>
                                <button class="btn btn-primary" onclick="location.href='/board/comment/deleteComment/${comment.comment_id}'">
                                    삭제
                                </button>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td></td>
                            <td></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </table>
        <%-- 로그인 되어있으면 => 댓글달기(자기 게시물도 가능)--%>
        <c:if test="${log != null}">
            <form action="/board/comment/addComment/${post.talk_no}">
                <input type="text" name="comment" id="comment" placeholder="댓글" required/>
                <input class="btn btn-primary" type="submit" value="댓글달기"/>
            </form>
        </c:if>
    </section>
</main>

<script>
    document.getElementById("plusComment").focus();
</script>
<c:import url="../footer_.jsp"></c:import>

