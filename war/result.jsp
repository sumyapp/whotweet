<%@page pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="js/result_tweetarea.js"></script>
<meta name="description" content="あなたのTwitterのタイムライン上で誰が最もTweetしているかを表示するサービスです。こいつTweetしすぎだろ！アンフォローだ！みたいな使い方はあまり推奨は致しません。あくまで、「ああ、たしかにこの人のアイコンよく見かけるなぁ」ぐらいでお使いください">
<meta name="keywords" content="Twitter,フォロー,follow,unfollow,アンフォロー,フォロワー,ツイッター,タイムライン,TL,無料,tweet,ツイート">
<link href="css/global.css" rel="stylesheet" type="text/css" />
<title>誰が1番つぶやいてるったー</title>
</head>
<body>
<div id="content">
  <div id="header">
    <div id="logo"><a href="/"><img src="img/logo.jpg" alt="誰が1番つぶやいてるったー" /></a></div>
    <div class="social">
    <!-- Twitter -->
    <a href="http://twitter.com/share" class="twitter-share-button" data-count="vertical" data-via="sumyapp" data-lang="ja" data-url="http://who-tweet.appspot.com/" data-text="誰が1番つぶやいてるったー は自分のタイムライン上で誰が一番つぶやいてるかを知る事が出来るサービスです。 #whoTweetFrequently">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
    <!-- facebook -->
    <iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwho-tweet.appspot.com%2F&amp;layout=box_count&amp;show_faces=true&amp;width=80&amp;action=like&amp;colorscheme=light&amp;height=65" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:75px; height:60px;" allowTransparency="true"></iframe>
    <!-- はてぶ -->
    <a href="http://b.hatena.ne.jp/entry/http://who-tweet.appspot.com/" class="hatena-bookmark-button" data-hatena-bookmark-title="誰が1番つぶやいてるったー" data-hatena-bookmark-layout="vertical" title="このエントリーをはてなブックマークに追加"><img src="http://b.st-hatena.com/images/entry-button/button-only.gif" alt="このエントリーをはてなブックマークに追加" width="20" height="20" style="border: none;" /></a><script type="text/javascript" src="http://b.st-hatena.com/js/bookmark_button.js" charset="utf-8" async="async"></script>
    <!-- お気に入り -->
    </div><br class="clear" />
    <h1><span class="title"> <a href="/">誰が1番つぶやいてるったー 直近400件の調査結果</a></span></h1>
  </div>
  <h2><img src="img/icon_1.jpg" width="30" height="20" class="sp" /><c:out value="${screen_name}" />さんのタイムライン上でつぶやいている回数ランキング！</h2>
  <div id="tweet_area">
    <div id="tweet_area_form">
    <div id="tweet_area_menu">クイック編集(ぜひ押して下さい！下記メッセージにボタンと同様の内容を追記出来ます)<br />
      <input type="button" value="好きです！" onclick="love()" />
      <input type="button" value="いつも見てます！" onclick="always()" />
      <input type="button" value="おすすめ！" onclick="recommend()" />
    </div>
      <form method='get' action='http://twitter.com/home' name="twitter_tweet_form">
        <textarea name="status" rows="5" cols="60">私がフォローしている人の中で最近一番つぶやいているのは @<c:out value="${view_screen_name}" /> さんでした！ http://bit.ly/fI8zyA #whoTweetFrequently</textarea>
        <br />
        <input type="submit" value="つぶやく" />
      </form>
    </div>
  </div>
  <div id="ranking">
<c:forEach var="e" items="${tweet_count_list}">
<c:set var="u" value="${e.user}"/>
<c:set var="i" value="${i+1}" />
<div class="tweet_count">
	<span class="userImage">
		<a href="http://twitter.com/${f:h(u.screenName)}" title="${f:h(u.screenName)}" target="_blank"><img src="${f:h(u.profileImageURL)}" height=75 width=75 alt="${f:h(u.screenName)}"/></a>
	</span>
	<span class="userInfo">
		<c:out value="${i}" />位: ${f:h(e.tweetCount)}回: <a href="http://twitter.com/${f:h(u.screenName)}" target="_blank">${f:h(u.screenName)}</a><br />
		Tweet[${f:h(u.statusesCount)}] | Following[${f:h(u.friendsCount)}] | Followers[${f:h(u.followersCount)}]<br />
		${f:h(u.description)}
	</span>
</div>
</c:forEach>
  </div>
<div id="menu">
<div id="widget">
<script src="http://widgets.twimg.com/j/2/widget.js"></script>
<p>
<script>
new TWTR.Widget({
  version: 2,
  type: 'profile',
  rpp: 10,
  interval: 6000,
  width: 200,
  height: 800,
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
    loop: false,
    live: true,
    hashtags: true,
    timestamp: true,
    avatars: false,
    behavior: 'all'
  }
}).render().setUser('<c:out value="${view_screen_name}" />').start();
</script>
</p>
<p>
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
</p>
<br class="clear" />
</div>
    <br class="clear" />
  </div>
  <br class="clear" />
<div id="footer"> <a href="http://blog.sumyapp.com/">Copyright 2010 sumyapp, All rights reserved.</a> <span class="tweet_share_button"><a href="http://www.twitter.com/sumyapp"><img src="http://twitter-badges.s3.amazonaws.com/t_small-a.png" alt="sumyappをフォローしましょう"/></a></span> </div>
</div>
</body>
</html>