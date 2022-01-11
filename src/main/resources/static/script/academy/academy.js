const session = document.getElementById("session").value;

$(document).ready(
    function () {
        let movies = [];

        if ($("#r1").is(':checked')) {

            $.ajax({
                method: "get",
                url: "/movies/date"
            })
                .done(function (data) {
                    data.forEach(e => {
                        movies.push(e);
                    });
                    getMovies(movies);
                });
        }
    });

$("input#r1").click(function () {
    let movies = [];

    if ($("#r1").is(':checked')) {

        $.ajax({
            method: "get",
            url: "/movies/date"
        })
            .done(function (data) {
                data.forEach(e => {
                    movies.push(e);
                });
                getMovies(movies);
            });
    }
});

$("input#r2").click(function () {
    let movies = [];

    if ($("#r2").is(':checked')) {

        $.ajax({
            method: "get",
            url: "/movies/score"
        })
            .done(function (data) {
                data.forEach(e => {
                    movies.push(e);
                });
                getMovies(movies);
            });
    }
});

$("input#r3").click(function () {

    let movies = [];
    if ($("#r3").is(':checked')) {
        $.ajax({
            method: "get",
            url: "/movies/time"
        })
            .done(function (data) {
                data.forEach(e => {
                    movies.push(e);
                });
                getMovies(movies);
            });
    }
});


function getMovies(movies) {
    $("#movie").empty();
    $("#movie").append(
        `
        <thead>
        <tr>
            <th>포스터</th>
            <th>제목</th>
            <th>개봉일</th>
            <th>상영 시간</th>
            <th>IMDB(점수)</th>
            <th>감독/주연배우</th>
        </tr>
        </thead>
        `
    );
    let image = "";
    let link = "";
    movies.forEach(e => {
        const movie_poster = e.movie_poster;
        const movie_no = e.movie_no;
        const movie_director = e.movie_director;
        const movie_mainactor = e.movie_mainactor;
        const movie_name = e.movie_name;
        const movie_link = e.movie_link;
        const movie_score = e.movie_score;
        const movie_reldate = e.movie_reldate;
        const movie_time = e.movie_time;
        const d = new Date(movie_reldate);

        if (session != "") {
            $("#movie").append(
                `
                  <tbody>
                    <tr>
                        <td><img src="${movie_poster}"/></td>
                        <td><a href="${movie_link}">${movie_name}</a></td>
                        <td>${d.getFullYear()}-${(d.getMonth() + 1)}-${d.getDate()}</center></td>
                        <td>${movie_time}</td>
                        <td>${movie_score}</td>
                        <td>감독 : ${movie_director}<br/>주연 : ${movie_mainactor}</td>
                        <td>
                            <button class="btn btn-primary" onClick="location.href='/addWishFromAca/${movie_no}'">
                                나중에 볼 영화 찜하기
                            </button>
                        </td>
                    </tr>
                </tbody>`
            );
        } else {
            $("#movie").append(
                `
                <tbody>
                <tr>
                    <td><img src="${movie_poster}"/></td>
                    <td><a href="${movie_link}">${movie_name}</a></td>
                    <td>${d.getFullYear()}-${(d.getMonth() + 1)}-${d.getDate()}</td>
                    <td>${movie_time}</td>
                    <td>${movie_score}</td>
                    <td>감독 : ${movie_director}<br/>주연 : ${movie_mainactor}</td>
                </tr>
                </tbody>
            `
            );
        }
    });

}

function getImage(title, date) {
    $.ajax({
        method: "get",
        url: "/searchResultJson/" + title,
        dataType: "json"
    }).done(function (data) {
        data.items.forEach(e => {

            let tempTitle = e.title;

            tempTitle = tempTitle.replace("<b>", "");
            tempTitle = tempTitle.replace("</b>", "");

            if (tempTitle === title && Number(e.pubDate) === date) {
                console.log("일치");
                console.log(tempTitle);
                console.log(e.image);
            }

        });
    })
}
