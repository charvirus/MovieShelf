function signUpUser(form) {
    let id = form.id.value;
    let pw = form.pw.value;
    let name = form.name.value;
    let nickname = form.nickname.value;

    if (id == "" && pw == "" && name == "" && nickname == "") {
        alert("전부 입력해주세요.");
    } else {
        const data = {
            "user_id": id,
            "user_pw": pw,
            "user_nickname": nickname,
            "user_name": name
        };
        $.ajax({
            method: "post",
            url: "/user/addUser",
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(data)
        }).done(response => {
            alert("회원가입 되셨습니다");
            location.href = "/";
        })
            .fail(function () {
                alert("ID가 중복됩니다.");
                form.id.focus();
            });
    }


}