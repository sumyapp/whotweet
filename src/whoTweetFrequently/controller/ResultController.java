package whoTweetFrequently.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import twitter4j.Paging;
import twitter4j.ResponseList;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import whoTweetFrequently.model.TweetCount;

public class ResultController extends Controller {

    /** 調べる最大のTWEET数。800が最大 */
    public static int MAX_GET_TWEET = 400;
    /** ランキングの最大数 */
    public static int MAX_GET_USER = 30;
    /** 一回のTwitterへのリクエストで取得するツイート数 */
    public static final int GET_TWEET_COUNT_AT_ONCE = 200;

    @SuppressWarnings("unchecked")
    @Override
    public Navigation run() throws Exception {
        // このファクトリインスタンスは再利用可能でスレッドセーフです
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            request.setAttribute("errmsg", "例外エラーが発生しました。時間をおいてお試しください。");
            return forward("index.jsp");
        }

        Twitter twitter =
            (Twitter) request.getSession().getAttribute("twitter");
        try {
            request.setAttribute("screen_name", twitter.getScreenName());
            request.setAttribute(
                "tweet_count_list",
                getTweetCountList(twitter, MAX_GET_TWEET));
            request.setAttribute(
                "view_screen_name",
                ((ArrayList<TweetCount>) request
                    .getAttribute("tweet_count_list"))
                    .get(0)
                    .getUser()
                    .getScreenName());
        } catch (TwitterException e) {
            // エラーの場合
            request.setAttribute("errmsg", "Twitterとの通信に失敗しました。時間をおいてお試しください。");
            return forward("index.jsp");
        } catch (IllegalStateException e) {
            // エラーの場合
            request.setAttribute("errmsg", "Twitterとの通信に失敗しました。時間をおいてお試しください。");
            return forward("index.jsp");
        } catch (Exception e) {
            request.setAttribute("errmsg", "Twitterとの通信に失敗しました。時間をおいてお試しください。");
            return forward("index.jsp");
        }

        return forward("result.jsp");
    }

    private ArrayList<TweetCount> getTweetCountList(Twitter twitter, int max)
            throws TwitterException {
        // タイムラインを取得
        HashMap<Integer, TweetCount> countMap =
            new HashMap<Integer, TweetCount>();

        // System.out.println("getTweetCountList: Got home timeline, timeline = "
        // + twitter.getHomeTimeline().toString());
        ResponseList<Status> statuses =
            twitter.getHomeTimeline(new Paging(1, GET_TWEET_COUNT_AT_ONCE));
        int imax = max / GET_TWEET_COUNT_AT_ONCE + 1;
        for (int i = 2; i < imax; i++) {
            statuses.addAll(twitter.getHomeTimeline(new Paging(
                i,
                GET_TWEET_COUNT_AT_ONCE)));
        }
        // Userごとに出現数をカウント
        for (Status status : statuses) {
            if (countMap.containsKey(status.getUser().getId())) {
                TweetCount tw = countMap.get(status.getUser().getId());
                tw.setTweetCount(tw.getTweetCount() + 1);
            } else {
                TweetCount tw = new TweetCount();
                tw.setUser(status.getUser());
                tw.setTweetCount(1);
                countMap.put(status.getUser().getId(), tw);
            }
        }

        // System.out.println("getTweetCountList: Start sort, countMap = " +
        // countMap.toString());

        ArrayList<TweetCount> sortedList = new ArrayList<TweetCount>();
        for (int i = 0; i < countMap.values().size(); i++) {
            int maxCount = 0;
            int maxCountUserKey = 0;
            for (TweetCount tw : countMap.values()) {
                // System.out.print("■");
                if (tw.getTweetCount() > maxCount) {
                    // System.out.print("□");
                    maxCount = tw.getTweetCount();
                    maxCountUserKey = tw.getUser().getId();
                }
            }
            sortedList.add(countMap.get(maxCountUserKey));
            countMap.remove(maxCountUserKey);
            if (sortedList.size() >= MAX_GET_USER) {
                return sortedList;
            }
            // System.out.print("\n");
        }
        return sortedList;
    }
}
