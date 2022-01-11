<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <article>
            <c:set var="log" value="${sessionScope.log}" scope="page"/>
            <c:set var="boardList" value="${requestScope.boardList}" scope="page"/>

            <div class="small text-muted">MovieShelf</div>
            <h2>영화 게시판</h2>
            <hr>
            <div class="contentContainer">
                <table class="type22">

                    <tbody>
                    <c:forEach var="post" items="${boardList}">
                        <tr>
                            <td  rowspan="4"><img src="${post.movie_poster}"/></td>
                        </tr>
                        <tr>
                            <td onclick="location.href='/board/${post.talk_no}'"><c:out
                                    value="${post.talk_title}"/></td>
                        </tr>
                        <tr>
                            <td>작성자 : <c:out value="${post.user_id}"/> | 👍 <c:out value="${post.talk_likes}"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><c:out value="${post.talk_regdate}"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><c:out value="${post.movie_name}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <br>
            <c:if test="${log != null}">
                <button class="btn btn-primary"
                        onclick="location.href='${pageContext.request.contextPath}/boardWriteForm'">글작성
                </button>
            </c:if>
            <br>
        </article>
    </section>
</main>
<c:import url="../footer_.jsp"></c:import>
