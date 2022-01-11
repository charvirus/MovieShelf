<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<div class="small text-muted">MovieShelf</div>
<h2>아카데미 작품상 수상작</h2>
<hr>
<div id="academyRadio">
    <ul>
        <li><input type="radio" id="r1" name="academy" checked>연도별</li>
        <li><input type="radio" id="r2" name="academy">점수별</li>
        <li><input type="radio" id="r3" name="academy">상영시간별</li>
    </ul>
</div>
<main>
    <c:set var="ses" value="${sessionScope.log}"/>
    <input type="hidden" value="${ses.getUser_id()}" id="session">
    <section>
        <div class="contentContainer">
            <table class="type22" id="movie">

            </table>
        </div>
    </section>
</main>

<script type="text/javascript" src="script/academy/academy.js"></script>
<c:import url="../footer_.jsp"></c:import>

