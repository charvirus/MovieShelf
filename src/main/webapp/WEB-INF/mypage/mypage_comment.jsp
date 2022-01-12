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
    <c:set var="wa" value="${requestScope.wa}" scope="page"/>
    <c:set var="movie" value="${requestScope.movie}" scope="page"/>
    <c:set var="wn" value="${requestScope.wn}" scope="page"/>
    <c:set var="wish" value="${requestScope.wish}" scope="page"/>
    <section>
        <section class="WishComentSec">
            <article class="arti1">
                <div class="small text-muted">MovieShelf</div>
                <h2>그때생각 작성</h2>
                <hr>
                    <table class="type22">
                        <tr>
                            <th>포스터</th>
                            <th>영화명</th>
                            <th>감독</th>
                        </tr>
                        </thead>
                            <td><img src="${movie.movie_poster}"></td>
                            <td><c:out value="${movie.movie_name}"/></td>
                            <td><c:out value="${movie.movie_director}"/> </td>
                        </tbody>
                    </table>
                <hr>
                <form action="/commentUpdate/${wn}">
                    <table class="type22">
                        <tr>
                            <td height="500px" colspan="4">
                                <c:choose>
                                    <c:when test="${wish.comment == null}">
                                        <input type="text" name="comment" id="comment" style="width:450px;height:500px;font-size:30px;" required/>
                                    </c:when>
                                    <c:when test="${wish.comment != null}">
                                        <input type="text" name="comment" id="comment" style="width:450px;height:500px;font-size:30px;" value="${wish.comment}" required/>
                                    </c:when>
                                </c:choose>

                            </td>
                        </tr>

                    </table>
                    <c:choose>
                        <c:when test="${wish.comment == null}">
                            <input type="submit" value="코멘트 작성하기">
                        </c:when>
                        <c:when test="${wish.comment != null}">
                            <input type="submit" value="코멘트 수정하기">
                            <input type="button" onclick="location.href='/main/mypage/3'" value="닫기">
                        </c:when>
                    </c:choose>
                </form>
            </article>
        </section>
</main>
<c:import url="../footer_.jsp"></c:import>
