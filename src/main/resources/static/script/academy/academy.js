let date = true;
let score = false;
let time = false;

tablevisible();
function tablevisible() {
    if (date) {
        $("#dateTable").show();
    } else {
        $("#dateTable").hide();
    }
    if (score) {
        $("#scoreTable").show();
    } else {
        $("#scoreTable").hide();
    }
    if (time) {
        $("#timeTable").show();
    } else {
        $("#timeTable").hide();
    }
}

$("#r1").click(function() {
    date = true;
    score = false;
    time = false;
    if ($("#r1").is(':checked')) {
        tablevisible();
    }
});

$("#r2").click(function() {
    date = false;
    score = true;
    time = false;
    if ($("#r2").is(':checked')) {
        tablevisible();
    }
});

$("#r3").click(function() {
    date = false;
    score = false;
    time = true;
    if ($("#r3").is(':checked')) {
        tablevisible();
    }
});