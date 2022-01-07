const session = document.getElementById("session").value;

function getSearchResult() {
    let movies = [];
    const title = $('#movieSearch').val();

    if (title == "") {
        alert("제목을 입력해주세요.");
    } else {
        $.ajax({
            method: "get",
            url: "/searchResultJson/" + title
            + "&display=25",
            dataType: "json"
        }).done(function (data) {

            data.items.forEach(e => {
                movies.push(e);
            });
            printResult(movies);
        }).fail(function () {
            alert("오류");
        });
    }
}

function printResult(movies) {
    console.log(movies.length);
    $("#searchResult").empty();
    movies.forEach(e => {

        const movieTitle = e.title;
        let movieTitleReplaced = movieTitle;
        // 정규식
        movieTitleReplaced = movieTitleReplaced.replace("<b>", "");
        movieTitleReplaced = movieTitleReplaced.replace("</b>","");
        const moviePubDate = e.pubDate;
        const movieDirector = e.director;
        const movieUserRating = e.userRating;
        const moviePoster = e.image;
        const movieLink = e.link;
        if (session != "") {
            $("#searchResult").append(`<tbody>
                <tr>
                    <td><img class="image" src="${moviePoster}"/></td>
                    <td><a href="${movieLink}">${movieTitle}</a></td>
                    <td>${moviePubDate}</td>
                    <td>${movieDirector}</td>
                    <td>${movieUserRating}</td>
                     <td><center>
                            <button onClick="location.href='/addWishFromSearch/${movieTitleReplaced}'">
                                나중에 볼 영화 찜하기
                            </button>
                        </center>
                    </td>
                </tr>
            </tbody>
        `)
        } else {
            $("#searchResult").append(
                `<tbody>
                <tr>
                    <td><img class="image" src="${moviePoster}"/></td>
                    <td><a href="${movieLink}">${movieTitle}</a></td>
                    <td>${moviePubDate}</td>
                    <td>${movieDirector}</td>
                    <td>${movieUserRating}</td>
                </tr>
            </tbody>
        `
            );
        }
    });
}