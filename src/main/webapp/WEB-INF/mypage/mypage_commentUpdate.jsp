<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<c:import url="../header_.jsp"></c:import>

<!-- Page header with logo and tagline-->
<header class="py-5 bg-light border-bottom mb-4">
    <div class="container">
        <div class="text-center my-5">
            <h1 class="fw-bolder">나만의 영화 선반</h1>
            <p class="lead mb-0">Movie Shelf</p>
        </div>
    </div>
</header>
<main>
<section>
    <c:set var="wa" value="${requestScope.wa}" scope="page"/>
    <c:set var="mra" value="${requestScope.mra}" scope="page"/>
    <c:set var="wn" value="${requestScope.wn}" scope="page"/>
    <section class="WishComentSec">
        <article class="arti1">
            <div class="small text-muted">MovieShelf</div>
            <h2>그때생각</h2>
            <hr>
            <table class="type22">
                <tr>
                    <th>포스터</th>
                    <th>제목</th>
                    <th>감독</th>
                </tr>
                </thead>
                <<c:forEach var="movie" items="${mra}">
                <td><img src="${movie.movie_poster}"></td>
                <td><c:out value="${movie.movie_name}"/></td>
                <td><c:out value="${movie.movie_director}"/> </td>
            </c:forEach>
                <tr>
                    <td height="500px" colspan="4"><c:out value="${wa.con}"/></td>
                </tr>
                </tbody>
            </table>
            <c:if test="${log!=null}">
                <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/boardUpdateForm/${}'">코멘트
                    수정
                </button>
                <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/boardDelete/${wn}'">코멘트
                    삭제
                </button>
            </c:if>

        <hr>
        </article>
    </section>
</section>
</main>
<c:import url="../footer_.jsp"></c:import>
