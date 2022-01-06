<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="../header_.jsp"></c:import>
    <main>
        <section>
            <h2>게시글 작성</h2>
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
<c:import url="../footer_.jsp"></c:import>

