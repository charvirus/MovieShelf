$(document).ready(function() {
    getAPI();
});

let date = new Date();

let y = date.getFullYear();
let year = y + "";
let month = "";
let day = "";

let m = date.getMonth() + 1;


if (m < 10) {
    month = "0" + m;
} else {
    month = m + "";
}

let d = date.getDate() - 1;
if (d < 10) {
    day = "0" + d;
} else {
    day = d + "";
}


let resultDate = year + month + day;

let kobisKey = "b7e3c237a8a4570c03e27bf1b7e2d371";
function getAPI() {
    let movies = [];
    $.ajax({
        method : 'GET',
        url : "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key="
            + kobisKey
            + "&targetDt="
            + resultDate
            + "&itemPerPage=10",
        dataType : "json"
    }).done(function(msg) {
        msg.boxOfficeResult.dailyBoxOfficeList.forEach(e=>{
            movies.push(e);
        });
        addData(movies);
    });
}

function addData(movies){
    movies.forEach(e=>{
        const movieRank = e.rank;
        const movieName = e.movieNm;
        const movierelDate = e.openDt;
        const audiCnt = parseInt(e.audiCnt);
        const totalAudiCnt = parseInt(e.audiAcc);

        $("#boxOffice").append(
            `	<tr>
                    <td><center>${movieRank}</center></td>
                    <td> ${movieName} </td>
                    <td><center>${movierelDate}</center></td>
                    <td><center>${audiCnt.toLocaleString('ko-KR')}</center></td>
                    <td><center>${totalAudiCnt.toLocaleString('ko-KR')}</center></td>
				</tr>
				`
        //    .toLocaleString('ko-KR')
        //    숫자의 사용 언어에 따른 표현을 포함한 문자열을 반환한다.
        );
    });
}