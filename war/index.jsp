<%@page pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="css/global.css" type="text/css" />
<title>誰が一番つぶやいてるったー</title>
<meta name="description" content="あなたのTwitterのタイムライン上で誰が最もTweetしているかを表示するサービスです。こいつTweetしすぎだろ！アンフォローだ！みたいな使い方はあまり推奨は致しません。あくまで、「ああ、たしかにこの人のアイコンよく見かけるなぁ」ぐらいでお使いください">
<meta name="keywords" content="Twitter,フォロー,follow,unfollow,アンフォロー,フォロワー,ツイッター,タイムライン,TL,無料,tweet,ツイート">
</head>
<body>
<div id="header">
	<h1>誰が一番つぶやいてるったー</h1>
</div>
<div id="body">
<h2><font color="red"><c:out value="${errmsg}" /></font></h2>
<h2><a href="signin">早速使ってみる</a></h2>
<p>このサービスは、あなたのTwitterのタイムライン上で誰が最もTweetしているかを表示するサービスです<BR>
こんな感じで表示されます。</p>
<img src="img/sc.jpg" />
<p>※こいつTweetしすぎだろ！アンフォローだ！みたいな使い方はあまり推奨は致しません。<BR>
あくまで、"ああ、たしかにこの人のアイコンよく見かけるなぁ"ぐらいでお使いください</p>
<h2><a href="signin">早速使ってみる</a></h2>

<p>動作画像はこのサイトを作った私のアカウントで撮ったものです。<br />
写ってる方、ぼかしをいれて掲載させて頂きました。問題あればご連絡下さい。</p>
</div>
<div id="footer"><a href="http://blog.sumyapp.com/">Copyright 2010 sumyapp, All rights reserved.</a></div>
</body>
</html>
