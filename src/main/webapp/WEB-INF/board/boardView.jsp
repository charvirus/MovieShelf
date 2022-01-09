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
        <c:set var="log" value="${sessionScope.log}" scope="page"/>
        <c:set var="post" value="${requestScope.post}" scope="page"/>
        <c:set var="comments" value="${requestScope.comments}" scope="page"/>
        <div class="small text-muted">MovieShelf</div>
        <h2>게시글</h2>
        <hr>

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
                <th>제목</th>
                <td><c:out value="${post.talk_title}"/></td>
                <th>작성자</th>
                <td><c:out value="${post.user_id}"/></td>
            </tr>
            <tr>
                <th>좋아요 수</th>
                <td><c:out value="${post.talk_likes}"/></td>

                <th>작성일</th>
                <td><c:out value="${post.talk_regdate}"/></td>
            </tr>
            <tr>
                <td height="500px" colspan="4"><c:out value="${post.talk_content}"/></td>
            </tr>
            </tbody>
        </table>

        <%-- 로그인 되어있지만 아이디 다르면 => 좋아요(자기게시물 좋아요 불가)--%>
        <c:if test="${log != null && !log.user_id.equals(post.user_id)}">
            <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/${post.talk_no}/increaseLike'">
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

        <hr>

        <table class="comments">
            <thead>
            <tr>
                <th width="200px">작성자</th>
                <th width="300px">댓글</th>
                <th>@</th>
                <th>+</th>
                <th>-</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="comment" items="${comments}">
                <tr>
                    <c:choose>
                        <c:when test="${ comment.depth == 0}">
                            <td><c:out value="${comment.user_id}"/></td>
                            <td><c:out value="${comment.comment_content}"/></td>
                            <c:if test="${log != null}">
                                <td>
                                    <button class="btn btn-primary" onclick="location.href='/board/comment/addPlusComment/${post.talk_no}/${comment.sort_no}/${comment.comment_id}'">
                                        대댓글
                                    </button>
                                </td>
                            </c:if>
                        </c:when>
                        <c:when test="${comment.depth == 1}">
                            &nbsp;&nbsp;&nbsp;&nbsp;<td>ㄴ<c:out value="${comment.user_id}"/></td>
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
            </tbody>
        </table>
        <%-- 로그인 되어있으면 => 댓글달기(자기 게시물도 가능)--%>
        <c:if test="${log != null}">
                <form action="/board/comment/addComment/${post.talk_no}">
                    <input type="text" name="comment" id="comment" class="form-control" placeholder="댓글" required/>
                    <input class="btn btn-primary" type="submit" value="댓글달기"/>
                </form>
        </c:if>
    </section>
</main>
<c:import url="../footer_.jsp"></c:import>
