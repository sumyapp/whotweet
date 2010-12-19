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
	<h1><span class="title"><a href="/">誰が一番つぶやいてるったー</a></span></h1>
</div>
<div id="body">
<div id="siteinfo">
<h2><font color="red"><c:out value="${errmsg}" /></font></h2>
<div id="siteinfo_top">
<h2><a href="signin">早速使ってみる</a></h2>
<p>このサービスは、あなたのTwitterのタイムライン上で誰が最もTweetしているかを表示するサービスです<BR>
こんな感じで表示されます。</p>
</div>
<div id="siteinfo_center">
<img src="img/sc.jpg" />
<p>※こいつTweetしすぎだろ！アンフォローだ！みたいな使い方はあまり推奨は致しません。<BR>
あくまで、"ああ、たしかにこの人のアイコンよく見かけるなぁ"ぐらいでお使いください</p>
<h2><a href="signin">早速使ってみる</a></h2>
</div>
<div id="widget">
<script src="http://widgets.twimg.com/j/2/widget.js"></script>
<script>
new TWTR.Widget({
  version: 2,
  type: 'search',
  search: '#who_tweet_frequently',
  interval: 6000,
  title: 'Please use this!',
  subject: '誰が一番つぶやいてるったー',
  width: 200,
  height: 400,
  theme: {
    shell: {
      background: '#616161',
      color: '#ffffff'
    },
    tweets: {
      background: '#808080',
      color: '#ffffff',
      links: '#4aed05'
    }
  },
  features: {
    scrollbar: false,
    loop: true,
    live: false,
    hashtags: false,
    timestamp: false,
    avatars: true,
    toptweets: true,
    behavior: 'default'
  }
}).render().start();
</script>
</div>
<div id="siteinfo_bottom">
<p>動作画像はこのサイトを作った私のアカウントで撮ったものです。<br />
写ってる方、ぼかしをいれて掲載させて頂きました。問題あればご連絡下さい。</p>
</div>
</div>
</div>
<div id="footer">
	<a href="http://blog.sumyapp.com/">Copyright 2010 sumyapp, All rights reserved.</a>
	<span class="tweet_share_button"><a href="http://www.twitter.com/sumyapp"><img src="http://twitter-badges.s3.amazonaws.com/t_small-a.png" alt="sumyappをフォローしましょう"/></a></span>
</div>
</body>
</html>
