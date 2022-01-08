<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="../header_.jsp"></c:import>
<main>
    <section>
        <h2>본인 확인</h2>
        <form action="/main/Identification">
                <input type="password" name="pwC" id="pwC" required/>
                <input type="submit" value="비밀번호체크">
        </form>
    </section>
</main>
<c:import url="../footer_.jsp"></c:import>
