<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글</title>
</head>
<body>
<div class="gird">
    <header id="subheader1"></header>
    <header id="mainheader"><c:import url="../header.jsp"></c:import></header>
    <header id="subheader2"></header>
    <main>
        <section>
            <h2>게시글</h2>
            <c:set var="log" value="${sessionScope.log}" scope="page"/>
            <c:set var="post" value="${requestScope.post}" scope="page"/>
            <c:set var="comments" value="${requestScope.comments}" scope="page"/>

            <table class="boardList" border="1" width="500px">
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
                <button onclick="location.href='${pageContext.request.contextPath}/boardUpdateForm/${post.talk_no}'">게시글
                    수정
                </button>
                <button onclick="location.href='${pageContext.request.contextPath}/boardDelete/${post.talk_no}'">게시글
                    삭제
                </button>
            </c:if>
            <%-- 로그인 되어있으면 => 댓글달기(자기 게시물도 가능)--%>
            <c:if test="${log != null}">
                <form action="/board/comment/addComment/${post.talk_no}">
                    <input type="text" name="comment" id="comment"  placeholder="댓글" required />
                    <input type="submit" value="댓글달기"/>
                </form>
            </c:if>
            <table class="comments" >
            <tr>
                <td>작성자</td>
                <td width="200px">댓글</td>
                <td>@</td>
                <td>+</td>
                <td>-</td>
            </tr>
            <c:forEach var="comment" items="${comments}">
                <tr>
                    <c:choose>
                        <c:when test="${ comment.depth == 0}">
                            <td><c:out value="${comment.user_id}"/></td>
                            <td><c:out value="${comment.comment_content}"/></td>
                            <c:if test="${log != null}">
                            <td><button onclick="location.href='/board/comment/addPlusComment/${post.talk_no}/${comment.sort_no}/${comment.comment_id}'">대댓글</button></td>
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
                        <td><button onclick="location.href='/board/${post.talk_no}/updateComment/${comment.comment_id}'">수정</button></td>
                        <td><button onclick="location.href='/board/comment/deleteComment/${comment.comment_id}'">삭제</button></td>
                    </c:when>
                        <c:otherwise>
                            <td></td><td></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
            </table>
        </section>
    </main>
    <aside></aside>
    <footer id="subfooter1"></footer>
    <footer id="mainfooter"><c:import url="../footer.jsp"></c:import></footer>
    <footer id="subfooter2"></footer>
</div>

</body>
</html>
