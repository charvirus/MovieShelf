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
            <h2>게시글 수정</h2>
            <c:set var="post" value="${requestScope.post}" scope="request"/>
            <form method="post" action="${pageContext.request.contextPath}/boardUpdate/${post.talk_no}">
                <table class="boardList" border="1" width="500px">
                    <tr>
                        <td>제목</td>
                        <td colspan="3">
                            <input name="title" id="title" type="text" value="${post.talk_title}" required/>
                        </td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td><c:out value="${post.user_id}"/></td>
                        <td>작성일</td>
                        <td><c:out value="${post.talk_regdate}"/></td>
                    </tr>
                    <tr>
                        <td height="500px" colspan="4">
                            <textarea height="500px" name="content" id="content" required >
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
    <aside></aside>
    <footer id="subfooter1"></footer>
    <footer id="mainfooter"><c:import url="../footer.jsp"></c:import></footer>
    <footer id="subfooter2"></footer>
</div>

</body>
</html>
