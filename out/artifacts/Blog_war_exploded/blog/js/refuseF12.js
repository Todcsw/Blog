document.oncontextmenu = function () {
    return false;
};
document.onkeydown = function () {
    if (window.event && window.event.keyCode == 123) {
        alert("你想对我做什么喵！ !!! 耍流氓喵");

        event.keyCode = 0;
        event.returnValue = false;
        return false;
    }
};