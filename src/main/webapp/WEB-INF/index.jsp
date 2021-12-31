<%--
  Created by IntelliJ IDEA.
  User: BrandonJ
  Date: 2021-12-31-031
  Time: 오후 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="grid">
    <header id="subheader1"></header>
    <header id="mainheader">
        <c:import url="header.jsp"></c:import>
    </header>
    <header id="subheader2"></header>
    <nav></nav>
    <main>
        <div id="ad">
            <a href="https://thegameawards.com/">
                <section id="ad_banner">
                    <article id="adbanner">배너</article>
                </section>
            </a>
        </div>
    </main>
    <aside></aside>
    <footer id="subfooter1"></footer>
    <footer id="mainfooter"><c:import url="footer.jsp"></c:import></footer>
    <footer id="subfooter2"></footer>
</div>
</body>
</html>
