<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<c:import url="../header_.jsp"></c:import>
<div>
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
            <table id="movie" border="solid 1px"
                   style="border-collapse: collapse;" width="50%">

            </table>
        </div>
    </section>
</main>

<script type="text/javascript" src="script/academy/academy.js"></script>
<c:import url="../footer_.jsp"></c:import>

