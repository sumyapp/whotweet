/**
 * 
 */
function love() {
	var objTextarea = document.getElementsByName('status')[0];
	var oldStr=objTextarea.value;
    var newStr=oldStr.replace(/\shttp/,"好きです！ http");
	objTextarea.value = newStr;
}

function recommend() {
	var objTextarea = document.getElementsByName('status')[0];
	var oldStr=objTextarea.value;
    var newStr=oldStr.replace(/\shttp/,"皆さんもぜひフォローしてみて下さい！ http");
	objTextarea.value = newStr;
}

function always() {
	var objTextarea = document.getElementsByName('status')[0];
	var oldStr=objTextarea.value;
    var newStr=oldStr.replace(/\shttp/,"いつも見させて頂いています！ http");
	objTextarea.value = newStr;
}

function addBookmark(title,url) {
    if (window.sidebar) {
        window.sidebar.addPanel(title, url,"");
    } else if( document.all ) {
        window.external.AddFavorite( url, title);
    } else if( window.opera && window.print ) {
        return true;
    }
}