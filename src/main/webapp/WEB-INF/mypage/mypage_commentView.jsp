<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
        <c:set var="movie" value="${requestScope.movie}" scope="page"/>
        <c:set var="wish" value="${requestScope.wish}" scope="page"/>
        <div class="small text-muted">MovieShelf</div>
        <h2>그때생각</h2>
        <hr>

        <table class="type22">
            <tbody>
            <tr>
                <td rowspan="4">
                    <img src="${movie.movie_poster}">
                </td>
            </tr>
            <tr>
                <th>영화명 :</th>
                <td colspan="3">
                    <span id="movieText"><c:out value="${movie.movie_name}"/></span>
                </td>
            </tr>
            <tr>
                <th>개봉일</th>
                <td><c:out value="${movie.movie_reldate}"/></td>
            </tr>
            <tr>
                <td height="500px" colspan="4"><c:out value="${wish.comment}"/></td>
            </tr>
            </tbody>
        </table>
            <button class="btn btn-primary" onclick="location.href='#'">코멘트
                수정
            </button>
            <button class="btn btn-primary" onclick="location.href='#'">코멘트
                삭제
            </button>
        <hr>
    </section>
</main>
<c:import url="../footer_.jsp"></c:import>
