<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="../header_.jsp"></c:import>
<main>
    <section>
        <h2>게시글</h2>
        <c:set var="log" value="${sessionScope.log}" scope="page"/>
        <c:set var="post" value="${requestScope.post}" scope="page"/>
        <c:set var="comments" value="${requestScope.comments}" scope="page"/>
        <c:set var="updateComment" value="${requestScope.updateComment}" scope="page"/>

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
                <input type="text" name="comment" id="comment" placeholder="댓글" required/>
                <input type="submit" value="댓글달기"/>
            </form>
        </c:if>
        <table class="comments">
            <tr>
                <td>작성자</td>
                <td width="200px">댓글</td>
                <td>@</td>
                <td>+</td>
                <td>-</td>
            </tr>
            <c:forEach var="comment" items="${comments}">
                <tr>
                    <td><c:out value="${comment.user_id}"/></td>
                    <c:choose>
                        <%-- id 같고, post_no == comment_id 일 때 --%>
                        <c:when test="${ log != null && log.user_id.equals(comment.user_id) && updateComment.comment_id == comment.comment_id }">
                            <form action="/board/comment/updateComment/${comment.comment_id}">
                                <td><input type="text" name="reComment" id="reComment"
                                           value="${comment.comment_content}" required/></td>
                                <td></td>
                                <td><input type="submit" value="수정"/></td>
                                <td></td>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <td><c:out value="${comment.comment_content}"/></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </table>
    </section>
</main>

<script>
    document.getElementById("reComment").focus();
</script>

<c:import url="../footer_.jsp"></c:import>

