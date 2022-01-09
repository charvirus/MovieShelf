<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
    <c:set var="movieName" value="${requestScope.movieName}" scope="page" />
    <c:set var="moviePoster" value="${requestScope.moviePoster}" scope="page" />

    <section class="boardWriteSec">
        <article class="arti1">
            <div class="small text-muted">MovieShelf</div>
            <h2>게시글 작성</h2>
            <hr>

            <h4> 먼저 영화를 검색/선택하세요 </h4>
            <form>
                <input type="text" name="search" id="search" placeholder="영화검색...">
                <input type="button" name="go" id="go" value="검색" onclick="getMovie()">
            </form>

            <form id="movieSelect" action="/boardWrite/choice">
            <table class="type22">
                <tr>
                    <th>포스터</th>
                    <th>제목</th>
                    <th>감독</th>
                </tr>
                </thead>
                    <input type="hidden" name="idxHidden" id="idxHidden" value=""/>
                    <input type="hidden" name="searchWord" id="searchWord" value=""/>
                <tbody id="searchResult">

                </tbody>
            </table>
            </form>

            <hr>

            <form id="write" method="post" action="/boardWrite">

                <table class="type22">
                    <input name="moviePoster" type="hidden" value="${moviePoster}"/>
                    <input name="movieName" type="hidden" value="${movieName}"/>
                    <tr>
                        <td rowspan="3">
                            <img src="${moviePoster}"/>
                        </td>
                    </tr>
                    <tr>
                        <th>영화명 :</th>
                        <td>
                            <span id="movieText"><c:out value="${movieName}"/></span>
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td colspan="3">
                            <input name="title" id="title" type="text" placeholder="제목" required />
                        </td>
                    </tr>
                    <tr>
                        <td height="500px" colspan="4">
                             <textarea height="500px" name="content" id="content" required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>post password: </span><input type="password" name="pw" id="pw">
                        </td>
                    </tr>
                </table>
                <input class="btn btn-primary" type="button" value="작성하기" id="submitButton" >
            </form>
        </article>
    </section>
</main>

<script src="/script/board/board.js" type="text/javascript"></script>
<c:import url="../footer_.jsp"></c:import>
