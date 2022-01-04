<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <section>
            <c:set var="movieDate" value="${sessionScope.movieDate}"/>
            <c:set var="movieScore" value="${sessionScope.movieScore}"/>
            <c:set var="movieTime" value="${sessionScope.movieTime}"/>
            <table id="dateTable" border="solid 1px"
                   style="border-collapse: collapse;" width="50%">
                <tr>
                    <td><center>제목</center></td>
                    <td><center>개봉일</center></td>
                    <td><center>상영 시간</center></td>
                    <td><center>IMDB<br>점수</center></td>
                    <td><center>감독/주연배우</center></td>
                </tr>
                <c:forEach var="i" begin="0" end="${movieDate.size()-1}" step="1">
                <tr>
                    <td>${movieDate.get(i).getMovie_name()}</td>
                    <td><center>${movieDate.get(i).getMovie_reldate()}</center></td>
                    <td><center>${movieDate.get(i).getMovie_time()}</center></td>
                    <td><center>${movieDate.get(i).getMovie_score()}</center></td>
                    <td>${movieDate.get(i).getMovie_director()}<br> ${movieDate.get(i).getMovie_mainactor()}</td>
                </tr>
                </c:forEach>
            </table>

            <table id="scoreTable" border="solid 1px"
                   style="border-collapse: collapse;" width="50%">
                <tr>
                    <td><center>제목</center></td>
                    <td><center>개봉일</center></td>
                    <td><center>상영 시간</center></td>
                    <td><center>IMDB<br>점수</center></td>
                    <td><center>감독/주연배우</center></td>
                </tr>
                <c:forEach var="i" begin="0" end="${movieScore.size()-1}" step="1">
                    <tr>
                        <td>${movieScore.get(i).getMovie_name()}</td>
                        <td><center>${movieScore.get(i).getMovie_reldate()}</center></td>
                        <td><center>${movieScore.get(i).getMovie_time()}</center></td>
                        <td><center>${movieScore.get(i).getMovie_score()}</center></td>
                        <td>${movieScore.get(i).getMovie_director()}<br> ${movieScore.get(i).getMovie_mainactor()}</td>
                    </tr>
                </c:forEach>
            </table>

            <table id="timeTable" border="solid 1px"
                   style="border-collapse: collapse;" width="50%">
                <tr>
                    <td><center>제목</center></td>
                    <td><center>개봉일</center></td>
                    <td><center>상영 시간</center></td>
                    <td><center>IMDB<br>점수</center></td>
                    <td><center>감독/주연배우</center></td>
                </tr>
                <c:forEach var="i" begin="0" end="${movieTime.size()-1}" step="1">
                    <tr>
                        <td>${movieTime.get(i).getMovie_name()}</td>
                        <td><center>${movieTime.get(i).getMovie_reldate()}</center></td>
                        <td><center>${movieTime.get(i).getMovie_time()}</center></td>
                        <td><center>${movieTime.get(i).getMovie_score()}</center></td>
                        <td>${movieTime.get(i).getMovie_director()}<br> ${movieTime.get(i).getMovie_mainactor()}</td>
                    </tr>
                </c:forEach>
            </table>
        </section>
    </main>
    <aside></aside>
    <footer id="subfooter1"></footer>
    <footer id="mainfooter"><c:import url="../footer.jsp"></c:import></footer>
    <footer id="subfooter2"></footer>
</div>
</body>
</html>
