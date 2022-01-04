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

            <c:if test="${log != null && !log.user_id.equals(post.user_id)}">
                <button onclick="location.href='${pageContext.request.contextPath}/board/${post.talk_no}/increaseLike'">
                    좋아요+1
                </button>
            </c:if>
            <c:if test="${log != null && log.user_id.equals(post.user_id)}">
                <button onclick="location.href='${pageContext.request.contextPath}/boardUpdateForm/${post.talk_no}'">게시글
                    수정
                </button>
                <button onclick="location.href='${pageContext.request.contextPath}/boardDelete/${post.talk_no}'">게시글
                    삭제
                </button>
            </c:if>

        </section>
    </main>
    <aside></aside>
    <footer id="subfooter1"></footer>
    <footer id="mainfooter"><c:import url="../footer.jsp"></c:import></footer>
    <footer id="subfooter2"></footer>
</div>

</body>
</html>
