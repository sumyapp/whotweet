<%@page pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="css/global.css" type="text/css" />
<title>誰が一番つぶやいてるったー 調査結果</title>
<c:set var="i" value="0" />
</head>
<body>
<div id="header">
	<h1>誰が一番つぶやいてるったー 直近600件の調査結果</h1>
</div>
<div id="body">
<h2><c:out value="${screen_name}" />さんのタイムライン上でつぶやいている回数ランキング！</h2>
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
<div id="widget">
<c:out value="${view_screen_name}" />さんのTweet
<script src="http://widgets.twimg.com/j/2/widget.js"></script>
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
      background: '#333333',
      color: '#ffffff'
    },
    tweets: {
      background: '#000000',
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
</div>
</div>
<div id="footer"></div>
</body>
</html>
