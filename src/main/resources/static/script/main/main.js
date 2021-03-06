$(document).ready(
    function () {
        let movies = [];

        $.ajax({
            method: "get",
            url: "/movies/date"
        }).done(function (data) {
                data.forEach(e => {
                    movies.push(e);
                });
                getMovies(movies);
            });

    });

function getMovies(movies) {
    $("#movieMain").empty();
    let idx = 1;
    movies.forEach(e => {
        if(idx <= 11){
            const movie_poster = e.movie_poster;
            $("#movieMain").append(
                `
               <span><img class="mainImg" src="${movie_poster}"/></span>
                 `
            )
        }
        idx++;
    });

}