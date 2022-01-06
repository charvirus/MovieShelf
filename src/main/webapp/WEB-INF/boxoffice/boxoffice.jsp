<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<c:import url="../header_.jsp"></c:import>
    <main>
        <section>
            <table class="type22" id="boxOffice" >
                <thead>
                <tr id="boxOfficeHeader">
                    <th>순위</th>
                    <th>영화명</th>
                    <th>개봉일</th>
                    <th>일일 관객수</th>
                    <th>누적 관객</th>
                </tr>
                </thead>
            </table>
        </section>
    </main>
<script type="text/javascript" src="script/boxOffice/boxOffice.js"></script>
<c:import url="../footer_.jsp"></c:import>


