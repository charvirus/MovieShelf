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
            <c:set var="post" value="${requestScope.post}" scope="page"/>
            <form method="post" action="${pageContext.request.contextPath}/boardWrite">
                <table class="boardList" border="1" width="500px">
                    <tr>
                        <td>제목</td>
                        <td colspan="3">
                            <input name="title" id="title" type="text" placeholder="제목" required/>
                        </td>
                    </tr>
                    <tr>
                        <td height="500px" colspan="4">
                            <textarea height="500px" name="content" id="content" required>
                                내용
                            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>post password: </span><input type="password" name="pw" id="pw">
                        </td>
                    </tr>
                </table>
                <input type="submit" value="작성하기">
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
