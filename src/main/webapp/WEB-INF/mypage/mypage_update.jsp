<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="../header_.jsp"></c:import>
<main>

    <h2>정보 수정페이지</h2>

    <c:set var="pwC" value="${sessionScope.log}"/>
    <ul>
        <li>아이디 : <c:out value="${pwC.user_id}"/></li>
        <li>비밀번호 : <input type="password" name="pw"></li>
        <li>이름 : <input type="text" name="name" value="${pwC.user_name}"></li>
        <li>닉네임 : <input type="text" name="nick_name" value="${pwC.user_nickname}"></li>
    </ul>
    <input type="submit" value="수정">

</main>
<c:import url="../footer_.jsp"></c:import>
