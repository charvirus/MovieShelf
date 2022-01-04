<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>BoardList</title>
</head>
<body>

<main>
    <section>
        <div class="gird">
            <header id="subheader1"></header>
            <header id="mainheader"><c:import url="../header.jsp"></c:import></header>
            <header id="subheader2"></header>
            <main>
                <section>
                    <article>
                        <h2>영화 게시판</h2>
                        <table class="boardList" border="1">
                            <tr>
                                <td>번호</td>
                                <td>제목</td>
                                <td>내용</td>
                                <td>작성자</td>
                                <td>작성일</td>
                            </tr>
                            <c:set var="boardList" value="${requestScope.boardList}" scope="page"/>
                            <c:forEach var="post" items="${boardList}">
                                <tr>
                                    <td><c:out value="${post.talk_no}"/></td>
                                    <td onclick="location.href='board/${post.talk_no}'"><c:out value="${post.talk_title}"/></td>
                                    <td width="300px">
                                        <c:out value="${post.talk_content}"/></td>
                                    <td><c:out value="${post.user_id}"/></td>
                                    <td><c:out value="${post.talk_regdate}"/></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </article>
                </section>
            </main>
            <footer id="subfooter1"></footer>
            <footer id="mainfooter"><c:import url="../footer.jsp">

            </c:import></footer>
            <footer id="subfooter2"></footer>
        </div>
    </section>
</main>

</body>
</html>
