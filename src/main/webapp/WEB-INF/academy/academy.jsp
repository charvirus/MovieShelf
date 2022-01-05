<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <%--
      Created by IntelliJ IDEA.
      User: jhe
      Date: 2022-01-04
      Time: 오전 10:22
      To change this template use File | Settings | File Templates.
    --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <title>Movie Shelf - Academy</title>
</head>
<body>
<div id="grid">
    <header id="subheader1"></header>
    <header id="mainheader"><c:import url="../header.jsp"></c:import></header>
    <header id="subheader2"></header>
    <nav></nav>
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
    <aside></aside>
    <footer id="subfooter1"></footer>
    <footer id="mainfooter"><c:import url="../footer.jsp"></c:import></footer>
    <footer id="subfooter2"></footer>
</div>

<script type="text/javascript" src="script/academy/academy.js"></script>
</body>

</html>
