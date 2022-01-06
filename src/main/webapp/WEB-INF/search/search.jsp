<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<c:import url="../header_.jsp"></c:import>

<main>
    <c:set var="ses" value="${sessionScope.log}"/>
    <input type="hidden" value="${ses.getUser_id()}" id="session">
    <section>
        <form onsubmit="getResult(); return  false">
            <h1>영화 검색</h1>
            <input type="text" name="movieSearch" id="movieSearch">
            <button  id="search" type="submit">검색</button>
        </form>
    </section>
</main>

<script type="text/javascript" src="script/search/search.js"></script>
<c:import url="../footer_.jsp"></c:import>

