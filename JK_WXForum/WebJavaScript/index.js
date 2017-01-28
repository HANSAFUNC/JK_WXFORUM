
function insertString(contentString,contentWidth) {
    var content = document.getElementById("content");
    content.innerHTML = contentString;
//    content.style.width = contentWidth.toFormatString();
    
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
//function insertTitleNameString(nameString) {
//    document.getElementsByClassName("userName")[0].innerText = nameString;
//}
function insertLeftAndRightImage(size) {
    var leftImages = document.getElementsByClassName('left-img');
    var rightImges = document.getElementsByClassName('right-img');
    for(var i = 0;i<leftImages.length;i++) {
        leftImages[i].style.width = size +'px';
    };
    for(var i = 0;i<rightImges.length;i++) {
        rightImges[i].style.width = size +'px';
    };
}

function insertCommentCellArgments(postListArray){
    for(var i=0; i<postListArray.length; i++) {
        var list = document.getElementById('post-list');
        //cell
        var cell = document.createElement('div');
        cell.className = "cell";
        //用户容器
        var userInfo = document.createElement('div');
        userInfo.className = 'comment-UserInfo';
        // userInfo.innerText = "hhhhhh";
        
        //头像
        var image = document.createElement('img');
        image.className = 'comment-IconImage';
        image.src = 'http://bbs.pyua.net/uc_server/avatar.php?uid=' + postListArray[i]['authorid'];
        //用户名
        var userName = document.createElement('span');
        userName.className = 'comment-username';
        userName.innerHTML = postListArray[i]['author'] + "&nbsp";
        //level
        var level = document.createElement('span');
        level.className = 'comment-level';
        level.innerText = postListArray[i]['grouptitle']+'级';
        //时间轴
        var dateline = document.createElement('span');
        dateline.className = 'comment-dateline';
        dateline.innerText = (i+2) + '楼/' + postListArray[i]['dateline'];
        dateline.style.float = "right";
        
        
        userInfo.appendChild(image);
        userInfo.appendChild(userName);
        userInfo.appendChild(level);
        userInfo.appendChild(dateline);
        
        //msg
        var message = document.createElement('div');
        message.className = 'comment-message';
        message.innerHTML = postListArray[i]['message'];
        
        //底部评论
        var interaction = document.createElement('div');
        interaction.className = 'comment-interaction';
        
        //点评
        var comment = document.createElement('img');
        var commentsub = document.createElement('span');
        var commentCount = document.createElement('span');
//        comment.style.align = 'absmiddle';
        comment.className = 'comment-fieldcomment'
        comment.src = 'fieldcomment.png';
        comment.style.width ='20px';
        comment.style.height ='20px';
        commentsub.innerHTML = "点评&nbsp";
        commentCount.innerText = postListArray[i]['commentcount'];
        
        //加苗
        var addCount = document.createElement('img');
        var addCountSub = document.createElement('span');
        var addCountNum = document.createElement('span');
        addCount.className = 'comment-yellowseed';
        addCount.src = 'yellowseed.png';
        addCount.style.width ='20px';
        addCount.style.height ='20px';
        addCountSub.innerHTML = "加苗&nbsp";
        addCountNum.innerText = "1";
        
        
        //发表回复
        var replies = document.createElement('img');
        replies.className = "comment-replies";
        replies.src = 'fieldmore.png';
        replies.style.width ='20px';
        replies.style.height ='20px';
        
        interaction.appendChild(comment);
        interaction.appendChild(commentsub);
        interaction.appendChild(commentCount);
        interaction.appendChild(addCount);
        interaction.appendChild(addCountSub);
        interaction.appendChild(addCountNum);
        interaction.appendChild(replies);
        
        
        cell.appendChild(userInfo);
        cell.appendChild(message);
        cell.appendChild(interaction);
        
        list.appendChild(cell);
        
    }
    
}


