<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="../header_.jsp"></c:import>
<main>
    <section>
        <h2>게시글 수정</h2>
        <form method="post" action="${pageContext.request.contextPath}/boardUpdate/${post.talk_no}">
            <input type="hidden">
            <c:set var="post" value="${requestScope.post}" scope="request"/>

            <table class="boardList" border="1" width="500px">
                <tr>
                    <td>제목</td>
                    <td>
                        <input name="title" id="title" type="text" value="${post.talk_title}" required/>
                    </td>
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
                    <td height="500px" colspan="4">
                            <textarea height="500px" name="content" id="content" required>
                                <c:out value="${post.talk_content}"/>
                            </textarea>
                    </td>
                </tr>
                <td>
                    <span>post password: </span><input type="password" name="pw" id="pw">
                </td>
                </tr>
            </table>
            <%--                로그인 객체와 보드 패스워드 비교--%>
            <%--                <input type="button" onclick=""/>--%>
            <input type="submit" value="수정하기">
        </form>
    </section>
</main>
<c:import url="../footer_.jsp"></c:import>

