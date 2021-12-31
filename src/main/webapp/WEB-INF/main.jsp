<%--
  Created by IntelliJ IDEA.
  User: BrandonJ
  Date: 2021-12-31-031
  Time: 오후 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <title>Title</title>
</head>
<body>
<div id="grid">
    <header id="subheader1"></header>
    <header id="mainheader">
        <c:import url="top.jsp"></c:import>
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
