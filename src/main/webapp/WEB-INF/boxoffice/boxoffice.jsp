<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="small text-muted">MovieShelf</div>
            <h2>박스오피스 TOP 10</h2>
            <hr>
            <div class="contentContainer">
            <table class="type22" id="boxOffice" >

            </table>
            </div>
        </section>
    </main>
<script type="text/javascript" src="script/boxOffice/boxOffice.js"></script>
<c:import url="../footer_.jsp"></c:import>


