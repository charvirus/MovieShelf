<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jhe
  Date: 2022-01-04
  Time: 오후 2:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Movie Shelf - BoxOffice</title>
</head>
<body>
<div id="grid">
    <header id="subheader1"></header>
    <header id="mainheader"><c:import url="../header.jsp"></c:import></header>
    <header id="subheader2"></header>
    <nav></nav>
    <main>
        <section>
            <table id="boxOffice" border="1" width="50%">
                <tr id="boxOfficeHeader">
                    <td width="3%"><center>순위</center></td>
                    <td width="25%"><center>영화명</center></td>
                    <td width="5%"><center>개봉일</center></td>
                    <td width="7%"><center>일일 관객수</center></td>
                    <td width="7%"><center>누적 관객수</center></td>
                </tr>
            </table>
        </section>
    </main>
    <aside></aside>
    <footer id="subfooter1"></footer>
    <footer id="mainfooter"><c:import url="../footer.jsp"></c:import></footer>
    <footer id="subfooter2"></footer>
</div>
<script type="text/javascript" src="script/boxOffice/boxOffice.js"></script>
</body>
</html>
