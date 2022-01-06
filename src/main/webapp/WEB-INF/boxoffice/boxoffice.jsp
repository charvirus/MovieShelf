<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<c:import url="../header_.jsp"></c:import>
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
<script type="text/javascript" src="script/boxOffice/boxOffice.js"></script>
<c:import url="../footer_.jsp"></c:import>


