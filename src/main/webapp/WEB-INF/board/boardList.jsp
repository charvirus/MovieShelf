<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../header_.jsp"></c:import>
<main>
    <section>
        <article>
            <c:set var="log" value="${sessionScope.log}" scope="page"/>
            <c:set var="boardList" value="${requestScope.boardList}" scope="page"/>

            <h2>영화 게시판</h2>
            <table class="boardList" border="1">
                <tr>
                    <td>번호</td>
                    <td width="300px">제목</td>
                    <td>작성자</td>
                    <td>좋아요</td>
                    <td>작성일</td>
                </tr>
                <c:forEach var="post" items="${boardList}">
                    <tr>
                        <td><c:out value="${post.talk_no}"/></td>
                        <td onclick="location.href='board/${post.talk_no}'"><c:out
                                value="${post.talk_title}"/></td>
                        <td><c:out value="${post.user_id}"/></td>
                        <td><c:out value="${post.talk_likes}"/></td>
                        <td><c:out value="${post.talk_regdate}"/></td>
                    </tr>
                </c:forEach>
            </table>
            <c:if test="${log != null}">
                <button onclick="location.href='${pageContext.request.contextPath}/boardWriteForm'">글작성</button>
            </c:if>
        </article>
    </section>
</main>
<c:import url="../footer_.jsp"></c:import>
