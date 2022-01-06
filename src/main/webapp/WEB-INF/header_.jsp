<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" sizes="16x16" href="/img/favicon.ico" />

    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/css/styles.css" rel="stylesheet" />
    <link href="/css/tablestyle.css" rel="stylesheet" />


    <title>MovieShelf</title>
</head>
<body>
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/">MovieShelf</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="/academy">아카데미 작품상</a></li>
                <li class="nav-item"><a class="nav-link" href="/boxOffice">극장 상영작 영화</a></li>
                <li class="nav-item"><a class="nav-link" href="/boardList">영화 게시판</a></li>
                <li class="nav-item"><a class="nav-link" href="/search">영화 검색</a></li>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">마이페이지</a></li>
                <c:set var="ses" value="${sessionScope.log}"/>
                <c:choose>
                    <c:when test="${ses != null}">
                        <li class="nav-link">${ses.getUser_nickname()}님</li>
                        <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="/signUp">회원가입</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
<!-- Page header with logo and tagline-->
<header class="py-5 bg-light border-bottom mb-4">
    <div class="container">
        <div class="text-center my-5">
            <h1 class="fw-bolder">나만의 영화 선반</h1>
            <p class="lead mb-0">Movie Shelf</p>
        </div>
    </div>
</header>

