<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="../header_.jsp"></c:import>
<main>
    <section>
        <h2>본인 확인</h2>
        <form method="post" action="${pageContext.request.contextPath}/Identification/${post.}">
            <c:set var="pwC" value="${requestScope.post}" scope="request"/>
            <article id="pwC">
                <span>PW&#9;<input type="password" name="pwC" required></span>
                <input id="submit" type="submit" value="조회하기">
            </article>
        </form>
    </section>
</main>
<c:import url="../footer_.jsp"></c:import>
