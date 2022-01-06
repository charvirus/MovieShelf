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
            <th>제목</th>
            <th>개봉일</th>
            <th>상영 시간</th>
            <th>IMDB<br/>점수</th>
            <th>감독/주연배우</th>
        </tr>
        </thead>
        `
    );

    movies.forEach(e => {
        const movie_no = e.movie_no;
        const movie_director = e.movie_director;
        const movie_mainactor = e.movie_mainactor;
        const movie_name = e.movie_name;
        const movie_score = e.movie_score;
        const movie_reldate = e.movie_reldate;
        const movie_time = e.movie_time;
        const d = new Date(movie_reldate);
        if (session != "") {
            $("#movie").append(
                `
                  <tbody>
                  <tr>
                    <td><center>${movie_name}</center></td>
                    <td><center>${d.getFullYear()}-${(d.getMonth() + 1)}-${d.getDate()}</center></td>
                    <td><center>${movie_time}</center></td>
                    <td><center>${movie_score}</center></td>
                    <td>감독 : ${movie_director}<br/>주연 : ${movie_mainactor}</td>
                    <td><center>
                            <button onClick="location.href='/addWishFromAca/${movie_no}'">
                                나중에 볼 영화 찜하기
                            </button>
                        </center>
                    </td>
                </tr>
                </tbody>`
            );
        } else {
            $("#movie").append(
                `
                <tbody>
                <tr>
                    <td><center>${movie_name}</center></td>
                    <td><center>${d.getFullYear()}-${(d.getMonth() + 1)}-${d.getDate()}</center></td>
                    <td><center>${movie_time}</center></td>
                    <td><center>${movie_score}</center></td>
                    <td>감독 : ${movie_director}<br/>주연 : ${movie_mainactor}</td>
                </tr>
                </tbody>
            `
            );
        }

    });
}