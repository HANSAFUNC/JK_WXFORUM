
function insertString(contentString) {
    document.getElementById("content").innerHTML = contentString;
    
}
function insertSubjectString(subjectString) {
    
    document.getElementById("header-Title").getElementsByTagName('h3')[0].innerText = subjectString;
}
function insertReplyAndViews(handleString) {
    document.getElementsByClassName("sub-replyTitle")[0].innerText = handleString
}
function insertIconImageString(imageString){
    
    var image = document.getElementById("header-userInfo").getElementsByClassName('icon-Image')[0];

    image.src=imageString;
    
}
function insertTimeAndLevelString(dateString) {
    document.getElementsByClassName("dateLine")[0].innerText = dateString;
}
function insertTitleNameString(nameString) {
    document.getElementsByClassName("userName")[0].innerText = nameString;
}
function insertLeftAndRightImage(leftImage,rightImage) {
    var leftImages = document.getElementsByClassName("left-img")
    var rightImges = document.getElementsByClassName("right-img")
    for(var i = 0;i<leftImage.lenght;i++) {
        leftImage[i].src = leftImage;
    }
    for(var i = 0;i<rightImges.lenght;i++) {
        rightImges[i].src = rightImges;
    }
}


