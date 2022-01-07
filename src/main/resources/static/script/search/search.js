let isEnd = false;

function getResult(){
    const title = $('#movieSearch').val();

    isEnd = false;
    let page = 1;


    let key = "b7e3c237a8a4570c03e27bf1b7e2d371";
    if(title == ""){
        alert("제목을 입력해주세요.");
    }else{
        $.ajax({
            method: 'GET',
            url: 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=' +
                key
            + '&movieNm='
            + title,
           dataType : "json"
        }).done(function (msg){
            console.log(msg);
        });
    }
}