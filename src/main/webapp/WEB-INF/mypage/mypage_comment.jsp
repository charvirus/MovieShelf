<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:import url="../header_.jsp"></c:import>
<!-- Page header with logo and tagline-->
<main>
    <c:set var="wa" value="${requestScope.wa}" scope="page"/>
    <c:set var="mra" value="${requestScope.mra}" scope="page"/>
    <section>
        <section class="WishComentSec">
            <article class="arti1">
                <div class="small text-muted">MovieShelf</div>
                <h2>그때생각 작성</h2>
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

                        </tbody>
                    </table>
                <hr>
                <form>
                    <table class="type22">
                        <tr>
                            <td height="500px" colspan="4">
                                <textarea height="500px" name="comment" id="comment" required></textarea>
                            </td>
                        </tr>

                    </table>
                    <button  class="btn btn-primary" onclick="location.href='/mypage/commentWrite'">코멘트 쓰기</button>
                </form>
            </article>
        </section>
</main>
<c:import url="../footer_.jsp"></c:import>
