<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="../header_.jsp"></c:import>
<!-- Page header with logo and tagline-->
<main>
    <section>
        <c:set var="log" value="${sessionScope.log}" scope="page"/>
        <c:set var="wish" value="${requestScope.wish}" scope="page"/>
        <div class="small text-muted">MovieShelf</div>
        <c:if test="${log.user_id.equals(comments.user_id)}">
            <h2>나의 찜 목록</h2>
            <hr>

            <td>
                <button onclick="location.href='//${}//${}'">
                    수정
                </button>
            </td>
            <td>
                <button onclick="location.href='////${}'">
                    삭제
                </button>
            </td>
        </c:if>
        <br>
    </section>
</main>
<c:import url="../footer_.jsp"></c:import>
