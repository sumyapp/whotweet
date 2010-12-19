<%@page pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="css/global.css" type="text/css" />
<script type="text/javascript" src="js/result_tweetarea.js"></script>
<title>誰が1番つぶやいてるったー</title>
<meta name="description" content="あなたのTwitterのタイムライン上で誰が最もTweetしているかを表示するサービスです。こいつTweetしすぎだろ！アンフォローだ！みたいな使い方はあまり推奨は致しません。あくまで、「ああ、たしかにこの人のアイコンよく見かけるなぁ」ぐらいでお使いください">
<meta name="keywords" content="Twitter,フォロー,follow,unfollow,アンフォロー,フォロワー,ツイッター,タイムライン,TL,無料,tweet,ツイート">
</head>
<body>
<div id="content">
  <div id="header">
    <div id="logo"><a href="/"><img src="img/logo.jpg" alt="誰が1番つぶやいてるったー" /></a></div>
    <div class="social">
    <!-- Twitter -->
    <a href="http://twitter.com/share" class="twitter-share-button" data-count="vertical" data-via="sumyapp" data-lang="ja">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
    <!-- facebook -->
    <iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwho-tweet.appspot.com%2F&amp;layout=box_count&amp;show_faces=true&amp;width=80&amp;action=like&amp;colorscheme=light&amp;height=65" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:75px; height:60px;" allowTransparency="true"></iframe>
    <!-- はてぶ -->
    <a href="http://b.hatena.ne.jp/entry/http://who-tweet.appspot.com/" class="hatena-bookmark-button" data-hatena-bookmark-title="誰が1番つぶやいてるったー" data-hatena-bookmark-layout="vertical" title="このエントリーをはてなブックマークに追加"><img src="http://b.st-hatena.com/images/entry-button/button-only.gif" alt="このエントリーをはてなブックマークに追加" width="20" height="20" style="border: none;" /></a><script type="text/javascript" src="http://b.st-hatena.com/js/bookmark_button.js" charset="utf-8" async="async"></script>
    <!-- お気に入り -->
    </div><br class="clear" />
    <h1><span class="title"> <a href="/">誰が1番つぶやいてるったー</a></span></h1>
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
<p>※こいつTweetしすぎだろ！アンフォローだ！みたいな使い方は推奨致しません。<br />
"ああ、たしかにこの人のアイコンよく見かけるなぁ"ぐらいでお使いください</p>
<h2><a href="signin">早速使ってみる</a></h2>
</div>
<div id="widget">
<script src="http://widgets.twimg.com/j/2/widget.js"></script>
<script>
new TWTR.Widget({
  version: 2,
  type: 'search',
  search: '#whoTweetFrequently',
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
</div>
</body>
</html>
