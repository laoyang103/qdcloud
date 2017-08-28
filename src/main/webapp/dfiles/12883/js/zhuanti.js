var xPos = 10;
var yPos = 10;
var step = 1.5;
var delay = 30;
var height = 0;
var Hoffset = 0;
var Woffset = 0;
var yon = 0;
var xon = 0;
var pause = true;
var interval;
var zhuanti = document.getElementById("zhuanti");
zhuanti.style.top = yPos;
function changePos() {
    width = document.documentElement.clientWidth;
    height = document.documentElement.clientHeight;
    Hoffset =zhuanti.offsetHeight;
    Woffset = zhuanti.offsetWidth;
    zhuanti.style.left = xPos + document.documentElement.scrollLeft-100 + "px";
    zhuanti.style.top = yPos + document.documentElement.scrollTop + "px";
    if (yon) {
        yPos = yPos + step;
    }
    else {
        yPos = yPos - step;
    }
    if (yPos < 0) {
        yon = 1;
        yPos = 0;
    }
    if (yPos >= (height - Hoffset)) {
        yon = 0;
        yPos = (height - Hoffset);
    }
    if (xon) {
        xPos = xPos + step;
    }
    else {
        xPos = xPos - step;
    }
    if (xPos < 0) {
        xon = 1;
        xPos = 0;
    }
    if (xPos >= (width - Woffset)) {
        xon = 0;
        xPos = (width - Woffset);
    }
}

function start() {
    zhuanti.visibility = "visible";
    interval = setInterval('changePos()', delay);
}

function pause_resume() {
    if (pause) {
        clearInterval(interval);
        pause = false;
    }
    else {
        interval = setInterval('changePos()', delay);
        pause = true;
    }
}
start();

function hide() {
    clearInterval(interval);
    zhuanti.style.display = "none";
}